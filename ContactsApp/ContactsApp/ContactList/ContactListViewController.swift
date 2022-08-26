//
//  ContactListViewController.swift
//  ContactsApp
//
//  Created by Dhan Moti on 24/8/22.
//

import UIKit

class ContactListViewController: UITableViewController {

    private var viewModel: ContactListViewModel = ContactListViewModel(APIClientImpl())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
       
        viewModel.fetch()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact-cell", for: indexPath)

        let contact = viewModel.list[indexPath.row]
        (cell as? ContactCell)?.nameLabel.text = contact.fullName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "contact-detail-segue", sender: nil)
    }


    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let contactDetailVC = segue.destination as? ContactDetailViewController,
            let selectedIdx = tableView.indexPathForSelectedRow?.row {
            
            let selectedContactDetail = viewModel.list[selectedIdx]
            contactDetailVC.viewModel = selectedContactDetail
            
        }
        else if let addContactVC = segue.destination as? AddContactViewController {
            let contact = Contact()
            let apiClient = APIClientImpl()
            let viewModel = AddContactViewModel(contact, apiClient)
            addContactVC.viewModel = viewModel
        }
    }
    

}

extension ContactListViewController: ContactListViewModelDelegate {
    func onListUpdate() {
        self.tableView.reloadData()
    }
}
