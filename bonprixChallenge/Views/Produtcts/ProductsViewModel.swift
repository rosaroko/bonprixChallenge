//
//  ContentViewViewModel.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 26.07.24.
//

import Foundation
import SwiftUI

class ProductsViewModel: ObservableObject {    
    
    @Published
    var offset: CGFloat = 0.0
    
    @Published
    var products = [
        Product(title: "Strickkleid mit Bindeband",
                prices: [
                    .init(price: 23.99, 
                          currency: .euro),
                    .init(price: 25.99,
                          currency: .dollar),
                ],
                isFavored: false,
                isAvailable: true,
                description: "Modernes Strickkleid mit Ballon Ärmeln",
                image: "https://image01.bonprix.de/assets/275x385/1692190166/23120919-ledODpTJ.jpg",
                variants: [
                    .init(color: "grau meliert",
                          image: "https://image01.bonprix.de/assets/275x385/1692190166/23120919-ledODpTJ.jpg",
                          isAvailable: true),
                    .init(color: "schwarz",
                          image: "https://image01.bonprix.de/assets/275x385/1692190099/23122048-j0pv69LB.jpg",
                          isAvailable: false),
                    .init(color: "kastanienbraun",
                          image: "https://image01.bonprix.de/assets/275x385/1600856915/20167389-2HSkctsd.jpg",
                          isAvailable: true)
                ]),
        Product(title: "Loose Fit Schlupfhose, Straight",
                prices: [
                    .init(price: 37.99,
                          currency: .euro),
                    .init(price: 40.99,
                          currency: .dollar),
                ],
                isFavored: false,
                isAvailable: true,
                description: "Sportliche Schlupfhose mit elastischem Bund und Cargo-Taschen",
                image: "https://image01.bonprix.de/assets/275x385/1568788775/19227355-fbfUTxDQ.jpg",
                variants: []),
    ]
}
