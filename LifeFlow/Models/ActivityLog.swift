import Foundation
import SwiftData

@Model
public final class ActivityLog {
    @Attribute(.unique) public var id: UUID
    public var templateId: UUID
    public var dateKey: String // Date formatted as "yyyy-MM-dd"
    public var date: Date
    public var statusRaw: String

    public init(id: UUID = UUID(), templateId: UUID, date: Date, status: String) {
        self.id = id
        self.templateId = templateId
        self.date = date
        self.statusRaw = status
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.dateKey = formatter.string(from: date)
    }

    public var status: String {
        get { statusRaw }
        set { statusRaw = newValue }
    }
}
