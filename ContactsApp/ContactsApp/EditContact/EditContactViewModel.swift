//
//  EditContactViewModel.swift
//  ContactsApp
//
//  Created by Dhan Moti on 26/8/22.
//

import Foundation
protocol EditContactViewModelDelegate {
    func onSavedSuccessfully()
}
class EditContactViewModel {
    var firstName: String
    var lastName: String
    var id: String? {
        if let id = contact.id {
           return "\(id)"
        }
        else {
           return nil
        }
    }
    var profileImageURL: String? {
        contact.avatar
    }
    
    var delegate: EditContactViewModelDelegate?
    
    private var contact: Contact
    private var apiClient: APIClient
    init(_ contact: Contact, _ apiClient: APIClient) {
        self.contact = contact
        self.firstName = contact.firstName
        self.lastName = contact.lastName
        
        self.apiClient = apiClient
    }
    
    func onDone() {
        contact.firstName = firstName
        contact.lastName = lastName
        
        apiClient.update(contact: contact) { result in
            switch result {
            case .success(_): self.delegate?.onSavedSuccessfully()
            case .failure(let error): print(error)
            }
        }
    }
}
