import Foundation
import StoreKit

@MainActor
@Observable
class PurchaseManager {
    var isPremium: Bool = false
    var products: [Product] = []
    var isLoading: Bool = false

    private static let productIDs: Set<String> = [
        "convora_monthly",
        "convora_annual",
        "convora_lifetime"
    ]

    private var transactionListener: Task<Void, Never>?

    init() {
        listenForTransactions()
        Task {
            await loadProducts()
            await checkEntitlements()
        }
    }

    // MARK: - Public Methods

    func loadProducts() async {
        isLoading = true
        do {
            let storeProducts = try await Product.products(for: Self.productIDs)

            let sortOrder: [String: Int] = [
                "convora_monthly": 0,
                "convora_annual": 1,
                "convora_lifetime": 2
            ]

            products = storeProducts.sorted {
                (sortOrder[$0.id] ?? 99) < (sortOrder[$1.id] ?? 99)
            }
        } catch {
            print("Failed to load products: \(error)")
        }
        isLoading = false
    }

    func purchase(_ product: Product) async throws {
        let result = try await product.purchase()

        switch result {
        case .success(let verification):
            let transaction = try checkVerified(verification)
            await transaction.finish()
            await checkEntitlements()

        case .userCancelled:
            break

        case .pending:
            break

        @unknown default:
            break
        }
    }

    func restorePurchases() async {
        try? await AppStore.sync()
        await checkEntitlements()
    }

    func canAccessDay(_ day: Int) -> Bool {
        isDayFree(day) || isPremium
    }

    func isDayFree(_ day: Int) -> Bool {
        day <= 7
    }

    // MARK: - Private Methods

    private func listenForTransactions() {
        transactionListener = Task.detached { [weak self] in
            for await result in Transaction.updates {
                guard let self = self else { return }
                if let transaction = try? await self.checkVerified(result) {
                    await transaction.finish()
                    await self.checkEntitlements()
                }
            }
        }
    }

    private func checkEntitlements() async {
        var hasPremium = false

        for await result in Transaction.currentEntitlements {
            if let transaction = try? checkVerified(result) {
                switch transaction.productType {
                case .autoRenewable:
                    if transaction.revocationDate == nil {
                        hasPremium = true
                    }
                case .nonConsumable:
                    if transaction.revocationDate == nil {
                        hasPremium = true
                    }
                default:
                    break
                }
            }
        }

        isPremium = hasPremium
    }

    private func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified(_, let error):
            throw error
        case .verified(let value):
            return value
        }
    }
}
