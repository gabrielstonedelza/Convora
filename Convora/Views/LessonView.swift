import SwiftUI

struct LessonView: View {
    let day: DayLesson
    let weekIndex: Int
    @Binding var path: NavigationPath

    @Environment(ProgressManager.self) private var progress
    @Environment(PurchaseManager.self) private var purchases
    @Environment(TTSManager.self) private var tts
    @Environment(\.dismiss) private var dismiss

    @State private var showMilestone = false
    @State private var showShareCard = false

    private var weekColor: Color {
        ConvoraTheme.weekColor(weekIndex)
    }

    private var isComplete: Bool {
        progress.isDayComplete(day.day)
    }

    private var isMilestoneDay: Bool {
        [7, 14, 21, 28].contains(day.day)
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [weekColor.opacity(0.06), ConvoraTheme.background],
                startPoint: .top,
                endPoint: .center
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    lessonHeader

                    // Audio player
                    AudioPlayerBar(
                        lessonText: day.lesson,
                        dayNumber: day.day,
                        weekIndex: weekIndex
                    )

                    // Lesson content
                    lessonContent

                    // Exercise CTA
                    exerciseCTA

                    // Mark complete button
                    markCompleteButton

                    // Next day button
                    if day.day < 28 {
                        nextDayButton
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 40)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button { dismiss() } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(ConvoraTheme.textPrimary)
                }
            }
        }
        .onDisappear {
            tts.stop()
        }
        .fullScreenCover(isPresented: $showMilestone) {
            MilestoneCelebration(
                completedDay: day.day,
                onContinue: { showMilestone = false },
                onShare: {
                    showMilestone = false
                    showShareCard = true
                }
            )
        }
        .sheet(isPresented: $showShareCard) {
            ShareProgressCard()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }

    // MARK: - Header
    private var lessonHeader: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text("DAY \(day.day)")
                    .font(.system(size: 12, weight: .bold))
                    .tracking(2)
                    .foregroundStyle(weekColor)

                Text(day.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(ConvoraTheme.textPrimary)
            }

            Spacer()

            Text(day.icon)
                .font(.system(size: 36))
        }
    }

    // MARK: - Lesson Content
    private var lessonContent: some View {
        let paragraphs = day.lesson.components(separatedBy: "\n\n")

        return VStack(alignment: .leading, spacing: 16) {
            ForEach(Array(paragraphs.enumerated()), id: \.offset) { _, paragraph in
                let trimmed = paragraph.trimmingCharacters(in: .whitespacesAndNewlines)
                if isHeader(trimmed) {
                    Text(trimmed)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(weekColor)
                        .padding(.top, 4)
                } else {
                    Text(trimmed)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(ConvoraTheme.textSecondary)
                        .lineSpacing(6)
                }
            }
        }
    }

    private func isHeader(_ text: String) -> Bool {
        let stripped = text.replacingOccurrences(of: " ", with: "")
        return text.count < 60 && stripped == stripped.uppercased() && stripped.count > 2
    }

    // MARK: - Exercise CTA
    private var exerciseCTA: some View {
        Button {
            path.append(ExerciseRoute(day: day, weekIndex: weekIndex))
        } label: {
            HStack(spacing: 14) {
                Text("🏋️")
                    .font(.system(size: 28))

                VStack(alignment: .leading, spacing: 2) {
                    Text("Today's Exercise & Challenge")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(ConvoraTheme.textPrimary)

                    Text(day.exercise.title)
                        .font(.system(size: 13))
                        .foregroundStyle(ConvoraTheme.textSecondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(weekColor)
            }
            .padding(16)
            .glassCard(accentColor: weekColor)
        }
        .sensoryFeedback(.selection, trigger: day.day)
    }

    // MARK: - Mark Complete
    private var markCompleteButton: some View {
        Button {
            let wasComplete = isComplete
            progress.toggleDay(day.day)
            if !wasComplete && isMilestoneDay {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    showMilestone = true
                }
            }
            if !wasComplete {
                ReviewManager.maybeRequestReview(completedDay: day.day)
            }
        } label: {
            HStack {
                Image(systemName: isComplete ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 18))
                Text(isComplete ? "Completed — Tap to Undo" : "Mark as Complete")
                    .font(.system(size: 16, weight: .semibold))
            }
            .foregroundStyle(isComplete ? ConvoraTheme.textMuted : .white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(isComplete ? ConvoraTheme.surfaceLight : weekColor)
            .clipShape(RoundedRectangle(cornerRadius: ConvoraTheme.radiusMd, style: .continuous))
        }
        .sensoryFeedback(.impact(weight: .medium), trigger: isComplete)
    }

    // MARK: - Next Day
    private var nextDayButton: some View {
        Button {
            let nextDay = day.day + 1
            if let nextLesson = CourseData.allDays.first(where: { $0.day == nextDay }) {
                let nextWeekIndex = (nextDay - 1) / 7
                if purchases.canAccessDay(nextDay) {
                    path.append(LessonRoute(day: nextLesson, weekIndex: nextWeekIndex))
                } else {
                    path.append(PaywallRoute())
                }
            }
        } label: {
            HStack {
                Text("Next → Day \(day.day + 1)")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(weekColor)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .overlay(
                RoundedRectangle(cornerRadius: ConvoraTheme.radiusMd, style: .continuous)
                    .strokeBorder(weekColor.opacity(0.4), lineWidth: 1.5)
            )
        }
    }
}
