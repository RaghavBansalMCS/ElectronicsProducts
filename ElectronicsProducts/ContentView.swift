//
//  ContentView.swift
//  ClassProject
//
//  Created by Consultant on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cartManager:CartManager
    var body: some View {
           
        
            TabView{
                Home(cartManager: CartManager()).tabItem {
                    Image(systemName: "homekit")
                    Text("Home")
                }
//                CartView(cartManager: environmentObject(cartManager) as! EnvironmentObject<CartManager>).tabItem {
//                                    Image(systemName: "wallet.pass")
//                                    Text("Wallet")
//                                }
                //                Home().tabItem {
                //                    Image(systemName: "pencil.circle.fill")
                //                    Text("Statistic")
                //                }
                //                Home().tabItem {
                //                    Image(systemName: "person.crop.circle")
                //                    Text("Profile")
                //                }
                //
                
                
            }
        
           
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
