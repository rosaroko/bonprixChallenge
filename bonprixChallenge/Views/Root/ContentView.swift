//
//  ContentView.swift
//  bonprixChallenge
//
//  Created by Roman Sorokin on 26.07.24.
//
import SwiftUI
import Foundation

struct ContentView: View {
    @State
    var path: [NavigationalObject] = []

    var body: some View {
        NavigationStack(path: $path) {
            GradientFlowView(content:
                VStack {
                    VStack {
                        Image(uiImage: UIImage(named: "roman.jpg")!)
                            .resizable()
                            .frame(width: 200,
                                   height: 200)
                            .clipShape(Circle())
                        
                        Text("Roman Sorokin")
                            .font(Font.custom("HelveticaNeue-Bold",
                                              size: 26))
                            .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
               
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.path = [.init(view: .product,
                                               product: nil)]
                        }
                    }
                }.navigationDestination(for: NavigationalObject.self) { object in
                    switch object.view {
                    case .details:
                        ProductDetailsView(viewModel: .init(product: object.product!))
                    case .product:
                        ProductsView(path: $path)
                    }
                }
            )
        }
    }
}

#Preview{
    ContentView()
}
