//
//  ProductVariantViewModel.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 28.07.24.
//

import Foundation
import SwiftUI
import Combine

class ProductVariantViewModel: ObservableObject, Hashable {
    @Published var variant: Variant
    
    @Binding var selectedVariant: Variant?
     
    @Published var isSelected: Bool
    
    init(variant: Variant, selectedVariant: Binding<Variant?>) {
        self.variant = variant
        self._selectedVariant = selectedVariant
        self.isSelected = selectedVariant.wrappedValue?.id == variant.id
    }
    
    static func == (lhs: ProductVariantViewModel, rhs: ProductVariantViewModel) -> Bool {
        return lhs.variant.id == rhs.variant.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(variant.id)
    }
    
    func selectCurrentVariant() {
        self.selectedVariant = self.variant
    }
}
