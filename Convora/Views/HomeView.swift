import SwiftUI

struct HomeView: View {
    @Binding var path: NavigationPath
    @Environment(ProgressManager.self) private var progress
    @Environment(PurchaseManager.self) private var purchases

    @State private var showSettings = false
    @State private var showShareCard = false

    var body: some View {
        ZStack {
            ConvoraTheme.background.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // MARK: - Header
                    headerSection

                    // MARK: - Progress Card
                    progressCard

                    // MARK: - Stats Row
                    statsRow

                    // MARK: - Week Cards
                    weekCards
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 32)
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showSettings) {
            SettingsSheet()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $showShareCard) {
            ShareProgressCard()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }

    // MARK: - Header
    private var headerSection: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 6) {
                Text("28-DAY PROGRAM")
                    .font(.system(size: 11, weight: .bold))
                    .tracking(3)
                    .foregroundStyle(ConvoraTheme.accent)

                HStack(spacing: 0) {
                    Text("Conv")
                        .font(.system(size: 38, weight: .heavy))
                        .foregroundStyle(ConvoraTheme.textPrimary)
                    Text("ora")
                        .font(.system(size: 38, weight: .heavy))
                        .foregroundStyle(ConvoraTheme.accent)
                }

                Text("Master the art of communication.")
                    .font(.system(size: 15))
                    .foregroundStyle(ConvoraTheme.textSecondary)
            }

            Spacer()

            Button {
                showSettings = true
            } label: {
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 18))
                    .foregroundStyle(ConvoraTheme.textSecondary)
                    .frame(width: 44, height: 44)
                    .background(ConvoraTheme.surfaceLight)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
        }
    }

    // MARK: - Progress Card
    private var progressCard: some View {
        VStack(spacing: 14) {
            HStack {
                Text("Your Progress")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(ConvoraTheme.textPrimary)

                Spacer()

                Button {
                    showShareCard = true
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 14))
                        .foregroundStyle(ConvoraTheme.textMuted)
                }

                Text("\(Int(progress.progressPercent * 100))%")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(ConvoraTheme.accent)
            }

            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(ConvoraTheme.surface)
                        .frame(height: 8)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(ConvoraTheme.accentGradient)
                        .frame(width: geo.size.width * progress.progressPercent, height: 8)
                        .animation(.spring(duration: 0.5), value: progress.progressPercent)
                }
            }
            .frame(height: 8)

            Text("\(progress.completedCount) of 28 lessons completed")
                .font(.system(size: 13))
                .foregroundStyle(ConvoraTheme.textSecondary)
        }
        .padding(20)
        .glassCard()
    }

    // MARK: - Stats Row
    private var statsRow: some View {
        HStack(spacing: 10) {
            StatChip(emoji: "🧠", value: "18+", label: "Frameworks")
            StatChip(emoji: "💪", value: "28", label: "Exercises")
            StatChip(emoji: "🎧", value: "6hrs", label: "Audio")
            StatChip(emoji: "🔥", value: "\(progress.currentStreak)", label: "Streak")
        }
    }

    // MARK: - Week Cards
    private var weekCards: some View {
        ForEach(Array(CourseData.weeks.enumerated()), id: \.element.id) { index, week in
            Button {
                path.append(WeekRoute(weekIndex: index))
            } label: {
                WeekCard(
                    week: week,
                    weekIndex: index,
                    completedCount: progress.weekCompletedCount(index)
                )
            }
            .sensoryFeedback(.selection, trigger: index)
        }
    }
}
