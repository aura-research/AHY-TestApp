import SwiftUI

// MARK: - Button styles

struct AHYPillButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AHYFont.body(12.5, weight: .semibold))
            .textCase(.uppercase)
            .tracking(1.5)
            .foregroundStyle(.white)
            .padding(.vertical, 16)
            .background(AHYColor.saffron, in: Capsule())
            .opacity(configuration.isPressed ? 0.85 : 1)
    }
}

struct AHYNavyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AHYFont.body(11, weight: .semibold))
            .foregroundStyle(.white)
            .padding(.vertical, 11)
            .padding(.horizontal, 18)
            .background(AHYColor.navy, in: RoundedRectangle(cornerRadius: 8))
            .opacity(configuration.isPressed ? 0.85 : 1)
    }
}

struct AHYOutlineButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AHYFont.body(11.5, weight: .semibold))
            .textCase(.uppercase)
            .tracking(2)
            .foregroundStyle(.white)
            .padding(.vertical, 13)
            .padding(.horizontal, 26)
            .overlay(Capsule().stroke(.white.opacity(0.45), lineWidth: 1))
            .opacity(configuration.isPressed ? 0.85 : 1)
    }
}

// MARK: - Small building blocks

struct SectionKicker: View {
    let text: String
    var color: Color = AHYColor.gold
    var body: some View {
        HStack(spacing: 10) {
            Rectangle().fill(color).frame(width: 24, height: 1)
            Text(text)
                .font(AHYFont.body(10.5, weight: .semibold))
                .tracking(3)
                .foregroundStyle(color)
        }
    }
}

struct FlourishView: View {
    var body: some View {
        HStack(spacing: 8) {
            Rectangle().fill(AHYColor.gold.opacity(0.5)).frame(width: 40, height: 1)
            Circle().fill(AHYColor.gold).frame(width: 4, height: 4)
            Image(systemName: "sparkle").font(.system(size: 11)).foregroundStyle(AHYColor.gold)
            Circle().fill(AHYColor.gold).frame(width: 4, height: 4)
            Rectangle().fill(AHYColor.gold.opacity(0.5)).frame(width: 40, height: 1)
        }
        .frame(maxWidth: .infinity)
    }
}

/// A tappable list row used throughout the app (Home, Library, About, Offline…).
struct RowView: View {
    let icon: String
    let title: String
    let subtitle: String
    var first: Bool = false
    var locked: Bool = false
    var dark: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12).fill(dark ? Color.white.opacity(0.08) : AHYColor.bg2)
                    Image(systemName: icon).foregroundStyle(dark ? AHYColor.saffron : AHYColor.gold)
                }
                .frame(width: 40, height: 40)
                .opacity(locked ? 0.5 : 1)

                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(AHYFont.heading(15.5))
                        .foregroundStyle(titleColor)
                    Text(subtitle)
                        .font(AHYFont.body(12))
                        .foregroundStyle(subtitleColor)
                    if locked {
                        Label("Opens with the inner path", systemImage: "mountain.2")
                            .font(AHYFont.body(11.5, weight: .medium))
                            .foregroundStyle(AHYColor.gold)
                    }
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(dark ? AHYColor.saffron : AHYColor.gold)
            }
            .padding(.vertical, 14)
            .overlay(alignment: .top) {
                if !first {
                    Rectangle().fill(dark ? Color.white.opacity(0.12) : AHYColor.line).frame(height: 1)
                }
            }
        }
        .buttonStyle(.plain)
    }

    private var titleColor: Color {
        if dark { return .white }
        return locked ? AHYColor.ink.opacity(0.5) : AHYColor.ink
    }
    private var subtitleColor: Color {
        if dark { return .white.opacity(0.65) }
        return locked ? AHYColor.ink2.opacity(0.5) : AHYColor.ink2
    }
}

/// One of the three pricing tiers on the Offerings screen.
struct TierCardView: View {
    let tier: Tier
    var tap: () -> Void
    var primaryAction: (() -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 3) {
                    Text(tier.name).font(AHYFont.heading(19)).foregroundStyle(textColor)
                    Text(tier.sanskrit).font(AHYFont.devanagari(12.5)).foregroundStyle(AHYColor.saffron)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text(tier.price).font(AHYFont.heading(17)).foregroundStyle(textColor)
                    Text(tier.period).font(AHYFont.body(12.5)).foregroundStyle(secondaryTextColor)
                }
            }
            VStack(alignment: .leading, spacing: 7) {
                ForEach(tier.bullets, id: \.self) { bullet in
                    HStack(alignment: .top, spacing: 8) {
                        Circle().fill(AHYColor.saffron).frame(width: 5, height: 5).padding(.top, 6)
                        Text(bullet).font(AHYFont.body(12.5)).foregroundStyle(secondaryTextColor)
                    }
                }
            }
            if tier.style == .daily, let primaryAction {
                Button("Enroll Now", action: primaryAction)
                    .buttonStyle(AHYPillButtonStyle())
                    .frame(maxWidth: .infinity)
            }
            if tier.style == .inner {
                Text("Read More")
                    .font(AHYFont.body(12, weight: .semibold))
                    .textCase(.uppercase)
                    .tracking(1.5)
                    .foregroundStyle(AHYColor.saffron)
            }
        }
        .padding(18)
        .background(background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(borderColor, lineWidth: tier.style == .inner ? 0 : 1)
        )
        .contentShape(RoundedRectangle(cornerRadius: 16))
        .onTapGesture(perform: tap)
    }

    private var textColor: Color { tier.style == .inner ? .white : AHYColor.ink }
    private var secondaryTextColor: Color { tier.style == .inner ? .white.opacity(0.75) : AHYColor.ink2 }
    private var borderColor: Color { tier.style == .daily ? AHYColor.gold : AHYColor.line }
    @ViewBuilder private var background: some View {
        switch tier.style {
        case .open, .daily: Color.white
        case .inner: LinearGradient.ahyNavyCard
        }
    }
}

/// A small practice tile used in the two-up grid on the Open tier screen.
struct PracticeTileView: View {
    let practice: Practice
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 0) {
                MountainRidgeView(palette: .snow).frame(height: 78)
                VStack(alignment: .leading, spacing: 2) {
                    Text(practice.title).font(AHYFont.heading(13.5)).foregroundStyle(AHYColor.ink)
                    Text("\(practice.duration) · \(practice.subtitle)").font(AHYFont.body(11)).foregroundStyle(AHYColor.ink2)
                }
                .padding(12)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(AHYColor.line))
        }
        .buttonStyle(.plain)
    }
}

/// A stylised, hand-drawn mountain ridge used as a photo stand-in (the prototype uses real photography).
struct MountainRidgeView: View {
    enum Palette { case snow, dusk, river }
    var palette: Palette = .snow

    private var colors: [Color] {
        switch palette {
        case .snow: return [Color(hex: 0x8FA8BD), Color(hex: 0xC9D6E0), Color(hex: 0xE9EFF3)]
        case .dusk: return [Color(hex: 0x24405C), Color(hex: 0x4D5A63), Color(hex: 0xB98F52)]
        case .river: return [Color(hex: 0x3F6480), Color(hex: 0x6F8A92), Color(hex: 0xA9B5AD)]
        }
    }

    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width, h = geo.size.height
            ZStack {
                colors[0]
                Path { p in
                    p.move(to: CGPoint(x: 0, y: h * 0.62))
                    p.addLine(to: CGPoint(x: w * 0.15, y: h * 0.4))
                    p.addLine(to: CGPoint(x: w * 0.25, y: h * 0.53))
                    p.addLine(to: CGPoint(x: w * 0.38, y: h * 0.3))
                    p.addLine(to: CGPoint(x: w * 0.53, y: h * 0.5))
                    p.addLine(to: CGPoint(x: w * 0.65, y: h * 0.39))
                    p.addLine(to: CGPoint(x: w * 0.8, y: h * 0.56))
                    p.addLine(to: CGPoint(x: w * 0.91, y: h * 0.44))
                    p.addLine(to: CGPoint(x: w, y: h * 0.58))
                    p.addLine(to: CGPoint(x: w, y: h))
                    p.addLine(to: CGPoint(x: 0, y: h))
                    p.closeSubpath()
                }
                .fill(colors[1].opacity(0.75))
                Path { p in
                    p.move(to: CGPoint(x: 0, y: h * 0.75))
                    p.addLine(to: CGPoint(x: w * 0.13, y: h * 0.58))
                    p.addLine(to: CGPoint(x: w * 0.27, y: h * 0.7))
                    p.addLine(to: CGPoint(x: w * 0.42, y: h * 0.53))
                    p.addLine(to: CGPoint(x: w * 0.55, y: h * 0.68))
                    p.addLine(to: CGPoint(x: w * 0.69, y: h * 0.57))
                    p.addLine(to: CGPoint(x: w * 0.83, y: h * 0.71))
                    p.addLine(to: CGPoint(x: w, y: h * 0.61))
                    p.addLine(to: CGPoint(x: w, y: h))
                    p.addLine(to: CGPoint(x: 0, y: h))
                    p.closeSubpath()
                }
                .fill(colors[2].opacity(0.6))
            }
        }
        .clipped()
    }
}

/// The breathing rings + Omkar glyph shown on the meditation player screen.
struct BreathingRingsView: View {
    @State private var animate = false
    var body: some View {
        ZStack {
            ForEach(0..<3, id: \.self) { i in
                Circle()
                    .stroke(AHYColor.saffron.opacity(0.3 + Double(i) * 0.2), lineWidth: 1)
                    .frame(width: 236 - CGFloat(i) * 50, height: 236 - CGFloat(i) * 50)
                    .scaleEffect(animate ? 1.02 : 0.9)
                    .animation(
                        .easeInOut(duration: 5).repeatForever(autoreverses: true).delay(Double(i) * 0.35),
                        value: animate
                    )
            }
            Text("ॐ")
                .font(AHYFont.devanagari(44))
                .foregroundStyle(AHYColor.saffron)
        }
        .frame(width: 236, height: 236)
        .onAppear { animate = true }
    }
}

/// The scrolling word strip ("Yoga · Dhyana · Pranayama · …") on the Home screen.
struct MarqueeView: View {
    private let words = ["Yoga", "Dhyana", "Pranayama", "Kriya", "Seva", "Swadhyaya", "Tapas", "Satsang"]
    @State private var animate = false

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 24) {
                ForEach(Array((words + words).enumerated()), id: \.offset) { _, word in
                    HStack(spacing: 13) {
                        Text(word.uppercased())
                            .font(AHYFont.heading(12.5, weight: .medium))
                            .foregroundStyle(AHYColor.ink)
                        Circle().fill(AHYColor.saffron).frame(width: 3, height: 3)
                    }
                }
            }
            .fixedSize()
            .offset(x: animate ? -geo.size.width : 0)
            .animation(.linear(duration: 16).repeatForever(autoreverses: false), value: animate)
            .onAppear { animate = true }
        }
        .frame(height: 34)
        .clipped()
        .background(AHYColor.bg2)
        .overlay(Rectangle().fill(AHYColor.line).frame(height: 1), alignment: .top)
        .overlay(Rectangle().fill(AHYColor.line).frame(height: 1), alignment: .bottom)
    }
}

/// The five-week practice calendar on the Profile screen.
struct PracticeCalendarView: View {
    private let practicedDays: Set<Int> = [1, 2, 4, 5, 6, 8, 9, 11, 12, 13, 15, 16, 18, 19, 20, 22, 23, 25, 26]
    private let today = 28
    private let totalDays = 30
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                ForEach(Array(["M", "T", "W", "T", "F", "S", "S"].enumerated()), id: \.offset) { _, d in
                    Text(d)
                        .font(.caption2.weight(.semibold))
                        .foregroundStyle(AHYColor.ink2.opacity(0.6))
                        .frame(maxWidth: .infinity)
                }
            }
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(1...35, id: \.self) { day in
                    Circle()
                        .fill(fillColor(for: day))
                        .overlay(day == today ? Circle().stroke(AHYColor.saffron, lineWidth: 1.5) : nil)
                        .frame(height: 30)
                        .opacity(day > totalDays ? 0.15 : 1)
                }
            }
        }
    }

    private func fillColor(for day: Int) -> Color {
        if day > totalDays { return AHYColor.ink.opacity(0.03) }
        if practicedDays.contains(day) { return AHYColor.saffron }
        return AHYColor.ink.opacity(0.07)
    }
}

// MARK: - Toast

struct ToastModifier: ViewModifier {
    @Binding var message: String?
    func body(content: Content) -> some View {
        content.overlay(alignment: .bottom) {
            if let message {
                Text(message)
                    .font(AHYFont.body(12.5, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 11)
                    .background(AHYColor.navy, in: Capsule())
                    .padding(.bottom, 90)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                            withAnimation { self.message = nil }
                        }
                    }
            }
        }
        .animation(.easeInOut(duration: 0.25), value: message)
    }
}

extension View {
    func ahyToast(_ message: Binding<String?>) -> some View {
        modifier(ToastModifier(message: message))
    }
}
