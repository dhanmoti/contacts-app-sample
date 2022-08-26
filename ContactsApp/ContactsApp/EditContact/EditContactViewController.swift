//
//  EditContactViewController.swift
//  ContactsApp
//
//  Created by Dhan Moti on 26/8/22.
//

import UIKit

class EditContactViewController: UITableViewController {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var idLabel: UILabel!
    
    var viewModel: EditContactViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDetails()
    }
    
    private func setDetails() {
        guard let vm = viewModel else { return }
        
        firstNameTextField.text = vm.firstName
        lastNameTextField.text = vm.lastName
        idLabel.text = vm.id
    }

}
