import Foundation
import UserNotifications

public final class NotificationManager: NSObject, ObservableObject {
    public static let shared = NotificationManager()
    
    @Published public var isAuthorized: Bool = false
    
    private override init() {
        super.init()
        checkAuthorization()
    }
    
    public func checkAuthorization() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.isAuthorized = (settings.authorizationStatus == .authorized)
            }
        }
    }
    
    public func requestAuthorization(completion: @escaping (Bool) -> Void = { _ in }) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                self.isAuthorized = granted
                completion(granted)
            }
        }
    }
    
    public func scheduleNotification(for template: ActivityTemplate) {
        cancelNotification(for: template)
        
        guard template.reminderOffsetMinutes >= 0 else { return }
        
        let content = UNMutableNotificationContent()
        content.title = "⏰ C'est l'heure : \(template.name)"
        content.body = "Ton activité \(template.category.displayName) commence à \(template.startTimeString) ! Note: \(template.note.isEmpty ? "Reste concentré !" : template.note)"
        content.sound = .default
        
        let calendar = Calendar.current
        
        if template.isRecurring {
            // Weekly repeating reminder
            var triggerMinute = template.startMinute - template.reminderOffsetMinutes
            var triggerHour = template.startHour
            var triggerWeekday = template.dayOfWeek.rawValue // 1 = Sunday, 2 = Monday...
            
            if triggerMinute < 0 {
                triggerMinute += 60
                triggerHour -= 1
                if triggerHour < 0 {
                    triggerHour += 24
                    triggerWeekday -= 1
                    if triggerWeekday < 1 {
                        triggerWeekday = 7
                    }
                }
            }
            
            var dateComponents = DateComponents()
            dateComponents.weekday = triggerWeekday
            dateComponents.hour = triggerHour
            dateComponents.minute = triggerMinute
            dateComponents.second = 0
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let request = UNNotificationRequest(identifier: template.id.uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
        } else if let specificDate = template.specificDate {
            // One-off date-specific reminder
            var components = calendar.dateComponents([.year, .month, .day], from: specificDate)
            components.hour = template.startHour
            components.minute = template.startMinute
            components.second = 0
            
            guard let scheduledDate = calendar.date(from: components) else { return }
            guard let triggerDate = calendar.date(byAdding: .minute, value: -template.reminderOffsetMinutes, to: scheduledDate) else { return }
            
            // Only schedule if trigger date is in the future
            if triggerDate > Date() {
                let triggerComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: triggerDate)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerComponents, repeats: false)
                let request = UNNotificationRequest(identifier: template.id.uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    public func cancelNotification(for template: ActivityTemplate) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [template.id.uuidString])
    }
    
    public func cancelAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    public func rescheduleAll(templates: [ActivityTemplate]) {
        cancelAllNotifications()
        for template in templates {
            scheduleNotification(for: template)
        }
    }
    
    public func sendInstantTestNotification() {
        let content = UNMutableNotificationContent()
        content.title = "🦋 Rappel en arrière-plan"
        content.body = "Bravo, ton rappel native fonctionne même en écran verrouillé ! 🚀"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "test_notification_native", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
