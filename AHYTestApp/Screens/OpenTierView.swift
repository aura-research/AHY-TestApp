import SwiftUI

struct OpenTierView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                header
                Text("Two complete practices, given freely — the same method taught at the ashram, unabridged.")
                    .font(AHYFont.body(13))
                    .foregroundStyle(AHYColor.ink2)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    ForEach(SampleData.openPractices) { practice in
                        PracticeTileView(practice: practice) { path.append(Route.player(practice)) }
                    }
                }

                SectionKicker(text: "ALSO YOURS")
                VStack(spacing: 0) {
                    RowView(icon: "book", title: "the guru's words", subtitle: "A shloka and a teaching each week", first: true) {}
                    RowView(icon: "person.2", title: "free satsang", subtitle: "Open sitting, first Sunday monthly") {
                        path.append(Route.innerPath)
                    }
                }

                VStack(spacing: 10) {
                    FlourishView()
                    Text("When these become daily, Abhyas opens the rest.")
                        .font(AHYFont.body(11.5))
                        .foregroundStyle(AHYColor.gold)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 6)
            }
            .padding(22)
        }
        .background(AHYColor.bg.ignoresSafeArea())
        .navigationBarHidden(true)
    }

    private var header: some View {
        HStack {
            Button { dismiss() } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(AHYColor.ink)
                    .frame(width: 38, height: 38)
                    .overlay(Circle().stroke(AHYColor.line))
            }
            VStack(alignment: .leading, spacing: 2) {
                Text("Open").font(AHYFont.heading(17)).foregroundStyle(AHYColor.ink)
                Text("सेवा · Seva").font(AHYFont.devanagari(12.5)).foregroundStyle(AHYColor.saffron)
            }
            Spacer()
            Text("Free")
                .font(AHYFont.body(11, weight: .semibold))
                .foregroundStyle(AHYColor.gold)
                .padding(.horizontal, 11)
                .padding(.vertical, 5)
                .overlay(Capsule().stroke(AHYColor.line))
        }
    }
}

#Preview {
    NavigationStack { OpenTierView(path: .constant(NavigationPath())) }
}
