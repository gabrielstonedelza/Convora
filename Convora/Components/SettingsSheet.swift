import SwiftUI

struct SettingsSheet: View {
    @Environment(ProgressManager.self) private var progress
    @Environment(PurchaseManager.self) private var purchases
    @Environment(LanguageManager.self) private var language
    @Environment(\.dismiss) private var dismiss

    @State private var showLanguagePicker = false

    var body: some View {
        NavigationStack {
            ZStack {
                ConvoraTheme.background.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        // MARK: - Subscription
                        subscriptionSection

                        // MARK: - Notifications
                        NotificationSettingsRow()

                        // MARK: - Audio Language
                        audioLanguageSection

                        // MARK: - Actions
                        actionsSection

                        // MARK: - About
                        aboutSection
                    }
                    .padding()
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(ConvoraTheme.accent)
                }
            }
        }
        .sheet(isPresented: $showLanguagePicker) {
            LanguagePickerSheet()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }

    // MARK: - Subscription Section
    private var subscriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("SUBSCRIPTION")
                .font(.system(size: 11, weight: .bold))
                .tracking(1.5)
                .foregroundStyle(ConvoraTheme.textMuted)

            HStack {
                Image(systemName: purchases.isPremium ? "star.fill" : "star")
                    .foregroundStyle(ConvoraTheme.accent)
                    .font(.system(size: 20))

                VStack(alignment: .leading, spacing: 2) {
                    Text(purchases.isPremium ? "Premium" : "Free Plan")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(ConvoraTheme.textPrimary)

                    Text(purchases.isPremium ? "Full access unlocked" : "Week 1 (7 days) unlocked")
                        .font(.system(size: 13))
                        .foregroundStyle(ConvoraTheme.textSecondary)
                }

                Spacer()

                if !purchases.isPremium {
                    Text("Upgrade")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(ConvoraTheme.accent)
                }
            }
            .padding(16)
            .glassCard(cornerRadius: ConvoraTheme.radiusMd)
        }
    }

    // MARK: - Audio Language
    private var audioLanguageSection: some View {
        Button {
            showLanguagePicker = true
        } label: {
            HStack(spacing: 14) {
                Text(language.current.flag)
                    .font(.system(size: 24))

                VStack(alignment: .leading, spacing: 2) {
                    Text("Audio Language")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(ConvoraTheme.textPrimary)

                    Text(language.current.name)
                        .font(.system(size: 13))
                        .foregroundStyle(ConvoraTheme.textSecondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(ConvoraTheme.textMuted)
            }
            .padding(16)
            .glassCard(cornerRadius: ConvoraTheme.radiusMd)
        }
    }

    // MARK: - Actions
    private var actionsSection: some View {
        VStack(spacing: 0) {
            settingsRow(icon: "star.bubble", title: "Rate Convora", color: ConvoraTheme.accent) {
                ReviewManager.openStoreListing()
            }

            Divider().background(ConvoraTheme.glassBorder)

            settingsRow(icon: "arrow.clockwise", title: "Restore Purchases", color: ConvoraTheme.textSecondary) {
                Task { await purchases.restorePurchases() }
            }
        }
        .glassCard(cornerRadius: ConvoraTheme.radiusMd)
    }

    // MARK: - About
    private var aboutSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("ABOUT")
                .font(.system(size: 11, weight: .bold))
                .tracking(1.5)
                .foregroundStyle(ConvoraTheme.textMuted)

            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Convora")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(ConvoraTheme.textPrimary)

                        Text("Version 1.0.0")
                            .font(.system(size: 13))
                            .foregroundStyle(ConvoraTheme.textSecondary)

                        Text("28-Day Communication Mastery")
                            .font(.system(size: 12))
                            .foregroundStyle(ConvoraTheme.textMuted)
                    }

                    Spacer()
                }
                .padding(16)

                Divider().background(ConvoraTheme.glassBorder)

                Link(destination: URL(string: "https://connectdevs.dev/convora/privacy")!) {
                    settingsLinkRow(title: "Privacy Policy")
                }

                Divider().background(ConvoraTheme.glassBorder)

                Link(destination: URL(string: "https://connectdevs.dev/convora/terms")!) {
                    settingsLinkRow(title: "Terms of Use")
                }
            }
            .glassCard(cornerRadius: ConvoraTheme.radiusMd)
        }
    }

    private func settingsLinkRow(title: String) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 15))
                .foregroundStyle(ConvoraTheme.textPrimary)

            Spacer()

            Image(systemName: "arrow.up.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(ConvoraTheme.textMuted)
        }
        .padding(16)
    }

    private func settingsRow(
        icon: String,
        title: String,
        color: Color,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .foregroundStyle(color)
                    .font(.system(size: 16))
                    .frame(width: 24)

                Text(title)
                    .font(.system(size: 15))
                    .foregroundStyle(ConvoraTheme.textPrimary)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(ConvoraTheme.textMuted)
            }
            .padding(16)
        }
    }
}
