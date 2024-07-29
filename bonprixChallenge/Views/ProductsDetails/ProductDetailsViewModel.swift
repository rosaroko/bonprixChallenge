//
//  ProductDetailsViewModel.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 27.07.24.
//

import Foundation
import SwiftUI

class ProductDetailsViewModel: ObservableObject {    
    var product: Product
    
    @Published var isLiked = false

    @Published var variants: [ProductVariantViewModel] = []
    @Published var selectedVariant: Variant?
    
    var imageOfSelectedVariant: String {
        get {
            guard let selectedVariant = self.selectedVariant else {
                return product.image
            }
            
            return selectedVariant.image
        }
    }
    
    var likeIcon: String {
        isLiked ? "heart.fill" : "heart"
    }
    
    init(product: Product) {
        self.product = product
        self.variants = []
    
        let binding = Binding(get: {
            self.selectedVariant
        }, set: { variant in
            self.variants.forEach { model in
                model.isSelected = model.variant.id == variant?.id
            }
            self.selectedVariant = variant
        })
        
        product.variants.forEach { variant in
            self.variants.append(.init(variant: variant,
                                       selectedVariant: binding))
        }
    }
}
