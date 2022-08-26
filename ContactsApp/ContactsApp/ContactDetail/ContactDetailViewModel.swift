//
//  File.swift
//  ContactsApp
//
//  Created by Dhan Moti on 26/8/22.
//

import Foundation
struct ContactDetailViewModel {
    var contact: Contact
    var fullName: String {
        "\(contact.firstName) \(contact.lastName)"
    }
    var id: String {
        "\(contact.id ?? 0)"
    }
    var profileImageURL: String? {
        contact.avatar
    }
}
