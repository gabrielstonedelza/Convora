import Foundation

enum LessonTranslations {
    private static let translations: [String: [Int: String]] = [
        "es-ES": esLessons,
        "fr-FR": frLessons,
        "pt-BR": ptLessons,
        "de-DE": deLessons,
    ]

    static func get(languageCode: String, day: Int) -> String? {
        translations[languageCode]?[day]
    }
}
