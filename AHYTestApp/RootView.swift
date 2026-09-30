import SwiftUI

struct HomeTab: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            HomeView(path: $path)
                .navigationDestination(for: Route.self) { route in
                    ahyDestination(for: route, path: $path)
                }
        }
    }
}

struct OfferingsTab: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            OfferingsView(path: $path)
                .navigationDestination(for: Route.self) { route in
                    ahyDestination(for: route, path: $path)
                }
        }
    }
}

struct AboutTab: View {
    var body: some View {
        NavigationStack {
            AboutView()
        }
    }
}

struct RootView: View {
    @State private var showSplash = true

    var body: some View {
        Group {
            if showSplash {
                OpeningView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                            withAnimation(.easeInOut(duration: 0.4)) { showSplash = false }
                        }
                    }
            } else {
                TabView {
                    HomeTab()
                        .tabItem { Label("Home", systemImage: "sun.horizon") }
                    OfferingsTab()
                        .tabItem { Label("Offerings", systemImage: "leaf") }
                    AboutTab()
                        .tabItem { Label("About AHY", systemImage: "mountain.2") }
                }
                .tint(AHYColor.gold)
            }
        }
    }
}
