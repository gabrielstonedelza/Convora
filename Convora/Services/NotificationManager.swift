import Foundation
import UserNotifications

enum NotificationManager {
    private static let reminderID = "daily_reminder"
    private static let enabledKey = "notifications_enabled"
    private static let hourKey = "notification_hour"
    private static let minuteKey = "notification_minute"

    private static let messages: [String] = [
        "Your next lesson is waiting. 12 minutes to level up. \u{1F3AF}",
        "Great communicators practice daily. Ready for today's lesson?",
        "Small daily steps lead to massive results. Let's go! \u{1F4AA}",
        "Your communication skills are evolving. Keep the momentum!",
        "Today's lesson could change how you connect with others. \u{1F31F}",
        "Champions train daily. Your lesson is ready. \u{1F3C6}",
        "Invest 12 minutes in yourself today. Open your lesson!",
        "The best communicators never stop learning. Continue your journey."
    ]

    // MARK: - Public Methods

    @discardableResult
    static func requestPermission() async -> Bool {
        do {
            let granted = try await UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .badge, .sound])
            if granted {
                UserDefaults.standard.set(true, forKey: enabledKey)
            }
            return granted
        } catch {
            print("Notification permission error: \(error)")
            return false
        }
    }

    static func scheduleDailyReminder(hour: Int, minute: Int) async {
        let center = UNUserNotificationCenter.current()

        // Remove existing reminder first
        center.removePendingNotificationRequests(withIdentifiers: [reminderID])

        let content = UNMutableNotificationContent()
        content.title = "Convora"

        // Pick message based on day of year
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 0
        let messageIndex = dayOfYear % messages.count
        content.body = messages[messageIndex]
        content.sound = .default

        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute

        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents,
            repeats: true
        )

        let request = UNNotificationRequest(
            identifier: reminderID,
            content: content,
            trigger: trigger
        )

        do {
            try await center.add(request)
            UserDefaults.standard.set(true, forKey: enabledKey)
            UserDefaults.standard.set(hour, forKey: hourKey)
            UserDefaults.standard.set(minute, forKey: minuteKey)
        } catch {
            print("Failed to schedule notification: \(error)")
        }
    }

    static func cancelDailyReminder() {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [reminderID])
        UserDefaults.standard.set(false, forKey: enabledKey)
    }

    static func isEnabled() -> Bool {
        UserDefaults.standard.bool(forKey: enabledKey)
    }

    static func getReminderTime() -> (hour: Int, minute: Int) {
        let defaults = UserDefaults.standard
        let hour = defaults.object(forKey: hourKey) as? Int ?? 8
        let minute = defaults.object(forKey: minuteKey) as? Int ?? 0
        return (hour, minute)
    }
}
