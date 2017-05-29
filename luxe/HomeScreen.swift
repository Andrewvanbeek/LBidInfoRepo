//
//  HomeScreen.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/27/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {
    
    @IBAction func unwindToRegisterScreen(segue: UIStoryboardSegue) {
        //nothing goes here
    }
    
    @IBAction func unwindToLoginScreen(segue: UIStoryboardSegue) {
        //nothing goes here
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
