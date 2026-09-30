import SwiftUI

extension Color {
    init(hex: UInt32, opacity: Double = 1) {
        let r = Double((hex >> 16) & 0xFF) / 255
        let g = Double((hex >> 8) & 0xFF) / 255
        let b = Double(hex & 0xFF) / 255
        self.init(.sRGB, red: r, green: g, blue: b, opacity: opacity)
    }
}

/// Brand palette taken from the AHY clickable prototype (navy + gold, Himalayan theme).
enum AHYColor {
    static let gold = Color(hex: 0xAE8943)
    static let saffron = Color(hex: 0xE9A537)
    static let navy = Color(hex: 0x02223D)
    static let navy2 = Color(hex: 0x033559)
    static let navyDeep = Color(hex: 0x01192D)
    static let navyGlow = Color(hex: 0x0A3A63)
    static let ink = Color(hex: 0x011E36)
    static let ink2 = Color(hex: 0x4B5563)
    static let bg = Color(hex: 0xFDF9F3)
    static let bg2 = Color(hex: 0xF9F3E7)
    static let line = Color(hex: 0x02223D, opacity: 0.12)
}

/// The prototype uses Outfit (headings), Inter (body) and Tiro Devanagari Sanskrit (the अ mark).
/// Those aren't system fonts — these helpers use SF Pro Rounded as a close stand-in so the app
/// builds and runs without any extra font files. Drop the real .ttf files into the target and
/// swap `.system(...)` for `.custom(...)` here to match the prototype exactly.
enum AHYFont {
    static func heading(_ size: CGFloat, weight: Font.Weight = .semibold) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
    static func body(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .default)
    }
    static func devanagari(_ size: CGFloat) -> Font {
        .system(size: size, weight: .medium, design: .serif)
    }
}

extension LinearGradient {
    static let ahySunrise = LinearGradient(colors: [Color(hex: 0xE5952A), Color(hex: 0xFFD158)], startPoint: .leading, endPoint: .trailing)
    static let ahyNavyCard = LinearGradient(colors: [AHYColor.navy2, AHYColor.navy, AHYColor.navyDeep], startPoint: .top, endPoint: .bottom)
    static let ahyAvatar = LinearGradient(colors: [AHYColor.navy2, AHYColor.navy], startPoint: .top, endPoint: .bottom)
}

/// The deep navy radial background used on the Opening, Player and Inner Path screens.
struct AHYNavyBackground: View {
    var body: some View {
        RadialGradient(colors: [AHYColor.navyGlow, AHYColor.navy, AHYColor.navyDeep], center: .top, startRadius: 20, endRadius: 650)
            .ignoresSafeArea()
    }
}
