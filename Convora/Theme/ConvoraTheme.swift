import SwiftUI

enum ConvoraTheme {
    // MARK: - Core Colors (Midnight Ember)
    static let background = Color(hex: "0B1622")
    static let surface = Color(hex: "132033")
    static let surfaceLight = Color(hex: "1A2D45")
    static let surfaceCard = Color(hex: "162A40")

    // MARK: - Accent
    static let accent = Color(hex: "E8A838")
    static let accentLight = Color(hex: "F5C563")
    static let accentDark = Color(hex: "CC8B1F")

    // MARK: - Text
    static let textPrimary = Color(hex: "F0ECE3")
    static let textSecondary = Color(hex: "8A9BB5")
    static let textMuted = Color(hex: "5C6F89")

    // MARK: - Week Colors
    static let week1 = Color(hex: "E8A838") // Gold
    static let week2 = Color(hex: "30D5C8") // Teal (iOS vibrancy)
    static let week3 = Color(hex: "FF6B81") // Rose
    static let week4 = Color(hex: "8B7CF6") // Violet

    static func weekColor(_ weekIndex: Int) -> Color {
        switch weekIndex {
        case 0: return week1
        case 1: return week2
        case 2: return week3
        case 3: return week4
        default: return accent
        }
    }

    // MARK: - Gradients
    static let accentGradient = LinearGradient(
        colors: [accent, accentLight],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static func weekGradient(_ weekIndex: Int) -> LinearGradient {
        let color = weekColor(weekIndex)
        return LinearGradient(
            colors: [color.opacity(0.8), color],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    static func heroGradient(_ weekIndex: Int = 0) -> LinearGradient {
        let color = weekColor(weekIndex)
        return LinearGradient(
            colors: [color.opacity(0.08), background],
            startPoint: .top,
            endPoint: .center
        )
    }

    // MARK: - Spacing
    static let spaceSm: CGFloat = 8
    static let spaceMd: CGFloat = 16
    static let spaceLg: CGFloat = 24
    static let spaceXl: CGFloat = 32

    // MARK: - Radii
    static let radiusSm: CGFloat = 10
    static let radiusMd: CGFloat = 14
    static let radiusLg: CGFloat = 20
    static let radiusXl: CGFloat = 28

    // MARK: - Glass Effect
    static let glassBorder = Color.white.opacity(0.06)
    static let glassBorderAccent = Color.white.opacity(0.1)
}
