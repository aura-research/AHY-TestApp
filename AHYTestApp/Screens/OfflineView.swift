import SwiftUI

/// The offline state shown when the device has no connection. In a real app this would be
/// driven by NWPathMonitor; here it's a standalone screen reachable for demo purposes.
struct OfflineView: View {
    @Binding var path: NavigationPath

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    HStack(spacing: 12) {
                        Text("अ").font(AHYFont.devanagari(26)).foregroundStyle(LinearGradient.ahySunrise)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("TUE · 29 SEPT")
                                .font(AHYFont.body(11, weight: .semibold))
                                .tracking(2)
                                .foregroundStyle(AHYColor.gold)
                            Text("Offline").font(AHYFont.heading(14)).foregroundStyle(AHYColor.ink)
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

                VStack(alignment: .leading, spacing: 8) {
                    SectionKicker(text: "NOT CONNECTED")
                    Text("Today's practice hasn't arrived")
                        .font(AHYFont.heading(17))
                        .foregroundStyle(AHYColor.ink)
                    Text("It will load as soon as you are back on a network. Three practices are already on this phone and will play now.")
                        .font(AHYFont.body(13))
                        .foregroundStyle(AHYColor.ink2)
                }
                .padding(18)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .strokeBorder(AHYColor.line, style: StrokeStyle(lineWidth: 1, dash: [4]))
                )

                SectionKicker(text: "ON THIS PHONE")
                VStack(spacing: 0) {
                    ForEach(Array(SampleData.downloadedPractices.enumerated()), id: \.element.id) { i, practice in
                        RowView(
                            icon: practice.icon,
                            title: practice.title.lowercased(),
                            subtitle: "\(practice.duration) · \(practice.subtitle)",
                            first: i == 0
                        ) {
                            path.append(Route.player(practice))
                        }
                    }
                }

                VStack(spacing: 10) {
                    FlourishView()
                    Text("The practice does not need a signal.")
                        .font(AHYFont.body(11.5))
                        .foregroundStyle(AHYColor.gold)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(22)
        }
        .background(AHYColor.bg.ignoresSafeArea())
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationStack { OfflineView(path: .constant(NavigationPath())) }
}
