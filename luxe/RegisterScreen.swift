//
//  RegisterScreen.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/27/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import UIKit

class RegisterScreen: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var emailField: UITextField!
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
    
    //    self.navigationController.navigationBar.hidden = YES;
    //    @IBOutlet var homeScreen: UIView!
    //    homeScreen.navigationController.navigationBar.hidden = YES;
    
}
