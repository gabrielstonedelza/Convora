import SwiftUI

struct AudioPlayerBar: View {
    let lessonText: String
    let dayNumber: Int
    let weekIndex: Int

    @Environment(TTSManager.self) private var tts
    @Environment(LanguageManager.self) private var language
    @State private var showLanguagePicker = false

    private var weekColor: Color {
        ConvoraTheme.weekColor(weekIndex)
    }

    var body: some View {
        HStack(spacing: 12) {
            // Play/Pause button
            Button {
                if tts.isSpeaking && !tts.isPaused {
                    tts.pause()
                } else if tts.isPaused {
                    tts.resume()
                } else {
                    tts.speak(lessonText, dayNumber: dayNumber)
                }
            } label: {
                ZStack {
                    Circle()
                        .fill(weekColor)
                        .frame(width: 44, height: 44)

                    Image(systemName: playIcon)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                }
            }
            .sensoryFeedback(.impact(flexibility: .soft), trigger: tts.isSpeaking)

            VStack(alignment: .leading, spacing: 2) {
                Text("Listen to lesson")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(ConvoraTheme.textPrimary)

                Text(statusText)
                    .font(.system(size: 12))
                    .foregroundStyle(ConvoraTheme.textSecondary)
            }

            Spacer()

            // Language flag button
            Button {
                showLanguagePicker = true
            } label: {
                HStack(spacing: 4) {
                    Text(language.current.flag)
                        .font(.system(size: 20))

                    Image(systemName: "chevron.down")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundStyle(ConvoraTheme.textMuted)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(ConvoraTheme.surface)
                .clipShape(Capsule())
            }

            // Stop button (when speaking)
            if tts.isSpeaking || tts.isPaused {
                Button {
                    tts.stop()
                } label: {
                    Image(systemName: "stop.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(ConvoraTheme.textSecondary)
                        .frame(width: 36, height: 36)
                        .background(ConvoraTheme.surface)
                        .clipShape(Circle())
                }
            }
        }
        .padding(14)
        .glassCard(accentColor: weekColor)
        .sheet(isPresented: $showLanguagePicker) {
            LanguagePickerSheet()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }

    private var playIcon: String {
        if tts.isSpeaking && !tts.isPaused {
            return "pause.fill"
        } else {
            return "play.fill"
        }
    }

    private var statusText: String {
        if tts.isSpeaking && !tts.isPaused {
            return "\(language.current.flag) Playing in \(language.current.name)"
        } else if tts.isPaused {
            return "\(language.current.flag) Paused"
        } else {
            return "\(language.current.flag) \(language.current.name)"
        }
    }
}
