import SwiftUI

struct WeekCard: View {
    let week: CourseWeek
    let weekIndex: Int
    let completedCount: Int

    private var weekColor: Color {
        ConvoraTheme.weekColor(weekIndex)
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("WEEK \(week.weekNumber)")
                    .font(.system(size: 11, weight: .bold))
                    .tracking(1.5)
                    .foregroundStyle(weekColor)

                Text(week.title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(ConvoraTheme.textPrimary)

                Text(week.subtitle)
                    .font(.system(size: 13))
                    .foregroundStyle(ConvoraTheme.textSecondary)
            }

            Spacer()

            // Completion circle
            ZStack {
                Circle()
                    .strokeBorder(weekColor.opacity(0.3), lineWidth: 3)
                    .frame(width: 52, height: 52)

                Circle()
                    .trim(from: 0, to: CGFloat(completedCount) / 7.0)
                    .stroke(weekColor, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .frame(width: 52, height: 52)
                    .rotationEffect(.degrees(-90))

                Text("\(completedCount)/7")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundStyle(weekColor)
            }
        }
        .padding(20)
        .background(
            ZStack {
                ConvoraTheme.surfaceCard
                weekColor.opacity(0.05)
            }
        )
        .glassCard(accentColor: weekColor)
    }
}
