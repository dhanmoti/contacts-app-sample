//
//  APIClientImpl.swift
//  ContactsApp
//
//  Created by Dhan Moti on 24/8/22.
//

import Foundation

enum FetchError: Error {
    case empty
}

class APIClientImpl: APIClient {
    let session = URLSession.shared
    
    func fetch(completion: @escaping (Result<[Contact], Error>) -> Void){
        let url = URL(string: "https://reqres.in/api/users?per_page=100&page=1")!
        
        let task = session.dataTask(with: url) { (data, _, error) in
            let decoder = JSONDecoder()
            guard
                let data = data,
                let decoded = try? decoder.decode(ContactListResponse.self, from: data)
                else {
                    DispatchQueue.main.async {
                        completion(.failure(FetchError.empty))
                    }
                    
                    return
                }
            
            DispatchQueue.main.async {
                completion(.success(decoded.data))
            }
            
        }
        
        task.resume()
        
    
    }
}

struct ContactListResponse: Codable {
    var data: [Contact]
}
