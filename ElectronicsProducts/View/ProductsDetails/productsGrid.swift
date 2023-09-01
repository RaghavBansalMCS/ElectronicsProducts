//
//  GridHome.swift
//  ClassProject
//
//  Created by Consultant on 7/17/23.
//

import SwiftUI

struct productsGrid: View {
    
    @EnvironmentObject var cartManager: CartManager
    @StateObject var viewModel = productViewModel(networkManager: NetworkManager())
    @State var HasErrorOccured = false
    var gridColumns = [GridItem(.flexible())]
    @State var index:Int = 0
    var body: some View {
        ScrollView(.horizontal){
                LazyHGrid(rows: gridColumns) {
                    
                    if viewModel.customError != nil{
                        Text(viewModel.customError?.errorDescription ?? "Something Went Worng")
                    }else{
                        gridHomeFunc()
                    }
                    
                }.background(Color.white)
                .onAppear{
                    Task {
                            await viewModel.getProductsFromAPI(urlString: API.productsAPI)
                       await getProducts()
                        
                    }
                }
                   .refreshable {
                 await viewModel.getProductsFromAPI(urlString: API.productsAPI)
                      await  getProducts()
                       
                   }
                   .alert(isPresented: $HasErrorOccured) {
                       Alert(title: Text("Something went Wrong"),
                                         message: Text(viewModel.customError?.errorDescription ?? "Something Went Wrong"),
                                         dismissButton: .default(Text("Dismiss")))
                   }
            
            
            
        }
        
        
       
        }
    @ViewBuilder
    func gridHomeFunc() -> some View{
        
        if let products = viewModel.productsMain?.products {
            ForEach(products, id:\.id) { product in
                VStack{
                    NavigationLink() {
                        productDetails(product: product)
                            .environmentObject(cartManager)
                        
                    } label: {
                        productsCell(product: product)
                            .environmentObject(cartManager)
                            
                           
                    }
                    
                }
            }
        } else {
            Text("Opps, didn't work.")
        }
    }
    
    func getProducts() async{
            if viewModel.customError != nil{
                HasErrorOccured = true
            }
        }
    }
    



struct GridHome_Previews: PreviewProvider {
    static var previews: some View {
        productsGrid()
            .environmentObject(CartManager())

    }
}
