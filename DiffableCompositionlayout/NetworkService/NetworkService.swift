//
//  NetworkService.swift
//  DiffableCompositionlayout
//
//  Created by Sachin Dumal on 12/12/19.
//  Copyright © 2019 Sachin Dumal. All rights reserved.
//

import Foundation
import UIKit

private let urlString = "https://demo-profiles.s3.eu-west-2.amazonaws.com/profileDemo.json"

enum Result<T> {
    case success(T)
    case failure(String)
}

class NetworkService {
    
    static let shared = NetworkService()
    
    
    func downloadContactsFromServer(completion: @escaping (Result<[JSONContact]>) -> Void)  {
        
        
        guard let url = URL(string: urlString) else { return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //1
            if let error = error {
                completion(.failure("Getting error from: \(error)"))
            }
            
            //2
            guard let response = response as? HTTPURLResponse else {
                completion(.failure("invalid response"))
                return
            }
            
            //3
            if 200 ... 299 ~= response.statusCode {
                if let data = data {
                    
                    let jsonDecoder = JSONDecoder()
                    
                    do {
                        let jsonContacts = try jsonDecoder.decode([JSONContact].self, from: data)
//                        jsonContacts.forEach({ (jsonContact) in
//                            contacts.append(Contact(name: jsonContact.name, image: jsonContact.imageUrl))
//                        })
                        completion(.success(jsonContacts))
                        
                    } catch  {
                        completion(.failure("Getting error from Data: \(error)"))
                    }
                }
            }
        }.resume()
        
    }
}
