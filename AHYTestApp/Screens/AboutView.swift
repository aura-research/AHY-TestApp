import SwiftUI

struct AboutView: View {
    @State private var toast: String?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                heroPhoto
                VStack(alignment: .leading, spacing: 18) {
                    SectionKicker(text: "ADVAIT YOG")
                    Text("A living Himalayan lineage of initiation, sound and stillness, guided by Acharya Advait Yogbhushan from the banks of the Ganga in Rishikesh — the classical sciences kept within reach of every sincere seeker, undiluted, and taught with modern clarity.")
                        .font(AHYFont.body(13.5))
                        .foregroundStyle(AHYColor.ink2)

                    VStack(spacing: 0) {
                        RowView(icon: "mountain.2", title: "The ashram", subtitle: "Rooms, kitchen, the daily rhythm", first: true) {
                            toast = "Ashram — not in this prototype"
                        }
                        RowView(icon: "calendar", title: "Residential programs", subtitle: "Diksha, Shiksha, Chikitsa, Yatra") {
                            toast = "Residential programs — not in this prototype"
                        }
                        RowView(icon: "hands.sparkles", title: "Swamarpan Foundation", subtitle: "Teaching without barriers") {
                            toast = "Swamarpan Foundation — not in this prototype"
                        }
                    }

                    Button {
                        toast = "Plan your visit — not in this prototype"
                    } label: {
                        Text("Plan your visit").frame(maxWidth: .infinity)
                    }
                    .buttonStyle(AHYPillButtonStyle())
                    .padding(.top, 4)
                }
                .padding(22)
            }
        }
        .background(AHYColor.bg2.ignoresSafeArea())
        .navigationBarHidden(true)
        .ahyToast($toast)
    }

    private var heroPhoto: some View {
        ZStack {
            MountainRidgeView(palette: .snow)
            Rectangle().fill(AHYColor.navyDeep.opacity(0.5))
            VStack(spacing: 12) {
                Text("ॐ").font(AHYFont.devanagari(26)).foregroundStyle(AHYColor.saffron)
                Text("The Himalaya is not a place I visited. It is the teacher who dissolved the one who went looking.")
                    .font(AHYFont.body(17, weight: .medium))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                Text("ABOUT · WHO IS A HIMALAYAN YOGI")
                    .font(AHYFont.body(10, weight: .semibold))
                    .tracking(3)
                    .foregroundStyle(.white.opacity(0.6))
            }
            .padding(26)
        }
        .frame(height: 300)
        .clipped()
    }
}

#Preview {
    AboutTab()
}
