//
//  ViewController.swift
//  HW16ContactsApp
//
//  Created by telkanishvili on 12.04.24.
//
//

import UIKit

class ContactsViewController: UIViewController {
    var sectionTitles: [String]!
    var characterDictionary: [String: [String]]!
    
    let studentsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionTitles = sortedPrefixOf(studentArray: students)
        characterDictionary = getDictionary(from: sectionTitles, via: students)
        addBackgroundColor()
        addStudentsTableView()
    }
    
    func addBackgroundColor(){
        view.backgroundColor = .white
    }
    
    func addStudentsTableView() {
        view.addSubview(studentsTableView)
        
        studentsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        studentsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        studentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        studentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        studentsTableView.dataSource = self
        studentsTableView.delegate = self
        
        studentsTableView.register(StudentTableViewCell.self, forCellReuseIdentifier: "StudentTableViewCell")
        studentsTableView.register(PhoneOwnerViewCell.self, forCellReuseIdentifier: "PhoneOwnerViewCell")
    }
}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        //პირველ სელში მაქვს გაკეთებული მხოლოდ PhoneOwnerViewCell რომელშიც საკუთარი თავი მიზის, დანარჩენი სტუდენტებისთვის studentCell-ს ვიყენებ. შესაბამისად ერთების გამოკლება/მიმატება მჭირდება ზოგადგილებში ინფოს სწორად საჩვენებლად
        sectionTitles.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        let key = sectionTitles[section - 1]
        return characterDictionary[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let phoneOwnerCell = tableView.dequeueReusableCell(withIdentifier: "PhoneOwnerViewCell") as? PhoneOwnerViewCell
            phoneOwnerCell?.addAvatar(image: phoneOwner.avatar)
            phoneOwnerCell?.addOwner(name: phoneOwner.name)
            return phoneOwnerCell ?? UITableViewCell()
        }
        
        let key = sectionTitles[indexPath.section - 1]
        let studentCell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell") as? StudentTableViewCell
        studentCell?.accessoryType = .disclosureIndicator
        
        if let students = characterDictionary[key] {
            studentCell?.textLabel?.text = students[indexPath.row]
        }
        
        return studentCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        return sectionTitles[section - 1]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        } else {
            return 30
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionTitles
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = DetailsViewController()
        dvc.modalPresentationStyle = .fullScreen

        if indexPath.section == 0 {
            dvc.studentInContactList = phoneOwner
        } else {
            dvc.studentInContactList = students[indexPath.row]
        }
        
        self.navigationController?.pushViewController(dvc, animated: false)

    }
}

#Preview {
    ContactsViewController()
}
