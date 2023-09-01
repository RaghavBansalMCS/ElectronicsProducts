//
//  GridTopBar.swift
//  ClassProject
//
//  Created by Consultant on 7/17/23.
//

import SwiftUI

struct TopBar: View {
    @StateObject var viewModel = productViewModel(networkManager: NetworkManager())
    var gridColumns = [GridItem(.flexible())]
    var body: some View {
        ScrollView(.horizontal){
                LazyHGrid(rows: gridColumns) {
                    if let products = viewModel.productsMain?.products {
                        ForEach(products, id:\.id) { product in
                            VStack{
                                NavigationLink {
                                    ContentView()
                                } label: {
                                    TopBarCell(product: product)
                                }
                                
                            }
                        }
                    }
                    else{
                        Text("fnfjf")
                    }
                }.background(Color.white)
                .task {
                    await viewModel.getProductsFromAPI(urlString: API.productsAPI)
                }
            
        }
    }
}

struct GridTopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}
