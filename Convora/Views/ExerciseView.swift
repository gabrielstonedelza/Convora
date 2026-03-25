import SwiftUI

struct ExerciseView: View {
    let day: DayLesson
    let weekIndex: Int

    @Environment(\.dismiss) private var dismiss

    private var weekColor: Color {
        ConvoraTheme.weekColor(weekIndex)
    }

    var body: some View {
        ZStack {
            ConvoraTheme.background.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    HStack {
                        Text("DAY \(day.day) EXERCISE")
                            .font(.system(size: 12, weight: .bold))
                            .tracking(2)
                            .foregroundStyle(weekColor)

                        Spacer()
                    }

                    // Exercise Card
                    AccentGlassCard(accentColor: weekColor) {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("🏋️")
                                .font(.system(size: 32))

                            Text(day.exercise.title)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundStyle(ConvoraTheme.textPrimary)

                            Text(day.exercise.instructions)
                                .font(.system(size: 15))
                                .foregroundStyle(ConvoraTheme.textSecondary)
                                .lineSpacing(6)
                        }
                        .padding(20)
                    }

                    // Challenge Card
                    AccentGlassCard(accentColor: ConvoraTheme.accent) {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("🔥")
                                .font(.system(size: 28))

                            Text("Daily Challenge")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(ConvoraTheme.textPrimary)

                            Text(day.exercise.challenge)
                                .font(.system(size: 15))
                                .foregroundStyle(ConvoraTheme.textSecondary)
                                .lineSpacing(6)
                        }
                        .padding(20)
                    }

                    // Key Takeaways
                    VStack(alignment: .leading, spacing: 14) {
                        Text("KEY TAKEAWAYS")
                            .font(.system(size: 12, weight: .bold))
                            .tracking(2)
                            .foregroundStyle(ConvoraTheme.textMuted)

                        ForEach(day.keyTakeaways, id: \.self) { takeaway in
                            HStack(alignment: .top, spacing: 12) {
                                Text("◆")
                                    .font(.system(size: 10))
                                    .foregroundStyle(weekColor)
                                    .padding(.top, 3)

                                Text(takeaway)
                                    .font(.system(size: 14))
                                    .foregroundStyle(ConvoraTheme.textSecondary)
                                    .lineSpacing(4)
                            }
                        }
                    }
                    .padding(.top, 8)
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
    }
}
