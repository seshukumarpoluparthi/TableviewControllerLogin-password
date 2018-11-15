//
//  LoginTableViewController.swift
//  Test11
//
//  Created by apple on 11/15/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {
    
    var signinShowing = true
    
    @IBOutlet weak var userNameTextfield : UITextField!
    @IBOutlet weak var firstNameTextfield : UITextField!
    @IBOutlet weak var LastNameTextfield : UITextField!
    @IBOutlet weak var passwordTextfield : UITextField!
    
    @IBAction func didTapSignin(){
        passwordTextfield.isSecureTextEntry.toggle()
    }
    
    @IBAction func didTapSignup(){
    }
    
    @IBAction func toggleForm(){
        signinShowing = !signinShowing
        if signinShowing{
            print("signin is showing")
        }else{
            print("signup is showing")
        }
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // separator style none
        // selection style none
        
        userNameTextfield.delegate = self
        firstNameTextfield.delegate = self
        LastNameTextfield.delegate = self
        passwordTextfield.delegate = self
        passwordTextfield.isSecureTextEntry = true
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let signinHiddenRows = [2,3,6,7]
        let signupHiddenRows = [5,8]
        
        if indexPath.row == 0{
            return tableView.bounds.height * 0.33
        }
        else if signinShowing{
            if signinHiddenRows.contains(indexPath.row){
                return 0
            }
        } else{
            if signupHiddenRows.contains(indexPath.row){
                return 0
            }
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}

extension LoginTableViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
