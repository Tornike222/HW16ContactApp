//
//  DetailsViewController.swift
//  HW16ContactsApp
//
//  Created by telkanishvili on 13.04.24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var studentInContactList: Student? = nil
    
    let topViewPlaceholder: UIView = {
        let topViewPlaceholder = UIView()
        topViewPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        topViewPlaceholder.backgroundColor = .darkGray
        topViewPlaceholder.layer.opacity = 0.7
        return topViewPlaceholder
    }()
    
    let studentImage: UIImageView = {
        let studentImage = UIImageView()
        studentImage.translatesAutoresizingMaskIntoConstraints = false
        return studentImage
    }()
    
    let studentName: UILabel = {
        let studentName = UILabel()
        studentName.translatesAutoresizingMaskIntoConstraints = false
        return studentName
    }()
    
    let basicInfoStackView: UIStackView = {
       let basicInfoStackView = UIStackView()
        basicInfoStackView.axis = .vertical
        basicInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        basicInfoStackView.backgroundColor = .white
        basicInfoStackView.spacing = 13
        basicInfoStackView.layer.cornerRadius = 15
        return basicInfoStackView
    }()
    let gender: UILabel = {
        let gender = UILabel()
        gender.translatesAutoresizingMaskIntoConstraints = false
        gender.textAlignment = .center
        return gender
    }()
    let age: UILabel = {
        let age = UILabel()
        age.translatesAutoresizingMaskIntoConstraints = false
        age.textAlignment = .center
        return age
    }()
    let hobby: UILabel = {
        let hobby = UILabel()
        hobby.translatesAutoresizingMaskIntoConstraints = false
        hobby.textAlignment = .center
        return hobby
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        studentInContactList = students.first

        addUiViewPlaceholder()
        addStudentImage()
        addStudentName()
        addBasicInfoStackView()
        addGenderAgeAndHobby()
    }
    
    func addUiViewPlaceholder() {
        view.addSubview(topViewPlaceholder)
        
        topViewPlaceholder.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topViewPlaceholder.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topViewPlaceholder.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topViewPlaceholder.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.43).isActive = true
        
    }
    
    func addStudentImage() {
        view.addSubview(studentImage)
        studentImage.image = studentInContactList?.avatar
        studentImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        studentImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        studentImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        studentImage.topAnchor.constraint(equalTo: view.topAnchor, constant:80 ).isActive = true
    }
    
    func addStudentName() {
        view.addSubview(studentName)
        studentName.text = studentInContactList?.name
        studentName.font = UIFont.systemFont(ofSize: 19)
        
        studentName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        studentName.topAnchor.constraint(equalTo: studentImage.bottomAnchor, constant: 20).isActive = true

    }
    
    func addBasicInfoStackView(){
        view.addSubview(basicInfoStackView)
        basicInfoStackView.topAnchor.constraint(equalTo: topViewPlaceholder.bottomAnchor, constant: 20).isActive = true
//        basicInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7).isActive = true
//        basicInfoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7).isActive = true
        basicInfoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        basicInfoStackView.widthAnchor.constraint(equalTo: topViewPlaceholder.heightAnchor, multiplier: 0.7).isActive = true
    }
    //ამეების ვიზუალზე დრო აღარ მეყო შემომათენდა და შაბათკვირა მივხედავ და დავფუშავ.
    func addGenderAgeAndHobby(){
        basicInfoStackView.addArrangedSubview(gender)
        basicInfoStackView.addArrangedSubview(age)
        basicInfoStackView.addArrangedSubview(hobby)
        
        let genderOfStudent: Gender = studentInContactList?.gender ?? .male
        switch genderOfStudent {
        case .male:
            gender.text = "Gender: Male"
        case .female:
            gender.text = "Gender: Female"

        }
        age.text = "Age: " + String(studentInContactList?.age ?? 0)
        
        hobby.text = "Hobby: " + (studentInContactList?.hobby ?? "None")
        
    }
    

}
#Preview{
    DetailsViewController()
}
