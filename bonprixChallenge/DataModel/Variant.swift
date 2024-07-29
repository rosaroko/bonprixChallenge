//
//  Variant.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 26.07.24.
//

import Foundation

struct Variant: Identifiable, Equatable {
    var id = UUID()
    var color: String
    var image: String
    var isAvailable: Bool
}
