//
//  EditContactViewModel.swift
//  ContactsApp
//
//  Created by Dhan Moti on 26/8/22.
//

import Foundation
class EditContactViewModel {
    var firstName: String
    var lastName: String
    var id: String {
        "\(contact.id ?? 0)"
    }
    
    private var contact: Contact
    
    init(_ contact: Contact) {
        self.contact = contact
        self.firstName = contact.firstName
        self.lastName = contact.lastName
    }
    
}
