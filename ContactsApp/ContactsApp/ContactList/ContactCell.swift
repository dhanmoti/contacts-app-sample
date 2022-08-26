//
//  ContactCell.swift
//  ContactsApp
//
//  Created by Dhan Moti on 24/8/22.
//

import UIKit
import SDWebImage

class ContactCell: UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
   
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        profileImage.layer.cornerRadius = 40
        profileImage.layer.masksToBounds = true
    }
    
    func configure(_ vm: ContactDetailViewModel) {
        nameLabel.text = vm.fullName
        
        if let urlStr = vm.profileImageURL, let url = URL(string: urlStr) {
            profileImage.sd_setImage(with: url, completed: nil)
        }
    }

}
