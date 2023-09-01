//
//  NetworkManager.swift
//  ClassProject
//
//  Created by Consultant on 7/18/23.
//

import Foundation

//- Conforming protocol in NetworkProtocol File
class NetworkManager:NetworkProtocol{
    //- Using function below to parse the urlRequest and get it returned in Data
    func dataFromAPI(urlRequest: URLRequest) async throws -> Data {
        
        //- do/catch to  to get the urlRequest in data variable and return to Data else catch
        //- a error and return error if no urlRequest
        do{
            let (data,_) =  try await URLSession.shared.data(for: urlRequest)
            return data
        }catch{
            
            print(error.localizedDescription)
            throw NetworkError.inValidError
        }
        }
    }
    

