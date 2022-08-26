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

enum UpdateError: Error {
    case missingId
    case failToEncode
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
    
    
    func update(contact: Contact, completion: @escaping (Result<Bool, Error>) -> Void){
        guard let contactId = contact.id else {
            DispatchQueue.main.async {
                completion(.failure(UpdateError.missingId))
            }
            return
        }
        guard let data = try? JSONEncoder().encode(contact) else {
            DispatchQueue.main.async {
                completion(.failure(UpdateError.failToEncode))
            }
            
            return
        }
        
        let url = URL(string: "https://reqres.in/api/users/\(contactId)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                
                return
            }
            DispatchQueue.main.async {
                completion(.success(true))
            }
            
            print(response ?? "empty response")
        }
        task.resume()
    }
}

struct ContactListResponse: Codable {
    var data: [Contact]
}
