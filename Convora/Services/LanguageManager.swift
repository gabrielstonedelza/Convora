import Foundation

@Observable
class LanguageManager {
    var current: AudioLanguage = .english

    private let defaults = UserDefaults.standard
    private static let languageKey = "audio_language_code"

    init() {
        if let savedCode = defaults.string(forKey: Self.languageKey),
           let language = AudioLanguage.find(byCode: savedCode) {
            current = language
        }
    }

    func setLanguage(_ lang: AudioLanguage) {
        current = lang
        defaults.set(lang.code, forKey: Self.languageKey)
    }
}
