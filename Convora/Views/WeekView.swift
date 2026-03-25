import SwiftUI

struct WeekView: View {
    let weekIndex: Int
    @Binding var path: NavigationPath

    @Environment(ProgressManager.self) private var progress
    @Environment(PurchaseManager.self) private var purchases
    @Environment(\.dismiss) private var dismiss

    private var week: CourseWeek {
        CourseData.weeks[weekIndex]
    }

    private var weekColor: Color {
        ConvoraTheme.weekColor(weekIndex)
    }

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [weekColor.opacity(0.08), ConvoraTheme.background],
                startPoint: .top,
                endPoint: .center
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Header
                    headerSection

                    // Progress bar
                    progressSection

                    // Day list
                    dayList
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 32)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(ConvoraTheme.textPrimary)
                }
            }
        }
    }

    // MARK: - Header
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("WEEK \(week.weekNumber)")
                .font(.system(size: 11, weight: .bold))
                .tracking(2)
                .foregroundStyle(weekColor)

            Text(week.title)
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(ConvoraTheme.textPrimary)

            Text(week.subtitle)
                .font(.system(size: 15))
                .foregroundStyle(weekColor.opacity(0.8))
        }
    }

    // MARK: - Progress
    private var progressSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(ConvoraTheme.surface)
                        .frame(height: 6)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(weekColor)
                        .frame(
                            width: geo.size.width * CGFloat(progress.weekCompletedCount(weekIndex)) / 7.0,
                            height: 6
                        )
                        .animation(.spring(duration: 0.5), value: progress.weekCompletedCount(weekIndex))
                }
            }
            .frame(height: 6)

            Text("\(progress.weekCompletedCount(weekIndex)) of 7 completed")
                .font(.system(size: 13))
                .foregroundStyle(ConvoraTheme.textSecondary)
        }
    }

    // MARK: - Day List
    private var dayList: some View {
        VStack(spacing: 10) {
            ForEach(week.days) { day in
                dayRow(day)
            }
        }
    }

    private func dayRow(_ day: DayLesson) -> some View {
        let isComplete = progress.isDayComplete(day.day)
        let canAccess = purchases.canAccessDay(day.day)

        return Button {
            if canAccess {
                path.append(LessonRoute(day: day, weekIndex: weekIndex))
            } else {
                path.append(PaywallRoute())
            }
        } label: {
            HStack(spacing: 14) {
                // Icon or status
                ZStack {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(isComplete ? weekColor.opacity(0.15) : ConvoraTheme.surfaceLight)
                        .frame(width: 48, height: 48)

                    if isComplete {
                        Image(systemName: "checkmark")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(weekColor)
                    } else if !canAccess {
                        Image(systemName: "lock.fill")
                            .font(.system(size: 16))
                            .foregroundStyle(ConvoraTheme.textMuted)
                    } else {
                        Text(day.icon)
                            .font(.system(size: 22))
                    }
                }

                VStack(alignment: .leading, spacing: 3) {
                    Text("Day \(day.day)")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(canAccess ? weekColor : ConvoraTheme.textMuted)

                    Text(day.title)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(canAccess ? ConvoraTheme.textPrimary : ConvoraTheme.textMuted)
                        .lineLimit(1)
                }

                Spacer()

                Text(day.duration)
                    .font(.system(size: 12))
                    .foregroundStyle(ConvoraTheme.textSecondary)

                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(ConvoraTheme.textMuted)
            }
            .padding(14)
            .background(isComplete ? weekColor.opacity(0.04) : Color.clear)
            .glassCard(cornerRadius: ConvoraTheme.radiusMd)
        }
        .sensoryFeedback(.selection, trigger: day.day)
    }
}
