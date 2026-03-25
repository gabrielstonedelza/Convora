import SwiftUI

struct NotificationSettingsRow: View {
    @State private var isEnabled = false
    @State private var reminderDate = Calendar.current.date(
        from: DateComponents(hour: 8, minute: 0)
    ) ?? Date()
    @State private var isLoading = true

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "bell.fill")
                    .foregroundStyle(ConvoraTheme.accent)
                    .font(.system(size: 18))

                VStack(alignment: .leading, spacing: 2) {
                    Text("Daily Reminder")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(ConvoraTheme.textPrimary)

                    Text("Never miss a lesson")
                        .font(.system(size: 13))
                        .foregroundStyle(ConvoraTheme.textSecondary)
                }

                Spacer()

                Toggle("", isOn: $isEnabled)
                    .tint(ConvoraTheme.accent)
                    .labelsHidden()
                    .onChange(of: isEnabled) { _, newValue in
                        Task { await handleToggle(newValue) }
                    }
            }

            if isEnabled {
                HStack {
                    Image(systemName: "clock")
                        .foregroundStyle(ConvoraTheme.textSecondary)
                        .font(.system(size: 14))

                    Text("Remind me at")
                        .font(.system(size: 14))
                        .foregroundStyle(ConvoraTheme.textPrimary)

                    Spacer()

                    DatePicker(
                        "",
                        selection: $reminderDate,
                        displayedComponents: .hourAndMinute
                    )
                    .labelsHidden()
                    .tint(ConvoraTheme.accent)
                    .onChange(of: reminderDate) { _, newDate in
                        let components = Calendar.current.dateComponents([.hour, .minute], from: newDate)
                        Task {
                            await NotificationManager.scheduleDailyReminder(
                                hour: components.hour ?? 8,
                                minute: components.minute ?? 0
                            )
                        }
                    }
                }
                .padding(12)
                .background(ConvoraTheme.surface)
                .clipShape(RoundedRectangle(cornerRadius: ConvoraTheme.radiusSm, style: .continuous))
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding(16)
        .glassCard(cornerRadius: ConvoraTheme.radiusMd)
        .animation(.spring(duration: 0.3), value: isEnabled)
        .task {
            isEnabled = NotificationManager.isEnabled()
            let time = NotificationManager.getReminderTime()
            reminderDate = Calendar.current.date(
                from: DateComponents(hour: time.hour, minute: time.minute)
            ) ?? Date()
            isLoading = false
        }
        .opacity(isLoading ? 0 : 1)
    }

    private func handleToggle(_ enabled: Bool) async {
        if enabled {
            let granted = await NotificationManager.requestPermission()
            if granted {
                let components = Calendar.current.dateComponents([.hour, .minute], from: reminderDate)
                await NotificationManager.scheduleDailyReminder(
                    hour: components.hour ?? 8,
                    minute: components.minute ?? 0
                )
            } else {
                isEnabled = false
            }
        } else {
            NotificationManager.cancelDailyReminder()
        }
    }
}
