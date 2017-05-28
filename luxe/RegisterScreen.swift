//
//  RegisterScreen.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/27/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import UIKit

class RegisterScreen: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        var placeHolder = NSMutableAttributedString()
        let Name  = "Email"
        
        // Set the Font
        placeHolder = NSMutableAttributedString(string:Name, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 20.0)])
        
        // Set the color
        placeHolder.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGray, range:NSRange(location:0,length:Name.characters.count))
        
        // Add attribute
        emailField.attributedPlaceholder = placeHolder
        self.navigationController?.navigationBar.tintColor = UIColor.white
        //self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    self.navigationController.navigationBar.hidden = YES;
    //    @IBOutlet var homeScreen: UIView!
    //    homeScreen.navigationController.navigationBar.hidden = YES;
    
}
