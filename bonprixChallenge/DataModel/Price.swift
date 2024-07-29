//
//  Price.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 26.07.24.
//

import Foundation

struct Price{
    let price: Float
    let currency: Currency
}

enum Currency {
    case euro, dollar
}
