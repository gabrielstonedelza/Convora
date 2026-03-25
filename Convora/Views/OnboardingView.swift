import SwiftUI

struct OnboardingView: View {
    @Environment(ProgressManager.self) private var progress
    @State private var currentPage = 0

    private let pages: [OnboardingPage] = [
        OnboardingPage(
            emoji: "🎯",
            title: "Master Communication\nin 28 Days",
            subtitle: "Professional frameworks used by top executives, speakers, and leaders — now in your pocket.",
            color: ConvoraTheme.accent
        ),
        OnboardingPage(
            emoji: "🎧",
            title: "Listen & Learn\nAnywhere",
            subtitle: "Every lesson includes audio narration. Practice during your commute, workout, or downtime.",
            color: ConvoraTheme.week2
        ),
        OnboardingPage(
            emoji: "💪",
            title: "Practice With\nDaily Challenges",
            subtitle: "Real-world exercises and challenges that build lasting habits, not just knowledge.",
            color: ConvoraTheme.week3
        ),
        OnboardingPage(
            emoji: "🔓",
            title: "Start Free,\nGrow Unlimited",
            subtitle: "Week 1 is completely free. Unlock the full 28-day program anytime.",
            color: ConvoraTheme.week4
        ),
    ]

    var body: some View {
        ZStack {
            ConvoraTheme.background.ignoresSafeArea()

            VStack {
                // Skip button
                HStack {
                    Spacer()
                    Button("Skip") {
                        completeOnboarding()
                    }
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(ConvoraTheme.textSecondary)
                    .padding(.trailing, 20)
                    .padding(.top, 8)
                }

                // Page content
                TabView(selection: $currentPage) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        pageView(pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.spring(duration: 0.4), value: currentPage)

                // Page dots
                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        Capsule()
                            .fill(index == currentPage ? pages[currentPage].color : ConvoraTheme.textMuted)
                            .frame(width: index == currentPage ? 24 : 8, height: 8)
                            .animation(.spring(duration: 0.3), value: currentPage)
                    }
                }
                .padding(.bottom, 20)

                // CTA Button
                Button {
                    if currentPage < pages.count - 1 {
                        currentPage += 1
                    } else {
                        completeOnboarding()
                    }
                } label: {
                    Text(currentPage == pages.count - 1 ? "Get Started" : "Continue")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(pages[currentPage].color)
                        .clipShape(RoundedRectangle(cornerRadius: ConvoraTheme.radiusMd, style: .continuous))
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
                .sensoryFeedback(.impact(flexibility: .soft), trigger: currentPage)
            }
        }
        .sensoryFeedback(.selection, trigger: currentPage)
    }

    private func pageView(_ page: OnboardingPage) -> some View {
        VStack(spacing: 24) {
            Spacer()

            Text(page.emoji)
                .font(.system(size: 72))

            Text(page.title)
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(ConvoraTheme.textPrimary)
                .multilineTextAlignment(.center)

            Text(page.subtitle)
                .font(.system(size: 16))
                .foregroundStyle(ConvoraTheme.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Spacer()
            Spacer()
        }
    }

    private func completeOnboarding() {
        progress.setOnboarded()
        Task {
            let granted = await NotificationManager.requestPermission()
            if granted {
                await NotificationManager.scheduleDailyReminder(hour: 8, minute: 0)
            }
        }
    }
}

private struct OnboardingPage {
    let emoji: String
    let title: String
    let subtitle: String
    let color: Color
}
