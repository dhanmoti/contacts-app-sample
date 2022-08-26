//
//  ContactDetailViewController.swift
//  ContactsApp
//
//  Created by Dhan Moti on 26/8/22.
//

import UIKit

class ContactDetailViewController: UITableViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var idLabel: UILabel!
    
    var viewModel: ContactDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDetails()
    }

    private func setDetails() {
        guard let vm = viewModel else { return }
        nameLabel.text = vm.fullName
        idLabel.text = vm.id
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
