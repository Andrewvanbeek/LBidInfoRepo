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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
//        self.navigationController?.isNavigationBarHidden = false
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
