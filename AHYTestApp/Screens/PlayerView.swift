import SwiftUI

struct PlayerView: View {
    let practice: Practice
    @State private var isPlaying = true
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            AHYNavyBackground()

            VStack(spacing: 0) {
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.white)
                            .frame(width: 38, height: 38)
                            .background(Circle().fill(.white.opacity(0.06)))
                            .overlay(Circle().stroke(.white.opacity(0.28)))
                    }
                    Spacer()
                    Text(practice.title.lowercased())
                        .font(AHYFont.heading(13))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "speaker.wave.2")
                        .foregroundStyle(.white)
                        .frame(width: 38, height: 38)
                }
                .padding(.horizontal, 22)
                .padding(.top, 12)

                Spacer()

                BreathingRingsView()

                Text("07:41")
                    .font(.system(size: 50, weight: .light, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 24)

                Text("BREATHE IN — FOUR COUNTS")
                    .font(AHYFont.body(11, weight: .semibold))
                    .tracking(2)
                    .foregroundStyle(AHYColor.saffron)
                    .padding(.top, 10)

                HStack(spacing: 26) {
                    stage(label: "Breath", active: false)
                    stage(label: "Omkar", active: true)
                    stage(label: "Silence", active: false)
                }
                .padding(.top, 24)

                Spacer()

                Button {
                    isPlaying.toggle()
                } label: {
                    Label(isPlaying ? "Pause" : "Resume", systemImage: isPlaying ? "pause.fill" : "play.fill")
                }
                .buttonStyle(AHYOutlineButtonStyle())

                Text("Guided by Advait Yogbhushan Ji")
                    .font(AHYFont.body(11.5))
                    .foregroundStyle(.white.opacity(0.55))
                    .padding(.top, 16)
                    .padding(.bottom, 26)
            }
        }
        .navigationBarHidden(true)
    }

    private func stage(label: String, active: Bool) -> some View {
        VStack(spacing: 7) {
            Circle()
                .fill(active ? AHYColor.saffron : .white)
                .frame(width: 6, height: 6)
                .opacity(active ? 1 : 0.45)
            Text(label)
                .font(AHYFont.body(10.5, weight: active ? .semibold : .regular))
                .foregroundStyle(active ? AHYColor.saffron : .white.opacity(0.45))
        }
    }
}

#Preview {
    PlayerView(practice: SampleData.featuredPractice)
}
