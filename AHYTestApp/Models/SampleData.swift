import Foundation

/// Mock content standing in for a real backend, mirroring the copy in the clickable prototype.
enum SampleData {
    static let featuredPractice = Practice(
        title: "Mahashunya Omkar Dhyana",
        subtitle: "Twelve minutes of guided stillness — breath, the Omkar, then silence.",
        duration: "12 min",
        category: .meditation,
        icon: "moon.stars"
    )

    static let openPractices: [Practice] = [
        Practice(title: "Mahashunya Omkar", subtitle: "meditation", duration: "12 min", category: .meditation, icon: "moon.stars"),
        Practice(title: "Morning Abhyas", subtitle: "asana & breath", duration: "24 min", category: .asana, icon: "figure.mind.and.body")
    ]

    static let libraryPractices: [Practice] = [
        Practice(title: "Antar Mouna", subtitle: "inner silence", duration: "18 min", category: .meditation, icon: "leaf"),
        Practice(title: "Trataka", subtitle: "steady gazing", duration: "15 min", category: .meditation, icon: "eye"),
        Practice(title: "Omkar Dhyana · Hindi", subtitle: "guided in Hindi", duration: "22 min", category: .meditation, icon: "waveform"),
        Practice(title: "Kriya Dhyana", subtitle: "cleansing practice", duration: "32 min", category: .meditation, locked: true, icon: "flame"),
        Practice(title: "Morning Abhyas", subtitle: "asana & breath", duration: "24 min", category: .asana, icon: "figure.mind.and.body"),
        Practice(title: "Surya Namaskar Flow", subtitle: "twelve postures", duration: "20 min", category: .asana, icon: "sun.max"),
        Practice(title: "Shambhavi Mudra", subtitle: "advanced seal", duration: "28 min", category: .mudra, locked: true, icon: "hand.raised"),
        Practice(title: "Nadi Shodhana", subtitle: "alternate nostril breath", duration: "15 min", category: .pranayama, icon: "wind")
    ]

    static let innerPractices: [Practice] = [
        Practice(title: "Kriya", subtitle: "Six practices · energetic cleansing", duration: "", category: .meditation, icon: "flame"),
        Practice(title: "Bandhas", subtitle: "The three locks, taught in sequence", duration: "", category: .asana, icon: "hand.raised"),
        Practice(title: "Shatkarma", subtitle: "The six purifications", duration: "", category: .asana, icon: "sunrise"),
        Practice(title: "Deep Pranayama", subtitle: "Beyond the daily breath practice", duration: "", category: .pranayama, icon: "wind")
    ]

    static let downloadedPractices: [Practice] = [
        Practice(title: "Mahashunya Omkar Dhyana", subtitle: "downloaded", duration: "12 min", category: .meditation, icon: "moon.stars"),
        Practice(title: "Morning Abhyas", subtitle: "downloaded", duration: "24 min", category: .asana, icon: "figure.mind.and.body"),
        Practice(title: "Antar Mouna", subtitle: "downloaded", duration: "18 min", category: .meditation, icon: "leaf")
    ]

    static let tiers: [Tier] = [
        Tier(
            name: "Open",
            sanskrit: "सेवा · Seva",
            price: "Free",
            period: "always",
            bullets: ["A full guided meditation, not an extract", "A daily physical practice, free of cost"],
            style: .open
        ),
        Tier(
            name: "Daily practice",
            sanskrit: "अभ्यास · Abhyas",
            price: "₹1,000",
            period: "a month",
            bullets: [
                "The full library — mudras, asanas, meditations",
                "Guided in English, Hindi, Mandarin, Italian",
                "Everything in Open"
            ],
            style: .daily
        ),
        Tier(
            name: "The inner path",
            sanskrit: "अन्तरङ्ग · Antaranga",
            price: "₹4,000",
            period: "a month",
            bullets: [
                "Live satsang and sittings, with recordings",
                "Kriya, bandhas, shatkarma, deeper pranayama",
                "Everything in Daily practice"
            ],
            style: .inner
        )
    ]

    static let enrollFeatures = [
        "64 practices — mudras, asanas, meditations",
        "Guided in English, Hindi, Mandarin, Italian",
        "New practice added each week"
    ]
}
