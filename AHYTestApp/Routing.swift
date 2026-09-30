import SwiftUI

/// Every non-tab-root destination in the app. Kept as one enum so each tab's
/// NavigationStack can share a single `navigationDestination(for: Route.self)`.
enum Route: Hashable {
    case player(Practice)
    case openTier
    case library
    case innerPath
    case enroll
    case profile
    case offline
}

@ViewBuilder
func ahyDestination(for route: Route, path: Binding<NavigationPath>) -> some View {
    switch route {
    case .player(let practice):
        PlayerView(practice: practice)
    case .openTier:
        OpenTierView(path: path)
    case .library:
        LibraryView(path: path)
    case .innerPath:
        InnerPathView(path: path)
    case .enroll:
        EnrollView(path: path)
    case .profile:
        ProfileView()
    case .offline:
        OfflineView(path: path)
    }
}
