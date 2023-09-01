//
//  FakeNetworkManager.swift
//  ClassProjectTests
//
//  Created by Consultant on 7/19/23.
//

import Foundation
@testable import ElectronicsProducts
//- Conforming protocol in NetworkProtocol File
class FakeNetworkManager: NetworkProtocol {
    //- Using function below to parse the urlRequest and get it returned in Data
    func dataFromAPI(urlRequest: URLRequest) async throws -> Data {
        let bundle = Bundle(for: FakeNetworkManager.self)
        let urlString = urlRequest.url?.absoluteString
       
        guard let url = bundle.url(forResource: urlString, withExtension: "json") else{
            throw NetworkError.inValidError
        }
           do{
               let data = try Data(contentsOf: url)
               return data
               }catch{
               print(error.localizedDescription)
                   throw error
                   
               }
        }
    }
