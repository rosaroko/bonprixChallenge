//
//  ProductCard.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 26.07.24.
//
import SwiftUI
import Foundation

struct ProductCard: View {
    @ObservedObject
    var viewModel: ProductCardViewModel
    @Environment(\.locale) private var locale

    var body: some View {
        GeometryReader{ reader in
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: viewModel.product.image)){ result in
                    result.image?.resizable()
                }
                .frame(height: 200)
                    
                Text(viewModel.product.title)
                    .lineLimit(2)
                    .padding([.top, .leading, .trailing])
                
                Text(viewModel.product.localizedPrice,
                     format: .currency(code: locale.currency?.identifier ?? "USD"))
                    .font(.subheadline)
                    .padding([.leading, .bottom, .trailing])
            }
            .frame(maxWidth: 300)
            .background(Color.white)
            .shadow(radius: 2)
            .cornerRadius(10)
        }
    }
}

#Preview {
    ProductCard(viewModel: .init(product: Product(title: "Loose Fit Schlupfhose, Straight",
                                                  prices: [
                                                      .init(price: 37.99, currency: .euro),
                                                      .init(price: 40.99, currency: .dollar),
                                                  ],
                                                  isFavored: false,
                                                  isAvailable: true,
                                                  description: "Sportliche Schlupfhose mit elastischem Bund und Cargo-Taschen",
                                                  image: "https://image01.bonprix.de/assets/275x385/1568788775/19227355-fbfUTxDQ.jpg", variants: []))
    )
}
