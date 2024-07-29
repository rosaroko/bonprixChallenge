//
//  ProductVariant.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 28.07.24.
//

import Foundation
import SwiftUI

struct ProductVariant: View {
    @ObservedObject
    var viewModel: ProductVariantViewModel
    
    var body: some View {
        Button(action: {
            self.viewModel.selectCurrentVariant()
        }) {
            Text(viewModel.variant.color)
                .padding()
                .font(.subheadline)
                .lineLimit(1)
                .background(viewModel.isSelected
                            ? .black
                            : .white)
                .foregroundColor(viewModel.isSelected
                                 ? .white 
                                 : .black)
                .cornerRadius(8)
                .overlay(viewModel.isSelected.isFalse
                         ? RoundedRectangle(cornerRadius: 8).stroke(.black,
                                                                    lineWidth: 1)
                         : nil)
        }
    }
}

