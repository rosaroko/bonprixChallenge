//
//  AddButtonViewModel.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 28.07.24.
//

import Foundation
import SwiftUI

class AddButtonViewModel: ObservableObject {
    @ObservedObject
    var parentViewModel: ProductDetailsViewModel
    @Published var isAdded = false

    var isSelectionValid: Bool {
        get {
            parentViewModel.selectedVariant == nil && parentViewModel.variants.isEmpty.isFalse
        }
    }
    
    var buttonText: String {
        get {
            isSelectionValid
            ? "Wähl erstmal die Farbe aus, Digga"
            : "In die Einkaufstasche hinzugefügt"
        }
    }
    
    var buttonIcon: String {
        get {
            isSelectionValid 
            ? "xmark.circle"
            : "checkmark.circle"
        }
    }
    
    init(parentViewModel: ProductDetailsViewModel) {
        self.parentViewModel = parentViewModel
    }
}
