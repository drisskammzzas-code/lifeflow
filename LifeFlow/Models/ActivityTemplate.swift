import Foundation
import SwiftData

@Model
public final class ActivityTemplate {
    @Attribute(.unique) public var id: UUID
    public var name: String
    public var isRecurring: Bool
    public var dayOfWeekRaw: Int // Raw rawValue for DayOfWeek
    public var specificDate: Date? // Used if isRecurring is false
    public var startHour: Int
    public var startMinute: Int
    public var endHour: Int
    public var endMinute: Int
    public var categoryRaw: String // Raw value for Category
    public var colorHex: String // Color picker hex code
    public var iconEmoji: String // Customized emoji string
    public var note: String
    public var reminderOffsetMinutes: Int // -1: none, 0: exact, 5, 10, 30 mins before

    public init(id: UUID = UUID(),
                name: String,
                isRecurring: Bool = true,
                dayOfWeek: DayOfWeek = .monday,
                specificDate: Date? = nil,
                startHour: Int,
                startMinute: Int,
                endHour: Int,
                endMinute: Int,
                category: Category,
                colorHex: String,
                iconEmoji: String,
                note: String = "",
                reminderOffsetMinutes: Int = -1) {
        self.id = id
        self.name = name
        self.isRecurring = isRecurring
        self.dayOfWeekRaw = dayOfWeek.rawValue
        
        // Normalize date to midnight if set
        if let specificDate = specificDate {
            let calendar = Calendar.current
            self.specificDate = calendar.startOfDay(for: specificDate)
        } else {
            self.specificDate = nil
        }
        
        self.startHour = startHour
        self.startMinute = startMinute
        self.endHour = endHour
        self.endMinute = endMinute
        self.categoryRaw = category.rawValue
        self.colorHex = colorHex
        self.iconEmoji = iconEmoji
        self.note = note
        self.reminderOffsetMinutes = reminderOffsetMinutes
    }

    public var dayOfWeek: DayOfWeek {
        get { DayOfWeek(rawValue: dayOfWeekRaw) ?? .monday }
        set { dayOfWeekRaw = newValue.rawValue }
    }

    public var category: Category {
        get { Category(rawValue: categoryRaw) ?? .autre }
        set { categoryRaw = newValue.rawValue }
    }

    public var startTimeString: String {
        String(format: "%02dh%02d", startHour, startMinute)
    }

    public var endTimeString: String {
        String(format: "%02dh%02d", endHour, endMinute)
    }
    
    public var totalMinutesFromMidnight: Int {
        (startHour * 60) + startMinute
    }
}
