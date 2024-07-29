//
//  ProductAddButton.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 28.07.24.
//

import Foundation
import SwiftUI

struct ProductAddButton: View {
    @ObservedObject
    var viewModel: AddButtonViewModel
    
    var body: some View {
        Button(action: {
            withAnimation {
                viewModel.isAdded = true
            }
        }) {
            if viewModel.isAdded {
                HStack {
                    Image(systemName: viewModel.buttonIcon)
                        .font(.system(size: 40))
                        .foregroundColor(viewModel.isSelectionValid
                                         ? .red
                                         : .green)
                        .padding(.horizontal)
                    Text(viewModel.buttonText)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.viewModel.isAdded = false
                        }
                     }
                }
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
            } else {
                Text("In die Einkaufstasche")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

}
