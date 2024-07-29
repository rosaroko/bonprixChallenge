//
//  AnimatedGradient.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 26.07.24.
//

import Foundation
import SwiftUI

struct AnimatedGradient: View {
    @State private var startingPoint = UnitPoint(x: 0,
                                                 y: 0)
    
    @State private var endingPoint = UnitPoint(x: 0,
                                               y: 2)
   
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.gray, .white, .black]),
                       startPoint: startingPoint,
                       endPoint: endingPoint)
        .onReceive(Timer.publish(every: 1,
                                 on: .main,
                                 in: .default).autoconnect(),
                   perform: { _ in
            withAnimation(.easeInOut(duration: 6).repeatForever()) {
                self.startingPoint = UnitPoint(x: 4,
                                               y: 0)
                self.endingPoint = UnitPoint(x: 0,
                                             y: 2)
                self.startingPoint = UnitPoint(x: 0,
                                               y: 2)
                self.startingPoint = UnitPoint(x: 4,
                                               y: 0)
            }
        })
    }
}

#Preview {
    AnimatedGradient()
}
