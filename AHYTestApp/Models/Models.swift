import Foundation

enum PracticeCategory: String, CaseIterable, Identifiable, Hashable {
    case meditation = "Meditation"
    case asana = "Asana"
    case mudra = "Mudra"
    case pranayama = "Pranayama"
    var id: String { rawValue }
}

struct Practice: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let duration: String
    let category: PracticeCategory
    var locked: Bool = false
    let icon: String
}

enum TierStyle {
    case open, daily, inner
}

struct Tier: Identifiable {
    let id = UUID()
    let name: String
    let sanskrit: String
    let price: String
    let period: String
    let bullets: [String]
    let style: TierStyle
}
