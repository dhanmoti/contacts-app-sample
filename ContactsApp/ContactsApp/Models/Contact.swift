//
//  ContactDetailViewModel.swift
//  ContactsApp
//
//  Created by Dhan Moti on 24/8/22.
//

import Foundation

struct Contact {
    var id: Int?
    var firstName: String
    var lastName: String
    var email: String?
    var avatar: String?
}

extension Contact: Codable {
    private enum CodingKeys : String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case avatar
    }
}
