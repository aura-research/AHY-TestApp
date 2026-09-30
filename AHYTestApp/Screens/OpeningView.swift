import SwiftUI

struct OpeningView: View {
    var body: some View {
        ZStack {
            AHYNavyBackground()

            VStack(spacing: 22) {
                Text("अ")
                    .font(AHYFont.devanagari(96))
                    .foregroundStyle(LinearGradient.ahySunrise)
                Text("A HIMALAYAN YOGI")
                    .font(AHYFont.body(14, weight: .semibold))
                    .tracking(6)
                    .foregroundStyle(.white)
                Rectangle()
                    .fill(AHYColor.saffron)
                    .frame(width: 44, height: 1)
                Text("The Way of a Himalayan Yogi.")
                    .font(AHYFont.body(14))
                    .foregroundStyle(.white.opacity(0.75))
            }

            VStack {
                Spacer()
                Text("ADVAIT YOG · RISHIKESH · INDIA")
                    .font(AHYFont.body(10, weight: .semibold))
                    .tracking(3)
                    .foregroundStyle(.white.opacity(0.4))
                    .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    OpeningView()
}
