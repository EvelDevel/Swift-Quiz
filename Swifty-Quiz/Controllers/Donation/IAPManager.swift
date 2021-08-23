//
//  IAPManager.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 23.08.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation
import StoreKit

final class IAPManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    static let shared = IAPManager()
    
    var products = [SKProduct]()
    
    enum Product: String, CaseIterable {
        case swiftyQuizDonate99
        case swiftyQuizDonate179
        case swiftyQuizDonate279
        case swiftyQuizDonate379
    }
    
    public func fetchProducts() {
        let request = SKProductsRequest(
            productIdentifiers: Set(Product.allCases.compactMap( { $0.rawValue }))
        )
        request.delegate = self
        request.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
    }
    
    public func purchase(product: Product) {
        guard SKPaymentQueue.canMakePayments() else {
            return
        }
        guard let storeKitProduct = products
                .first(where: {
                        $0.productIdentifier == product.rawValue
                }) else {
            return
        }
        
        let paymentRequest = SKPayment(product: storeKitProduct)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(paymentRequest)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue,
                      updatedTransactions transactions: [SKPaymentTransaction]) {
        
        transactions.forEach({
            switch $0.transactionState {
            case .purchasing:
                break
            case .purchased:
                print("purchased")
                SKPaymentQueue.default().finishTransaction($0)
                SKPaymentQueue.default().remove(self)
            case .failed:
                break
            case .restored:
                break
            case .deferred:
                break
            @unknown default:
                break
            }
        })
    }
}
