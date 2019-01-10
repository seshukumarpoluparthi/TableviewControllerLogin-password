//
//  SecViewController.swift
//  Test11
//
//  Created by apple on 11/20/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class SecViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBOutlet weak var cityField: UITextField!
    
    @IBOutlet weak var occupationField: UITextField!
    
    
    @IBOutlet weak var aboutMeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func submitButton(_ sender: Any) {
        guard let firstName = nameField.text ,  firstName != "" else {
            print("name is empty")
            return
        }
        guard let city = cityField.text ,  city != "" else {
            print("city is empty")
            return
        }
        guard let occupation = occupationField.text ,  occupation != "" else {
            print("occupation is empty")
            return
        }
        guard let age = ageField.text ,  age != "" else {
            print("age is empty")
            return
        }
       aboutMeLabel.text = "my name is \(firstName) and iam \(age) years old. i live in \(city) and iam an \(occupation)"
        
      
    }
}



/*
if let firstName = nameField.text{
    if let age = ageField.text{
        if let city = cityField.text{
            if let occupation = occupationField.text{
                aboutMeLabel.text = "my name is \(firstName.capitalized) and iam \(age) years old. i live in \(city.capitalized) and iam an \(occupation)"
            }else{
                print("occupation is empty")
            }
        } else{
            print("city is empty")
        }
    }else{
        print("age is empty")
    }
}else{
    print("name is empty")
}
*/

/*
if let firstName = nameField.text , firstName==""{
    print("name is empty")
    return
}
if let age = ageField.text , age == ""{
    print("name is empty")
    return
}
if let city = cityField.text , city == ""{
    print("city is empty")
    return
}
if let occupation = occupationField.text , occupation == ""{
    print("occupation is empty")
    return
}
aboutMeLabel.text = "my name is \(nameField.text!) and iam \(ageField.text!) years old. i live in \(cityField.text!) and iam an \(occupationField.text!)"
*/
