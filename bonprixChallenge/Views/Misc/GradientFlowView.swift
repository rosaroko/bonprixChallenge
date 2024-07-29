//
//  GradientFlowView.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 28.07.24.
//

import Foundation
import SwiftUI

struct GradientFlowView<Content>: View where Content: View {
    var content: Content
    
    var body: some View {
        ZStack{
            AnimatedGradient().edgesIgnoringSafeArea(.all)
                .blur(radius: 12)
            content
        }
    }
}
