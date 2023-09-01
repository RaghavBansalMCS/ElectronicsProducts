//
//  productsViewModel.swift
//  ClassProject
//
//  Created by Consultant on 7/18/23.
//

import Foundation

@MainActor
class productViewModel: ObservableObject {
    
    @Published var productsMain: ProductsFile?
    @Published var customError: NetworkError?
    var networkManager:NetworkProtocol
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    func getProductsFromAPI(urlString:String) async{
        guard let url =  URL(string: urlString)else{
            return
        }
        
        let  urlRequest = URLRequest(url: url)
        do{
            let data = try await networkManager.dataFromAPI(urlRequest: urlRequest)
            self.productsMain = try JSONDecoder().decode(ProductsFile.self, from: data)
            print(self.productsMain ?? "ffffff")
        }catch
            let error{
            print(error.localizedDescription)
            switch error{
            case is DecodingError:
                customError = NetworkError.parsingError
                
            case NetworkError.doNotFoundError:
                customError = NetworkError.doNotFoundError
                
            case NetworkError.inValidError:
                customError = NetworkError.inValidError
                
            default:
                customError = NetworkError.doNotFoundError
            }
            
            
        }
        }
    }

