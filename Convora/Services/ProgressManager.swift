import Foundation

@Observable
class ProgressManager {
    var completed: [Int: Bool] = [:]
    var currentStreak: Int = 0
    var hasOnboarded: Bool = false

    private let defaults = UserDefaults.standard
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-M-d"
        return df
    }()

    init() {
        loadFromDefaults()
        checkStreakContinuity()
    }

    // MARK: - Public Methods

    func toggleDay(_ day: Int) {
        guard day >= 1 && day <= 28 else { return }

        let wasComplete = completed[day] ?? false
        let isNowComplete = !wasComplete

        completed[day] = isNowComplete
        defaults.set(isNowComplete, forKey: "day_complete_\(day)")

        recalculateStreak()
        if isNowComplete {
            updateLastOpenDate()
        }

        defaults.set(currentStreak, forKey: "current_streak")
    }

    func setOnboarded() {
        hasOnboarded = true
        defaults.set(true, forKey: "has_onboarded")
    }

    func isDayComplete(_ day: Int) -> Bool {
        completed[day] ?? false
    }

    func weekCompletedCount(_ weekIndex: Int) -> Int {
        guard weekIndex >= 0 && weekIndex <= 3 else { return 0 }
        let startDay = weekIndex * 7 + 1
        let endDay = startDay + 6
        var count = 0
        for day in startDay...endDay {
            if completed[day] == true {
                count += 1
            }
        }
        return count
    }

    var completedCount: Int {
        completed.values.filter { $0 }.count
    }

    var progressPercent: Double {
        Double(completedCount) / 28.0
    }

    // MARK: - Private Methods

    private func loadFromDefaults() {
        for day in 1...28 {
            let key = "day_complete_\(day)"
            if defaults.bool(forKey: key) {
                completed[day] = true
            }
        }
        currentStreak = defaults.integer(forKey: "current_streak")
        hasOnboarded = defaults.bool(forKey: "has_onboarded")
    }

    private func checkStreakContinuity() {
        let today = dateFormatter.string(from: Date())

        if let lastOpenString = defaults.string(forKey: "last_open_date") {
            if let lastDate = dateFormatter.date(from: lastOpenString),
               let todayDate = dateFormatter.date(from: today) {
                let calendar = Calendar.current
                let components = calendar.dateComponents([.day], from: lastDate, to: todayDate)
                if let dayGap = components.day, dayGap > 1 {
                    currentStreak = 0
                    defaults.set(0, forKey: "current_streak")
                }
            }
        }

        defaults.set(today, forKey: "last_open_date")
    }

    private func updateLastOpenDate() {
        let today = dateFormatter.string(from: Date())
        defaults.set(today, forKey: "last_open_date")
    }

    private func recalculateStreak() {
        // Count consecutive completed days from day 1 forward
        var streak = 0
        for day in 1...28 {
            if completed[day] == true {
                streak += 1
            } else {
                break
            }
        }
        currentStreak = streak
    }
}
