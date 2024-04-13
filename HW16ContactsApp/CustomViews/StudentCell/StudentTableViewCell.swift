//
//  StudentsTableViewCell.swift
//  HW16ContactsApp
//
//  Created by telkanishvili on 12.04.24.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    let studentName: UILabel = {
        let studentName = UILabel()
        studentName.font = UIFont.systemFont(ofSize: 15)
        studentName.translatesAutoresizingMaskIntoConstraints = false
        return studentName
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
    
    func addName(student: Student){
        contentView.addSubview(studentName)
        studentName.text = student.name
        
        studentName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        studentName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        studentName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    

}
