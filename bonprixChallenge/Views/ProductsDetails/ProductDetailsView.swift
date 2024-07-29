//
//  ProductDetails.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 26.07.24.
//

import Foundation
import SwiftUI

struct ProductDetailsView: View {
    @ObservedObject
    var viewModel: ProductDetailsViewModel
    
    @Environment(\.locale) private var locale
    
    init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GradientFlowView(content: self.content)
        ProductAddButton(viewModel: .init(parentViewModel: viewModel))
    }
    
    var content: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: viewModel.imageOfSelectedVariant)){ result in
                    result.image?.resizable()
                }.aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                    .padding()
                
                VStack(alignment: .leading,
                       spacing: 15) {
                    pricingSegment
                    
                    if viewModel.variants.isEmpty.isFalse {
                        Text("Farbe")
                            .font(.headline)
                        
                        ScrollView(.horizontal,
                                   showsIndicators: false) {
                            HStack {
                                ForEach(self.viewModel.variants,
                                        id: \.self) { variant in
                                    ProductVariant(viewModel: variant)
                                }
                            }
                        }
                    }
                    
                    Text("Beschreibung")
                        .font(.headline)
                    
                    Text(viewModel.product.description)
                        .font(.body)
                }
                       .padding()
                       .background(Color(UIColor.systemGray6))
                       .cornerRadius(20)
                       .padding(.horizontal)
                
            }
        }
        .background(.clear)
    }
    
    var pricingSegment: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.product.localizedPrice,
                     format: .currency(code: locale.currency?.identifier ?? "USD"))
                .font(.title)
                .fontWeight(.bold)
                
                Text("inkl. MwSt., zzgl. Versandkosten")
                    .font(.caption)
                    .foregroundColor(.gray)
            
            }
            
            Spacer()
            Image(systemName: viewModel.likeIcon)
                .font(.system(size: 30))
                .onTapGesture {
                    withAnimation(.snappy) {
                        viewModel.isLiked.toggle()
                    }
                }
        }
    }
}

#Preview {
    ProductDetailsView(viewModel: .init(product: Product(title: "Loose Fit Schlupfhose, Straight",
                                                         prices: [
                                                            .init(price: 37.99, currency: .euro),
                                                            .init(price: 40.99, currency: .dollar)
                                                         ],
                                                         isFavored: false,
                                                         isAvailable: true,
                                                         description: "Sportliche Schlupfhose mit elastischem Bund und Cargo-Taschen",
                                                         image: "https://image01.bonprix.de/assets/275x385/1568788775/19227355-fbfUTxDQ.jpg",
                                                         variants: [.init(color: "test",
                                                                          image: "https://image01.bonprix.de/assets/275x385/1568788775/19227355-fbfUTxDQ.jpg", isAvailable: true), .init(color: "test",
                                                                                                                                                                                         image: "https://image01.bonprix.de/assets/275x385/1568788775/19227355-fbfUTxDQ.jpg", isAvailable: true), .init(color: "test",
                                                                                                                                                                                                                                                                                                        image: "https://image01.bonprix.de/assets/275x385/1568788775/19227355-fbfUTxDQ.jpg", isAvailable: true),.init(color: "test",
                                                                                                                                                                                                                                                                                                                                                                                                                      image: "https://image01.bonprix.de/assets/275x385/1568788775/19227355-fbfUTxDQ.jpg", isAvailable: true), .init(color: "test",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     image: "https://image01.bonprix.de/assets/275x385/1568788775/19227355-fbfUTxDQ.jpg", isAvailable: true), .init(color: "test",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    image: "https://image01.bonprix.de/assets/275x385/1568788775/19227355-fbfUTxDQ.jpg", isAvailable: true)]))
    )
}
