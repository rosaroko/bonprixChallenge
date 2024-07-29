//
//  ProductCardViewModel.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 26.07.24.
//

import Foundation
import SwiftUI

class ProductCardViewModel: ObservableObject {

    let product: Product
    
    init(product: Product) {
        self.product = product
    }
}
