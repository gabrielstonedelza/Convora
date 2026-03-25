import Foundation

struct AudioLanguage: Identifiable, Hashable {
    let code: String
    let name: String
    let nativeName: String
    let flag: String
    let rate: Float

    var id: String { code }

    static let supportedLanguages: [AudioLanguage] = [
        AudioLanguage(code: "en-US", name: "English", nativeName: "English", flag: "🇺🇸", rate: 0.45),
        AudioLanguage(code: "es-ES", name: "Spanish", nativeName: "Español", flag: "🇪🇸", rate: 0.42),
        AudioLanguage(code: "fr-FR", name: "French", nativeName: "Français", flag: "🇫🇷", rate: 0.42),
        AudioLanguage(code: "pt-BR", name: "Portuguese", nativeName: "Português", flag: "🇧🇷", rate: 0.43),
        AudioLanguage(code: "de-DE", name: "German", nativeName: "Deutsch", flag: "🇩🇪", rate: 0.40),
    ]

    static let english = supportedLanguages[0]

    static func find(byCode code: String) -> AudioLanguage? {
        supportedLanguages.first { $0.code == code }
    }
}
