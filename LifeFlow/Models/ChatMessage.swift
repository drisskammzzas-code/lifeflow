import Foundation
import SwiftData

@Model
public final class ChatMessage {
    @Attribute(.unique) public var id: UUID
    public var text: String
    public var timestamp: Date
    public var isUser: Bool

    public init(id: UUID = UUID(), text: String, timestamp: Date = Date(), isUser: Bool) {
        self.id = id
        self.text = text
        self.timestamp = timestamp
        self.isUser = isUser
    }
}
