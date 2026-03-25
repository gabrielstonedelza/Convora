import SwiftUI

struct LanguagePickerSheet: View {
    @Environment(LanguageManager.self) private var languageManager
    @Environment(TTSManager.self) private var tts
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                ConvoraTheme.background.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(AudioLanguage.supportedLanguages) { lang in
                            languageRow(lang)
                        }

                        // Info box
                        HStack(spacing: 10) {
                            Image(systemName: "lock.shield.fill")
                                .foregroundStyle(ConvoraTheme.textMuted)
                                .font(.system(size: 14))

                            Text("Lessons are narrated in your chosen language using your device's built-in voice engine. No data leaves your device.")
                                .font(.system(size: 12))
                                .foregroundStyle(ConvoraTheme.textMuted)
                        }
                        .padding(14)
                        .glassCard(cornerRadius: ConvoraTheme.radiusMd)
                    }
                    .padding()
                }
            }
            .navigationTitle("Audio Language")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundStyle(ConvoraTheme.accent)
                }
            }
        }
    }

    private func languageRow(_ lang: AudioLanguage) -> some View {
        let isSelected = languageManager.current == lang

        return Button {
            tts.stop()
            languageManager.setLanguage(lang)
            dismiss()
        } label: {
            HStack(spacing: 14) {
                Text(lang.flag)
                    .font(.system(size: 28))

                VStack(alignment: .leading, spacing: 2) {
                    Text(lang.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(ConvoraTheme.textPrimary)

                    Text(lang.nativeName)
                        .font(.system(size: 13))
                        .foregroundStyle(ConvoraTheme.textSecondary)
                }

                Spacer()

                // Preview button
                Button {
                    tts.previewLanguage(lang)
                } label: {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(ConvoraTheme.textMuted)
                        .frame(width: 32, height: 32)
                        .background(ConvoraTheme.surface)
                        .clipShape(Circle())
                }

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(ConvoraTheme.accent)
                        .font(.system(size: 22))
                }
            }
            .padding(14)
            .background(isSelected ? ConvoraTheme.accent.opacity(0.08) : Color.clear)
            .glassCard(cornerRadius: ConvoraTheme.radiusMd)
        }
        .sensoryFeedback(.selection, trigger: isSelected)
    }
}
