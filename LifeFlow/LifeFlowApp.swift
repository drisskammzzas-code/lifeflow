import SwiftUI
import SwiftData

@main
struct LifeFlowApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .modelContainer(for: [
                    ActivityTemplate.self,
                    ActivityLog.self,
                    ChatMessage.self
                ])
                .onAppear {
                    // Trigger notification prompt on launch
                    NotificationManager.shared.requestAuthorization()
                }
        }
    }
}
