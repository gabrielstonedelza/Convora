import Foundation
import StoreKit
import UIKit

enum ReviewManager {
    private static let hasRatedKey = "has_rated_app"
    private static let promptCountKey = "rate_prompt_count"
    private static let triggerDays: Set<Int> = [7, 14, 21]
    private static let maxPrompts = 3

    // MARK: - Public Methods

    static func maybeRequestReview(completedDay: Int) {
        guard triggerDays.contains(completedDay) else { return }

        let defaults = UserDefaults.standard
        guard !defaults.bool(forKey: hasRatedKey) else { return }

        let promptCount = defaults.integer(forKey: promptCountKey)
        guard promptCount < maxPrompts else { return }

        defaults.set(promptCount + 1, forKey: promptCountKey)

        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first(where: { $0.activationState == .foregroundActive })
            else { return }

            SKStoreReviewController.requestReview(in: windowScene)
        }
    }

    static func markAsRated() {
        UserDefaults.standard.set(true, forKey: hasRatedKey)
    }

    // IMPORTANT: Replace this with your actual App Store ID after first submission
    private static let appStoreID = "000000000"

    static func openStoreListing() {
        let appStoreURL = "https://apps.apple.com/app/convora/id\(appStoreID)"
        if let url = URL(string: appStoreURL) {
            DispatchQueue.main.async {
                UIApplication.shared.open(url)
            }
        }
    }
}
