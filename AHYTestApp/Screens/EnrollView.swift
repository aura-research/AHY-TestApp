import SwiftUI

struct EnrollView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) private var dismiss
    @State private var toast: String?

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Button { dismiss() } label: {
                            Image(systemName: "chevron.down")
                                .foregroundStyle(AHYColor.ink)
                                .frame(width: 38, height: 38)
                                .overlay(Circle().stroke(AHYColor.line))
                        }
                        Spacer()
                    }
                    SectionKicker(text: "BEGIN")
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Daily practice").font(AHYFont.heading(25)).foregroundStyle(AHYColor.ink)
                        Text("अभ्यास · Abhyas").font(AHYFont.devanagari(14)).foregroundStyle(AHYColor.saffron)
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        HStack(alignment: .lastTextBaseline) {
                            Text("₹1,000").font(AHYFont.heading(18)).foregroundStyle(AHYColor.ink)
                            Spacer()
                            Text("each month").font(AHYFont.body(12.5)).foregroundStyle(AHYColor.ink2)
                        }
                        Divider().background(AHYColor.line)
                        Text("Renews on the 28th. Stop any month from your profile — the practices you have downloaded stay.")
                            .font(AHYFont.body(12.5))
                            .foregroundStyle(AHYColor.ink2)
                    }
                    .padding(17)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(AHYColor.line))

                    SectionKicker(text: "WHAT OPENS")
                    VStack(spacing: 0) {
                        ForEach(Array(SampleData.enrollFeatures.enumerated()), id: \.offset) { i, feature in
                            HStack(spacing: 12) {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundStyle(AHYColor.saffron)
                                Text(feature).font(AHYFont.body(13)).foregroundStyle(AHYColor.ink)
                                Spacer()
                            }
                            .padding(.vertical, 9)
                            .overlay(alignment: .top) {
                                if i > 0 { Rectangle().fill(AHYColor.line).frame(height: 1) }
                            }
                        }
                    }

                    Divider().background(AHYColor.line)
                    Text("If the fee is what stands in your way, write to us. The practice is not withheld for money.")
                        .font(AHYFont.body(11.5))
                        .foregroundStyle(AHYColor.ink2)
                }
                .padding(22)
            }

            Button {
                toast = "Enrolled — your library is open"
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                    path.append(Route.library)
                }
            } label: {
                Text("Enroll Now").frame(maxWidth: .infinity)
            }
            .buttonStyle(AHYPillButtonStyle())
            .padding(.horizontal, 22)
            .padding(.vertical, 14)
            .background(AHYColor.bg)
        }
        .background(AHYColor.bg.ignoresSafeArea())
        .navigationBarHidden(true)
        .ahyToast($toast)
    }
}

#Preview {
    NavigationStack { EnrollView(path: .constant(NavigationPath())) }
}
