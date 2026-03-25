import SwiftUI

@main
struct ConvoraApp: App {
    @State private var progressManager = ProgressManager()
    @State private var purchaseManager = PurchaseManager()
    @State private var languageManager = LanguageManager()
    @State private var ttsManager: TTSManager

    init() {
        let langManager = LanguageManager()
        _languageManager = State(initialValue: langManager)
        _ttsManager = State(initialValue: TTSManager(languageManager: langManager))
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(progressManager)
                .environment(purchaseManager)
                .environment(languageManager)
                .environment(ttsManager)
                .preferredColorScheme(.dark)
        }
    }
}
