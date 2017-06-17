//
//  UserScreen.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/29/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import UIKit

class UserScreen: UIViewController {

    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var chatInputBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var profileMenuWidth: NSLayoutConstraint!
    @IBOutlet weak var profileMenuLeftEdge: NSLayoutConstraint!
    
    @IBAction func touchedChatInputTextField(_ sender: Any) {
        print("touched chat input text field")
        chatInputBottomMargin.constant = 400
        print(chatInputBottomMargin.constant)
    }
    
    @IBAction func toggleProfileMenu(_ sender: Any) {
        print("toggling")
        if(profileMenuLeftEdge.constant < 0){
            profileMenuLeftEdge.constant = 0
            viewDidLoad()
        } else {
            profileMenuLeftEdge.constant = -profileMenuWidth.constant
            viewDidLoad()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let customView = UIView(frame: CGRectMake(0, 0, 10, 100))
        customView.backgroundColor = UIColor.redColor()
        textField.inputAccessoryView = customView

    }
    
    @IBAction func logoutUser(_ sender: Any) {
        User.logOutUser{ (status) in
            if status == true {
                self.dismiss(animated: true, completion: nil)
            }
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

