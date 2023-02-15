//
//  ViewController.swift
//  VideoDownloader
//
//  Created by FS K on 13.02.2023.
//

import UIKit
import CoreData

class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var titleView: UIView!
    
    var maxLen:Int = 8;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTF.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        passwordTF.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        usernameTF.delegate = self
        passwordTF.delegate = self
        titleView.layer.cornerRadius = 20.0
        usernameView.layer.cornerRadius = 10.0
        passwordView.layer.cornerRadius = 10.0
        loginButton.layer.cornerRadius = 25.0
    }

    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        if !usernameTF.text!.isEmpty {
        
            if !passwordTF.text!.isEmpty{
                 
                if usernameTF.text == "admin" {
                    
                    if passwordTF.text == "14562335" {
                        
                        print("Login successful :)")
                        
                    }
                    else {
                        let err4 = LoginPageError.wrongPassword.localizedDescription
                        print(err4)
                    }
                    
                }
                else {
                    let err3 = LoginPageError.wrongUsername.localizedDescription
                    print(err3)
                }
                
            }
            else {
                let err2 = LoginPageError.noPassword.localizedDescription
                print(err2)
            }
            
        }
        else {
            let err1 = LoginPageError.noUserName.localizedDescription
            print(err1)
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if(textField == usernameTF){
            let currentText = textField.text! + string
            return currentText.count <= maxLen
        }
        
        if textField == passwordTF {
            let currentText = textField.text! + string
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return currentText.count <= maxLen && allowedCharacters.isSuperset(of: characterSet)
        }
        return true;
    }
}

