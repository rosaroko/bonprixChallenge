import SwiftUI

struct ProductsView: View {
    @Binding var path: [NavigationalObject]

    @ObservedObject
    var viewModel: ProductsViewModel = .init()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        GradientFlowView(content: self.content)
            .navigationTitle("Produktübersicht")
    }
    
    var content: some View {
        ScrollView {
            VStack(alignment: .leading) {
                LazyVGrid(columns: columns,
                          spacing: 1) {
                    ForEach(viewModel.products) { product in
                        ProductCard(viewModel: .init(product: product))
                            .frame(width: (UIScreen.main.bounds.width) / 2.4,
                                   height: 300)
                            .shadow(radius: 5)
                            .onTapGesture {
                                self.path.append(.init(view: .details,
                                                       product: product))
                            }
                    }
                }
                .padding()
            }
        }
    }
}


#Preview{
    struct Preview: View {
        @State var path: [NavigationalObject] 
        
        var body: some View {
            ProductsView(path: $path)
        }
    }

    return Preview(path: [])
}
