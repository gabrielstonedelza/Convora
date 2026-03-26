import SwiftUI

struct PaywallView: View {
    @Environment(PurchaseManager.self) private var purchases
    @Environment(\.dismiss) private var dismiss

    @State private var appeared = false
    @State private var purchaseError: String?
    @State private var isPurchasing = false

    private let features = [
        "Full 28-day expert curriculum",
        "Audio narration in 5 languages",
        "Daily exercises & challenges",
        "Progress tracking & streaks",
    ]

    var body: some View {
        ZStack {
            ConvoraTheme.background.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    // Emoji
                    Text("🚀")
                        .font(.system(size: 56))
                        .scaleEffect(appeared ? 1 : 0.5)
                        .animation(.spring(duration: 0.5, bounce: 0.4), value: appeared)

                    // Title
                    VStack(spacing: 8) {
                        Text("Unlock Your Full Potential")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundStyle(ConvoraTheme.textPrimary)
                            .multilineTextAlignment(.center)

                        Text("Get unlimited access to all 28 days of communication mastery")
                            .font(.system(size: 15))
                            .foregroundStyle(ConvoraTheme.textSecondary)
                            .multilineTextAlignment(.center)
                    }

                    // Features
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(features, id: \.self) { feature in
                            HStack(spacing: 12) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(ConvoraTheme.accent)
                                    .font(.system(size: 18))

                                Text(feature)
                                    .font(.system(size: 15))
                                    .foregroundStyle(ConvoraTheme.textPrimary)
                            }
                        }
                    }
                    .padding(.vertical, 8)

                    // Pricing
                    VStack(spacing: 12) {
                        pricingButton(
                            title: "Annual",
                            price: formattedPrice(for: "com.convora.app.annual") ?? "$39.99/year",
                            badge: "SAVE 52%",
                            isHighlighted: true,
                            productId: "com.convora.app.annual"
                        )

                        pricingButton(
                            title: "Monthly",
                            price: formattedPrice(for: "com.convora.app.monthly") ?? "$6.99/month",
                            badge: nil,
                            isHighlighted: false,
                            productId: "com.convora.app.monthly"
                        )
                    }

                    // Restore
                    Button {
                        Task { await purchases.restorePurchases() }
                    } label: {
                        Text("Restore Purchases")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(ConvoraTheme.textSecondary)
                    }

                    // Error message
                    if let purchaseError {
                        Text(purchaseError)
                            .font(.system(size: 13))
                            .foregroundStyle(.red)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                    }

                    // Legal
                    VStack(spacing: 8) {
                        Text("Payment will be charged to your Apple ID account. Subscriptions automatically renew unless cancelled at least 24 hours before the end of the current period.")
                            .font(.system(size: 10))
                            .foregroundStyle(ConvoraTheme.textMuted)
                            .multilineTextAlignment(.center)

                        HStack(spacing: 16) {
                            Link("Privacy Policy", destination: URL(string: "https://connectdevs.dev/convora/privacy")!)
                            Link("Terms of Use", destination: URL(string: "https://connectdevs.dev/convora/terms")!)
                        }
                        .font(.system(size: 11))
                        .foregroundStyle(ConvoraTheme.textSecondary)
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
                .padding(.bottom, 40)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button { dismiss() } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(ConvoraTheme.textSecondary)
                        .frame(width: 32, height: 32)
                        .background(ConvoraTheme.surfaceLight)
                        .clipShape(Circle())
                }
            }
        }
        .onAppear { appeared = true }
    }

    private func pricingButton(
        title: String,
        price: String,
        badge: String?,
        isHighlighted: Bool,
        productId: String
    ) -> some View {
        Button {
            Task {
                guard let product = purchases.products.first(where: { $0.id == productId }) else {
                    purchaseError = "Products not available. Please check your connection and try again."
                    await purchases.loadProducts()
                    return
                }
                isPurchasing = true
                purchaseError = nil
                do {
                    try await purchases.purchase(product)
                    if purchases.isPremium {
                        dismiss()
                    }
                } catch {
                    purchaseError = "Purchase failed. Please try again."
                }
                isPurchasing = false
            }
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                    Text(price)
                        .font(.system(size: 13))
                        .foregroundStyle(isHighlighted ? .white.opacity(0.8) : ConvoraTheme.textSecondary)
                }

                Spacer()

                if let badge {
                    Text(badge)
                        .font(.system(size: 10, weight: .bold))
                        .tracking(0.5)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(isHighlighted ? .white.opacity(0.2) : ConvoraTheme.accent.opacity(0.15))
                        .clipShape(Capsule())
                        .foregroundStyle(isHighlighted ? .white : ConvoraTheme.accent)
                }
            }
            .foregroundStyle(isHighlighted ? .white : ConvoraTheme.textPrimary)
            .padding(18)
            .background(
                isHighlighted
                    ? AnyShapeStyle(ConvoraTheme.accentGradient)
                    : AnyShapeStyle(ConvoraTheme.surfaceLight)
            )
            .clipShape(RoundedRectangle(cornerRadius: ConvoraTheme.radiusMd, style: .continuous))
            .overlay(
                !isHighlighted
                    ? RoundedRectangle(cornerRadius: ConvoraTheme.radiusMd, style: .continuous)
                        .strokeBorder(ConvoraTheme.glassBorder, lineWidth: 0.5)
                    : nil
            )
        }
        .sensoryFeedback(.impact(weight: .medium), trigger: isHighlighted)
    }

    private func formattedPrice(for productId: String) -> String? {
        purchases.products.first { $0.id == productId }?.displayPrice
    }
}
