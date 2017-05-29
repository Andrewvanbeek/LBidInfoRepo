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

    @IBAction func register(_ sender: Any) {
        print("start async register")
        Auth.auth().createUser(withEmail: passField.text!, password: passField.text!)
        { (user, error) in
            if (error != nil){
                self.registrationError.text = error?.localizedDescription ?? "Some kind of Registration Error"
                print(error?.localizedDescription ?? "Some kind of Registration Error")
                self.viewDidLoad()
            }else{
                print("Success registering")
            }
            print("finished async")
        }
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
        } else {
            passField.resignFirstResponder()
        }
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //    func registrationSuccess(){
    //        print("success")
    //    }
    
    //    public func registrationFailure(errorMessage: String){
    //        print("registration failure from register screen class")
    ////        self.registrationError.text! = errorMessage
    ////        viewDidLoad(<#RegisterScreen#>)
    //    }
    
    //    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: STPErrorBlock) {
    //        self.submitTokenToBackend(token, completion: { (error: Error?) in
    //            if let error = error {
    //                completion(error)
    //            } else {
    //                self.dismiss(animated: true, completion: {
    //                    self.showReceiptPage()
    //                    completion(nil)
    //                })
    //            }
    //        })
}
