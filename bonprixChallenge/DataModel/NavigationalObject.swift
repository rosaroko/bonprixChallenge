//
//  NavigationalObject.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 27.07.24.
//

import Foundation

enum ViewType {
    case product, details
}

struct NavigationalObject: Identifiable, Hashable {
    var id = UUID()
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    static func == (lhs: NavigationalObject,
                    rhs: NavigationalObject) -> Bool {
        lhs.id == lhs.id
    }
    
    let view: ViewType
    var product: Product?
}
