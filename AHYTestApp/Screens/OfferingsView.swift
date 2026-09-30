import SwiftUI

struct OfferingsView: View {
    @Binding var path: NavigationPath

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 10) {
                    SectionKicker(text: "OFFERINGS")
                    (Text("Three depths of ") + Text("practice").foregroundColor(AHYColor.saffron))
                        .font(AHYFont.heading(25))
                        .foregroundStyle(AHYColor.ink)
                }
                Text("Every level is the same tradition. What changes is how far in it goes.")
                    .font(AHYFont.body(13))
                    .foregroundStyle(AHYColor.ink2)

                ForEach(SampleData.tiers) { tier in
                    TierCardView(tier: tier) {
                        switch tier.style {
                        case .open: path.append(Route.openTier)
                        case .daily: path.append(Route.library)
                        case .inner: path.append(Route.innerPath)
                        }
                    } primaryAction: {
                        if tier.style == .daily { path.append(Route.enroll) }
                    }
                }

                Text("No sincere seeker is turned away. Write to us.")
                    .font(AHYFont.body(11.5))
                    .foregroundStyle(AHYColor.gold)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.top, 6)
            }
            .padding(22)
        }
        .background(AHYColor.bg2.ignoresSafeArea())
        .navigationBarHidden(true)
    }
}

#Preview {
    OfferingsTab()
}
