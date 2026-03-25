import SwiftUI

struct GlassCard<Content: View>: View {
    let cornerRadius: CGFloat
    let accentColor: Color?
    @ViewBuilder let content: () -> Content

    init(
        cornerRadius: CGFloat = ConvoraTheme.radiusLg,
        accentColor: Color? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.cornerRadius = cornerRadius
        self.accentColor = accentColor
        self.content = content
    }

    var body: some View {
        content()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(
                        accentColor?.opacity(0.15) ?? ConvoraTheme.glassBorder,
                        lineWidth: 0.5
                    )
            )
    }
}

// MARK: - View Modifier version
struct GlassCardModifier: ViewModifier {
    let cornerRadius: CGFloat
    let accentColor: Color?

    func body(content: Content) -> some View {
        content
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(
                        accentColor?.opacity(0.15) ?? ConvoraTheme.glassBorder,
                        lineWidth: 0.5
                    )
            )
    }
}

extension View {
    func glassCard(
        cornerRadius: CGFloat = ConvoraTheme.radiusLg,
        accentColor: Color? = nil
    ) -> some View {
        modifier(GlassCardModifier(cornerRadius: cornerRadius, accentColor: accentColor))
    }
}

// MARK: - Accent Glass Card (tinted)
struct AccentGlassCard<Content: View>: View {
    let accentColor: Color
    let cornerRadius: CGFloat
    @ViewBuilder let content: () -> Content

    init(
        accentColor: Color = ConvoraTheme.accent,
        cornerRadius: CGFloat = ConvoraTheme.radiusLg,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.accentColor = accentColor
        self.cornerRadius = cornerRadius
        self.content = content
    }

    var body: some View {
        content()
            .background(
                ZStack {
                    Color.black.opacity(0.3)
                    accentColor.opacity(0.08)
                }
            )
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(accentColor.opacity(0.2), lineWidth: 0.5)
            )
    }
}
