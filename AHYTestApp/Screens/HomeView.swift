import SwiftUI

struct HomeView: View {
    @Binding var path: NavigationPath
    @State private var toast: String?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header
                featuredCard
                    .padding(.top, 20)
                alsoOpenSection
                    .padding(.top, 28)
                VStack(spacing: 10) {
                    FlourishView()
                    Text("Go deeper when you are ready — never before.")
                        .font(AHYFont.body(11.5))
                        .foregroundStyle(AHYColor.gold)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding(.top, 24)
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 22)
        }
        .background(AHYColor.bg.ignoresSafeArea())
        .safeAreaInset(edge: .bottom) { MarqueeView() }
        .ahyToast($toast)
        .navigationBarHidden(true)
    }

    private var header: some View {
        HStack(alignment: .center) {
            HStack(spacing: 12) {
                Text("अ").font(AHYFont.devanagari(26)).foregroundStyle(LinearGradient.ahySunrise)
                VStack(alignment: .leading, spacing: 2) {
                    Text("MON · 28 SEPT")
                        .font(AHYFont.body(11, weight: .semibold))
                        .tracking(2)
                        .foregroundStyle(AHYColor.gold)
                    Text("Come, sit with the mountains")
                        .font(AHYFont.heading(14))
                        .foregroundStyle(AHYColor.ink)
                }
            }
            Spacer()
            Button { path.append(Route.profile) } label: {
                Circle()
                    .fill(LinearGradient.ahyAvatar)
                    .overlay(Circle().stroke(AHYColor.saffron, lineWidth: 1.5))
                    .overlay(Text("A").font(AHYFont.heading(13)).foregroundStyle(AHYColor.saffron))
                    .frame(width: 34, height: 34)
            }
        }
        .padding(.vertical, 14)
    }

    private var featuredCard: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("FREE TO SIT · TODAY")
                .font(AHYFont.body(10.5, weight: .semibold))
                .tracking(3)
                .foregroundStyle(AHYColor.saffron)
            Text("mahashunya omkar dhyana")
                .font(AHYFont.heading(21))
                .foregroundStyle(.white)
            Text("Twelve minutes of guided stillness — breath, the Omkar, then silence.")
                .font(AHYFont.body(13.5))
                .foregroundStyle(.white.opacity(0.7))
            HStack(spacing: 16) {
                Label("12 min", systemImage: "clock")
                Label("Guided · English", systemImage: "waveform")
            }
            .font(AHYFont.body(11.5, weight: .medium))
            .foregroundStyle(.white.opacity(0.75))
            .padding(.top, 6)
            Button {
                path.append(Route.player(SampleData.featuredPractice))
            } label: {
                Label("Begin", systemImage: "play.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(AHYPillButtonStyle())
            .padding(.top, 10)
        }
        .padding(20)
        .background(LinearGradient.ahyNavyCard)
        .overlay(alignment: .bottomTrailing) {
            Text("अ")
                .font(AHYFont.devanagari(150))
                .foregroundStyle(.white.opacity(0.06))
                .offset(x: 16, y: 40)
        }
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }

    private var alsoOpenSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionKicker(text: "ALSO OPEN TO ALL")
                .padding(.bottom, 10)
            RowView(
                icon: "figure.mind.and.body",
                title: "morning yoga abhyas",
                subtitle: "24 min · asana and breath · free",
                first: true
            ) {
                path.append(Route.player(SampleData.openPractices[1]))
            }
            RowView(
                icon: "book",
                title: "the guru's words",
                subtitle: "A shloka and a teaching, each week"
            ) {
                toast = "See this under the About AHY tab"
            }
        }
    }
}

#Preview {
    HomeTab()
}
