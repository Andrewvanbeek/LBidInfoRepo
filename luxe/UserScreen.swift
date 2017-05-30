//
//  UserScreen.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/29/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import UIKit

class UserScreen: UIViewController {

    @IBOutlet weak var profileMenuWidth: NSLayoutConstraint!
    @IBOutlet weak var profileMenuLeftEdge: NSLayoutConstraint!
    @IBAction func toggleProfileMenu(_ sender: Any) {
        if(profileMenuLeftEdge.constant < 0){
            profileMenuLeftEdge.constant = 0
            viewDidLoad()
        } else {
            profileMenuLeftEdge.constant = -profileMenuWidth.constant
            viewDidLoad()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

