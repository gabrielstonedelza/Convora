import Foundation

struct Exercise: Hashable, Codable {
    let title: String
    let instructions: String
    let challenge: String
}

struct DayLesson: Identifiable, Hashable {
    let day: Int
    let title: String
    let icon: String
    let duration: String
    let lesson: String
    let exercise: Exercise
    let keyTakeaways: [String]

    var id: Int { day }

    func hash(into hasher: inout Hasher) {
        hasher.combine(day)
    }

    static func == (lhs: DayLesson, rhs: DayLesson) -> Bool {
        lhs.day == rhs.day
    }
}

struct CourseWeek: Identifiable {
    let title: String
    let subtitle: String
    let weekNumber: Int
    let days: [DayLesson]

    var id: Int { weekNumber }
}

// MARK: - Navigation Routes

struct WeekRoute: Hashable {
    let weekIndex: Int
}

struct LessonRoute: Hashable {
    let day: DayLesson
    let weekIndex: Int
}

struct ExerciseRoute: Hashable {
    let day: DayLesson
    let weekIndex: Int
}

struct PaywallRoute: Hashable {}
