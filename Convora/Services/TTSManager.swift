import Foundation
import AVFoundation

@Observable
class TTSManager: NSObject, AVSpeechSynthesizerDelegate {
    var isSpeaking: Bool = false
    var isPaused: Bool = false

    private let synthesizer = AVSpeechSynthesizer()
    private let languageManager: LanguageManager

    init(languageManager: LanguageManager) {
        self.languageManager = languageManager
        super.init()
        synthesizer.delegate = self
    }

    // MARK: - Public Methods

    func speak(_ text: String, dayNumber: Int) {
        stop()

        let language = languageManager.current
        let textToSpeak: String

        // Use translated text for non-English languages
        if language.code != "en-US",
           let translated = LessonTranslations.get(languageCode: language.code, day: dayNumber) {
            textToSpeak = translated
        } else {
            textToSpeak = text
        }

        let cleanedText = cleanTextForSpeech(textToSpeak)

        let utterance = AVSpeechUtterance(string: cleanedText)
        utterance.rate = language.rate
        utterance.voice = selectVoice(for: language.code)

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to configure audio session: \(error)")
        }

        synthesizer.speak(utterance)
    }

    func pause() {
        synthesizer.pauseSpeaking(at: .immediate)
    }

    func resume() {
        synthesizer.continueSpeaking()
    }

    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }

    // MARK: - AVSpeechSynthesizerDelegate

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        isSpeaking = true
        isPaused = false
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        isSpeaking = false
        isPaused = false
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        isPaused = true
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        isPaused = false
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        isSpeaking = false
        isPaused = false
    }

    // MARK: - Private Methods

    private func cleanTextForSpeech(_ text: String) -> String {
        var cleaned = text

        // Replace bullet characters at start of lines with periods
        let bulletPattern = /^[\u{2022}\u{2023}\u{25E6}\-]\s*/
        cleaned = cleaned
            .components(separatedBy: "\n")
            .map { line in
                var trimmed = line
                if let match = trimmed.firstMatch(of: bulletPattern) {
                    trimmed.replaceSubrange(match.range, with: ". ")
                }
                return trimmed
            }
            .joined(separator: "\n")

        // Replace double newlines with period-space
        cleaned = cleaned.replacingOccurrences(of: "\n\n", with: ". ")

        // Replace single newlines with comma-space
        cleaned = cleaned.replacingOccurrences(of: "\n", with: ", ")

        // Trim whitespace
        cleaned = cleaned.trimmingCharacters(in: .whitespacesAndNewlines)

        return cleaned
    }

    private func selectVoice(for languageCode: String) -> AVSpeechSynthesisVoice? {
        let voices = AVSpeechSynthesisVoice.speechVoices()
            .filter { $0.language.hasPrefix(languageCode.components(separatedBy: "-").first ?? languageCode) ||
                      $0.language == languageCode }

        // Prefer enhanced or premium quality voices
        if let premium = voices.first(where: { $0.quality == .premium }) {
            return premium
        }
        if let enhanced = voices.first(where: { $0.quality == .enhanced }) {
            return enhanced
        }

        // Fall back to any voice for that language
        return voices.first ?? AVSpeechSynthesisVoice(language: languageCode)
    }
}

// MARK: - Preview support

extension TTSManager {
    func previewLanguage(_ lang: AudioLanguage) {
        stop()
        let samplePhrases: [String: String] = [
            "en-US": "Welcome to Convora. Master communication in 28 days.",
            "es-ES": "Bienvenido a Convora. Domina la comunicación en 28 días.",
            "fr-FR": "Bienvenue sur Convora. Maîtrisez la communication en 28 jours.",
            "pt-BR": "Bem-vindo ao Convora. Domine a comunicação em 28 dias.",
            "de-DE": "Willkommen bei Convora. Meistern Sie Kommunikation in 28 Tagen.",
        ]
        let text = samplePhrases[lang.code] ?? samplePhrases["en-US"]!
        let utterance = AVSpeechUtterance(string: text)
        utterance.rate = lang.rate
        utterance.voice = selectVoice(for: lang.code)

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to configure audio session: \(error)")
        }

        synthesizer.speak(utterance)
    }
}
