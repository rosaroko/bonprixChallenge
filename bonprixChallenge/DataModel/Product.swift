//
//  Product.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 26.07.24.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var title: String
    var prices: [Price]
    var isFavored: Bool
    var isAvailable: Bool
    var description: String
    var image: String
    var variants: [Variant]
    
    var localizedPrice: Float {
        get {
            guard let price = self.prices.first(where: { $0.currency == .euro })?.price else {
                return 0.0
            }
            return price
        }
    }
}
