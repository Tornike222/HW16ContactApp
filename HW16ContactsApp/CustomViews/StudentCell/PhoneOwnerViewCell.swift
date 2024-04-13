//
//  PhoneOwnerViewCell.swift
//  HW16ContactsApp
//
//  Created by telkanishvili on 12.04.24.
//

import UIKit

class PhoneOwnerViewCell: UITableViewCell {
    
    let avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    let ownerName: UILabel = {
        let ownerName = UILabel()
        ownerName.translatesAutoresizingMaskIntoConstraints = false
        ownerName.font = UIFont.boldSystemFont(ofSize: 25)
        return ownerName
    }()
    
    let ownerStackView: UIStackView = {
        let ownerStackView = UIStackView()
        ownerStackView.axis = .horizontal
        ownerStackView.translatesAutoresizingMaskIntoConstraints = false
        ownerStackView.spacing = 13
        ownerStackView.alignment = .center
        
        return ownerStackView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.backgroundColor = .blue
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addOwnerStackView()
        separatorInset = UIEdgeInsets(top: 0, left: bounds.size.width, bottom: 0, right: 0)
    
    }
    
    func addAvatar(image: UIImage){
        ownerStackView.addArrangedSubview(avatar)
        
        avatar.image = image
        avatar.widthAnchor.constraint(equalToConstant: 60).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    func addOwner(name: String){
        ownerStackView.addArrangedSubview(ownerName)
        
        ownerName.text = name
    }
    
    func addOwnerStackView(){
        contentView.addSubview(ownerStackView)
        
        ownerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        ownerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        ownerStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        ownerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
}

