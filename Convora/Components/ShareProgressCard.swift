import SwiftUI

struct ShareProgressCard: View {
    @Environment(ProgressManager.self) private var progress
    @Environment(\.dismiss) private var dismiss

    @State private var renderedImage: UIImage?

    var body: some View {
        NavigationStack {
            ZStack {
                ConvoraTheme.background.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 24) {
                        // Card preview
                        cardPreview
                            .padding(.horizontal, 20)

                        // Share buttons
                        if let image = renderedImage {
                            ShareLink(
                                item: Image(uiImage: image),
                                preview: SharePreview(
                                    shareText,
                                    image: Image(uiImage: image)
                                )
                            ) {
                                HStack {
                                    Image(systemName: "square.and.arrow.up")
                                    Text("Share to Instagram / X")
                                }
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(ConvoraTheme.accent)
                                .clipShape(RoundedRectangle(cornerRadius: ConvoraTheme.radiusMd, style: .continuous))
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                }
            }
            .navigationTitle("Share Progress")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(ConvoraTheme.accent)
                }
            }
        }
        .task {
            await renderCard()
        }
    }

    // MARK: - Card Preview
    private var cardPreview: some View {
        VStack(spacing: 20) {
            // Logo
            HStack(spacing: 4) {
                Text("C")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(ConvoraTheme.accent)

                Spacer()

                Text("CONVORA")
                    .font(.system(size: 11, weight: .bold))
                    .tracking(3)
                    .foregroundStyle(ConvoraTheme.textMuted)
            }

            // Big percentage
            Text("\(progress.completedCount * 100 / 28)%")
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .foregroundStyle(ConvoraTheme.textPrimary)

            Text("\(progress.completedCount) of 28 lessons completed")
                .font(.system(size: 14))
                .foregroundStyle(ConvoraTheme.textSecondary)

            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(ConvoraTheme.surface)
                        .frame(height: 8)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(ConvoraTheme.accentGradient)
                        .frame(width: geo.size.width * progress.progressPercent, height: 8)
                }
            }
            .frame(height: 8)

            // Stats row
            HStack(spacing: 0) {
                statItem(value: "\(progress.completedCount)", label: "Days")
                statItem(value: "\(progress.currentStreak)", label: "Streak")
                statItem(value: "Week \(currentWeek)", label: "Current")
            }

            // Tagline
            Text("Master communication in 28 days")
                .font(.system(size: 12))
                .foregroundStyle(ConvoraTheme.textMuted)

            Text("#Convora #CommunicationSkills")
                .font(.system(size: 11))
                .foregroundStyle(ConvoraTheme.accent.opacity(0.7))
        }
        .padding(24)
        .background(
            LinearGradient(
                colors: [Color(hex: "0F1923"), Color(hex: "0B1622")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: ConvoraTheme.radiusLg, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: ConvoraTheme.radiusLg, style: .continuous)
                .strokeBorder(ConvoraTheme.glassBorder, lineWidth: 0.5)
        )
    }

    private func statItem(value: String, label: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundStyle(ConvoraTheme.textPrimary)

            Text(label)
                .font(.system(size: 11))
                .foregroundStyle(ConvoraTheme.textMuted)
        }
        .frame(maxWidth: .infinity)
    }

    private var currentWeek: Int {
        min(4, (progress.completedCount / 7) + 1)
    }

    private var shareText: String {
        "I've completed \(progress.completedCount) days of the Convora 28-day communication mastery course! 🎯 #Convora #CommunicationSkills"
    }

    @MainActor
    private func renderCard() async {
        let renderer = ImageRenderer(content: cardPreview.frame(width: 360))
        renderer.scale = 3
        renderedImage = renderer.uiImage
    }
}
