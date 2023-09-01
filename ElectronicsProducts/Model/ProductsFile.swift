//
//  productsFile.swift
//  ClassProject
//
//  Created by Consultant on 7/18/23.
//

import Foundation

struct ProductsFile: Decodable {
    let products: [Products]
    let total, skip, limit: Int
}

struct Products: Decodable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    var quantity:Int?

    
 
}




