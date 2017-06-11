//
//  RegisterScreen.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/27/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import UIKit
import Stripe
import Firebase

class RegisterScreen: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var registrationError: UILabel!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var confirmField: UITextField!

    @IBAction func register(_ sender: Any) {
        print("registration attempt")
        if (fieldsNotEmpty() && passwordsMatch()){
            Auth.auth().createUser(withEmail: emailField.text!, password: passField.text!)
            { (user, error) in
                if (error != nil){
                    self.registrationError.text = error?.localizedDescription ?? "Some kind of Registration Error"
                    print("registration error:" + (error?.localizedDescription)!)
                    self.viewDidLoad()
                }else{
                    self.registrationSuccess()
                }
            }
        }
    }
    
    func registrationSuccess(){
        print("Successful Registration")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
        self.show(viewController, sender: nil)
    }
    
    func fieldsNotEmpty() -> Bool{
        if (emailField.text! == "" || passField.text! == ""){
            self.registrationError.text = "Feilds can't be empty."
            self.viewDidLoad()
            return false
        }
        return true
    }
    
    func passwordsMatch() -> Bool{
        if (passField.text! != confirmField.text!){
            self.registrationError.text = "Passwords don't match."
            self.viewDidLoad()
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passField.delegate = self
        self.emailField.delegate = self
        self.confirmField.delegate = self
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
        
        var confirmPassPlaceHolder = NSMutableAttributedString()
        let confirmPassName  = "Confirm Password"
        confirmPassPlaceHolder = NSMutableAttributedString(string:confirmPassName, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 22.0)])
        confirmPassPlaceHolder.addAttribute(NSForegroundColorAttributeName, value: UIColor.gray, range:NSRange(location:0,length:confirmPassName.characters.count))
        confirmField.attributedPlaceholder = confirmPassPlaceHolder


        
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
            confirmField.becomeFirstResponder()
        } else if textField == confirmField{
            confirmField.resignFirstResponder()
        }
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
}
