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
    
    init(id: Int? = nil, firstName: String, lastName: String, email: String? = nil, avatar: String? = nil) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.avatar = avatar
    }
    
    init() {
        self.init(firstName: "", lastName: "")
    }
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
