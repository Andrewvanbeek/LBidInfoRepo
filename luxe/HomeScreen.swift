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
    
    func pushTo()  {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserNavController")
            self.present(vc!, animated: false, completion: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let userInformation = UserDefaults.standard.dictionary(forKey: "userInformation") {
            let email = userInformation["email"] as! String
            let password = userInformation["password"] as! String
            User.loginUser(withEmail: email, password: password, completion: { [weak weakSelf = self] (status) in
                DispatchQueue.main.async {
                    if status == true {
                        weakSelf?.pushTo()
                    }
                    weakSelf = nil
                }
            })
        } 
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
