import SwiftUI

struct StatChip: View {
    let emoji: String
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 6) {
            Text(emoji)
                .font(.system(size: 18))

            Text(value)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundStyle(ConvoraTheme.textPrimary)

            Text(label)
                .font(.system(size: 10, weight: .medium))
                .foregroundStyle(ConvoraTheme.textMuted)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .glassCard(cornerRadius: ConvoraTheme.radiusMd)
    }
}
