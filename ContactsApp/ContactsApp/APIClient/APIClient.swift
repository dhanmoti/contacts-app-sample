//
//  APIClient.swift
//  ContactsApp
//
//  Created by Dhan Moti on 24/8/22.
//

import Foundation

protocol APIClient {
    func fetch(completion: @escaping (Result<[Contact], Error>) -> Void)
    func update(contact: Contact, completion: @escaping (Result<Bool, Error>) -> Void)
}
