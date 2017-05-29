//
//  UserScreen.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/29/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import UIKit

class UserScreen: UIViewController {
    
//    @IBOutlet weak var profileMenuConstraint: NSLayoutConstraint!
//    @IBOutlet weak var profileMenuWidth: NSLayoutConstraint!
    
    @IBAction func toggleLeftMenu(_ sender: Any) {
        print("hello mate")
//        print(profileMenuConstraint)
//        if(profileMenuConstraint.constant < 0){
//            profileMenuConstraint.constant = 0
//            viewDidLoad()
//        } else {
//            profileMenuConstraint.constant = -profileMenuWidth.constant
//            viewDidLoad()
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        profileMenuConstraint.constant = -profileMenuWidth.constant

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

