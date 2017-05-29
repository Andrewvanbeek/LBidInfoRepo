//
//  LoginScreen.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/28/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import UIKit
import Stripe
import Firebase

class LoginScreen: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var loginError: UILabel!
   
    @IBAction func login(_ sender: Any) {
        if(fieldsNotEmpty()){
            Auth.auth().signIn(withEmail: emailField.text!, password: passField.text!) { (user, error) in
                if (error != nil){
                    self.loginError.text = error?.localizedDescription ?? "Some kind of login error"
                    print("login error:" + (error?.localizedDescription)!)
                    self.viewDidLoad()
                }else{
                    self.loginSuccess()
                }
            }
        }
    }
    
    func fieldsNotEmpty() -> Bool{
        if (emailField.text! == "" || passField.text! == ""){
            self.loginError.text = "Feilds can't be empty."
            self.viewDidLoad()
            return false
        }
        return true
    }
    
    func loginSuccess(){
        print("Successful login")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passField.delegate = self
        self.emailField.delegate = self
        passField.tag = 1
        emailField.tag = 0
        var emailPlaceHolder = NSMutableAttributedString()
        let Name  = "Email"
        emailPlaceHolder = NSMutableAttributedString(string:Name, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 22.0)])
        emailPlaceHolder.addAttribute(NSForegroundColorAttributeName, value: UIColor.gray, range:NSRange(location:0,length:Name.characters.count))
        emailField.attributedPlaceholder = emailPlaceHolder
        
        var passPlaceHolder = NSMutableAttributedString()
        let passName  = "Password"
        passPlaceHolder = NSMutableAttributedString(string:passName, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 22.0)])
        passPlaceHolder.addAttribute(NSForegroundColorAttributeName, value: UIColor.gray, range:NSRange(location:0,length:passName.characters.count))
        passField.attributedPlaceholder = passPlaceHolder
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passField.becomeFirstResponder()
        } else if textField == passField {
            passField.resignFirstResponder()
        }
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
