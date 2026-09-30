import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var toast: String?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header
                PracticeCalendarView()
                statsRow
                SectionKicker(text: "NOTES")
                VStack(alignment: .leading, spacing: 10) {
                    Text("Nothing recorded today. Sit when you are ready.")
                        .font(AHYFont.body(12.5))
                        .foregroundStyle(AHYColor.ink2)
                    Button {
                        toast = "Note added"
                    } label: {
                        Label("Add a note", systemImage: "square.and.pencil")
                    }
                    .buttonStyle(AHYNavyButtonStyle())
                }
                .padding(15)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .strokeBorder(AHYColor.line, style: StrokeStyle(lineWidth: 1, dash: [4]))
                )

                VStack(alignment: .leading, spacing: 4) {
                    Text("Saturday 26 Sept").font(AHYFont.heading(13.5)).foregroundStyle(AHYColor.ink)
                    Text("Longer exhale settled the mind quickly. Knee held.")
                        .font(AHYFont.body(12.5))
                        .foregroundStyle(AHYColor.ink2)
                }
                .padding(.top, 4)
            }
            .padding(22)
        }
        .background(AHYColor.bg.ignoresSafeArea())
        .navigationBarHidden(true)
        .ahyToast($toast)
    }

    private var header: some View {
        HStack(spacing: 14) {
            Button { dismiss() } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(AHYColor.ink)
                    .frame(width: 38, height: 38)
                    .overlay(Circle().stroke(AHYColor.line))
            }
            VStack(alignment: .leading, spacing: 2) {
                Text("Ananya Rao").font(AHYFont.heading(18)).foregroundStyle(AHYColor.ink)
                Text("Daily practice · since 2024").font(AHYFont.body(11.5, weight: .semibold)).foregroundStyle(AHYColor.gold)
            }
            Spacer()
        }
    }

    private var statsRow: some View {
        HStack(spacing: 0) {
            statTile(value: "18", label: "DAYS")
            Divider().background(AHYColor.line)
            statTile(value: "9h 20m", label: "SAT")
            Divider().background(AHYColor.line)
            statTile(value: "4", label: "SATSANGS")
        }
        .overlay(Rectangle().fill(AHYColor.line).frame(height: 1), alignment: .top)
        .overlay(Rectangle().fill(AHYColor.line).frame(height: 1), alignment: .bottom)
    }

    private func statTile(value: String, label: String) -> some View {
        VStack(spacing: 4) {
            Text(value).font(AHYFont.heading(21)).foregroundStyle(AHYColor.ink)
            Text(label).font(AHYFont.body(10, weight: .semibold)).tracking(2).foregroundStyle(AHYColor.gold)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
    }
}

#Preview {
    NavigationStack { ProfileView() }
}
