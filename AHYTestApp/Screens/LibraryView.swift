import SwiftUI

struct LibraryView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) private var dismiss
    @State private var category: PracticeCategory = .meditation

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                header
                segmented

                VStack(spacing: 0) {
                    ForEach(Array(filteredPractices.enumerated()), id: \.element.id) { index, practice in
                        RowView(
                            icon: practice.icon,
                            title: practice.title.lowercased(),
                            subtitle: subtitle(for: practice),
                            first: index == 0,
                            locked: practice.locked
                        ) {
                            if practice.locked { path.append(Route.innerPath) }
                            else { path.append(Route.player(practice)) }
                        }
                    }
                }

                Divider().background(AHYColor.line)
                Text("64 practices in your library. 18 more on the inner path.")
                    .font(AHYFont.body(11.5))
                    .foregroundStyle(AHYColor.ink2)
            }
            .padding(22)
        }
        .background(AHYColor.bg.ignoresSafeArea())
        .navigationBarHidden(true)
    }

    private var filteredPractices: [Practice] {
        SampleData.libraryPractices.filter { $0.category == category }
    }

    private func subtitle(for practice: Practice) -> String {
        practice.duration.isEmpty ? practice.subtitle : "\(practice.duration) · \(practice.subtitle)"
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
                Text("Daily practice").font(AHYFont.heading(17)).foregroundStyle(AHYColor.ink)
                Text("अभ्यास · Abhyas").font(AHYFont.devanagari(12.5)).foregroundStyle(AHYColor.saffron)
            }
            Spacer()
        }
    }

    private var segmented: some View {
        HStack(spacing: 4) {
            ForEach(PracticeCategory.allCases) { cat in
                Text(cat.rawValue)
                    .font(AHYFont.body(11.5, weight: .semibold))
                    .foregroundStyle(cat == category ? .white : AHYColor.ink2)
                    .padding(.vertical, 9)
                    .frame(maxWidth: .infinity)
                    .background(cat == category ? AHYColor.navy : Color.clear, in: Capsule())
                    .onTapGesture { category = cat }
            }
        }
        .padding(4)
        .background(AHYColor.ink.opacity(0.06), in: Capsule())
    }
}

#Preview {
    NavigationStack { LibraryView(path: .constant(NavigationPath())) }
}
