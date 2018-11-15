//
//  ViewController.swift
//  Test11
//
//  Created by apple on 10/26/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit






class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var lbl_text: UILabel!
    
    
    @IBOutlet weak var passwordtextField: HideShowPasswordTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // passwordtextField.isSecureTextEntry = true
        setupPasswordTextField()
        
        
    
        
        
    }
    

}
extension ViewController{

private func setupPasswordTextField() {
    passwordtextField.passwordDelegate = self
    passwordtextField.delegate = self
    passwordtextField.borderStyle = .none
    passwordtextField.clearButtonMode = .whileEditing
    passwordtextField.layer.borderWidth = 0.5
    passwordtextField.layer.borderColor = UIColor(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1.0).cgColor
    passwordtextField.borderStyle = UITextField.BorderStyle.none
    passwordtextField.clipsToBounds = true
    passwordtextField.layer.cornerRadius = 0
    
    passwordtextField.rightView?.tintColor = UIColor(red: 0.204, green: 0.624, blue: 0.847, alpha: 1)
    
    
    // left view hack to add padding
    passwordtextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 3))
    passwordtextField.leftViewMode = .always
}

}

extension ViewController : HideShowPasswordTextFieldDelegate{
    
    func isValidPassword(password: String) -> Bool {
        return password.count > 7
    }
    
    
    
}
extension ViewController : UITextFieldDelegate{
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, textField string: String) -> Bool {
        return passwordtextField.textField(textField: textField, shouldChangeCharactersInRange: range, replacementString: string)
    }
    
    private func textFieldDidEndEditing(textField: UITextField) {
        passwordtextField.textFieldDidEndEditing(textField: textField)
    }
    
}
