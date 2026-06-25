import Foundation

public enum Category: String, Codable, CaseIterable, Identifiable {
    case ecole = "école"
    case sport = "sport"
    case famille = "famille"
    case devoirs = "devoirs"
    case repos = "repos"
    case objectif = "objectif personnel"
    case autre = "autre"

    public var id: String { rawValue }

    public var displayName: String {
        switch self {
        case .ecole: return "École"
        case .sport: return "Sport"
        case .famille: return "Famille"
        case .devoirs: return "Devoirs"
        case .repos: return "Repos"
        case .objectif: return "Objectif personnel"
        case .autre: return "Autre"
        }
    }
    
    public var defaultEmoji: String {
        switch self {
        case .ecole: return "📚"
        case .sport: return "🏃‍♂️"
        case .famille: return "❤️"
        case .devoirs: return "📝"
        case .repos: return "😴"
        case .objectif: return "🎯"
        case .autre: return "⚙️"
        }
    }

    public var defaultColorHex: String {
        switch self {
        case .ecole: return "#3A86F0"       // Vibrant Blue
        case .sport: return "#38B000"       // Neon Green
        case .famille: return "#FF006E"     // Hot Pink
        case .devoirs: return "#FF7B00"     // Tangerine Orange
        case .repos: return "#7209B7"       // Electric Purple
        case .objectif: return "#FFB703"    // Sunflower Yellow
        case .autre: return "#8D99AE"       // Cool Slate Gray
        }
    }
}
