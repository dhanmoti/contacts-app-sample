//
//  ContactListViewModel.swift
//  ContactsApp
//
//  Created by Dhan Moti on 24/8/22.
//

import Foundation

protocol ContactListViewModelDelegate {
    func onListUpdate()
}

class ContactListViewModel {
    var apiClient: APIClient
    var delegate: ContactListViewModelDelegate?
    
    init(_ apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    private(set) var list:[Contact] = [] {
        didSet {
            delegate?.onListUpdate()
        }
    }
    
    func fetch() {
        apiClient.fetch { [weak self] result in
            switch result {
            case .success(let contacts): self?.list = contacts
            case .failure(let error): print(error)
            }
        }
    }
}
