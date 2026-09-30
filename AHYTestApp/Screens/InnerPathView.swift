import SwiftUI

struct InnerPathView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) private var dismiss
    @State private var toast: String?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                header
                liveCard
                Button {
                    toast = "Joining the sitting…"
                } label: {
                    Text("Join the sitting").frame(maxWidth: .infinity)
                }
                .buttonStyle(AHYPillButtonStyle())

                SectionKicker(text: "ADVANCED PRACTICES", color: AHYColor.saffron)
                VStack(spacing: 0) {
                    ForEach(Array(SampleData.innerPractices.enumerated()), id: \.element.id) { i, practice in
                        RowView(
                            icon: practice.icon,
                            title: practice.title.lowercased(),
                            subtitle: practice.subtitle,
                            first: i == 0,
                            dark: true
                        ) {
                            path.append(Route.player(practice))
                        }
                    }
                }
                Text("Sittings are recorded and stay for seven days.")
                    .font(AHYFont.body(11.5))
                    .foregroundStyle(.white.opacity(0.55))
            }
            .padding(22)
        }
        .background(AHYNavyBackground())
        .navigationBarHidden(true)
        .ahyToast($toast)
    }

    private var header: some View {
        HStack {
            Button { dismiss() } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.white)
                    .frame(width: 38, height: 38)
                    .background(Circle().fill(.white.opacity(0.06)))
                    .overlay(Circle().stroke(.white.opacity(0.28)))
            }
            VStack(alignment: .leading, spacing: 2) {
                Text("The inner path").font(AHYFont.heading(17)).foregroundStyle(.white)
                Text("अन्तरङ्ग · Antaranga").font(AHYFont.devanagari(12.5)).foregroundStyle(AHYColor.saffron)
            }
            Spacer()
        }
    }

    private var liveCard: some View {
        ZStack(alignment: .bottomLeading) {
            MountainRidgeView(palette: .dusk).frame(height: 170)
            LinearGradient(colors: [AHYColor.navyDeep.opacity(0.95), .clear, AHYColor.navyDeep.opacity(0.4)], startPoint: .bottom, endPoint: .top)
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Circle().fill(AHYColor.saffron).frame(width: 6, height: 6)
                    Text("LIVE NOW")
                        .font(AHYFont.body(10.5, weight: .semibold))
                        .tracking(2)
                        .foregroundStyle(AHYColor.saffron)
                }
                Text("evening satsang").font(AHYFont.heading(19)).foregroundStyle(.white)
                Text("with Guru ji · English · 412 sitting")
                    .font(AHYFont.body(12.5))
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding(18)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    NavigationStack { InnerPathView(path: .constant(NavigationPath())) }
}
