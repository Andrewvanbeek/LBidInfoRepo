//
//  HomeScreen.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/27/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookLogin

var accessTokenValue = String()

class HomeScreen: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBAction func unwindToRegisterScreen(segue: UIStoryboardSegue) {
        //nothing goes here
    }
    
    @IBAction func unwindToLoginScreen(segue: UIStoryboardSegue) {
        //nothing goes here
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        //facebook login
        let loginButton  = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate = self;
        loginButton.readPermissions = ["email","public_profile"]
       
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
       
        if((FBSDKAccessToken.current()) != nil){
            print("YEAH!---------------------------------------")
            self.pushTo()
        }

        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error == nil {
            print(FBSDKAccessToken.current())
            FBSDKAccessToken.current().userID
            print("here")
            self.performSegue(withIdentifier: "fbLogin", sender: nil)
            return
        } else {
            print("##############################################################################")
            print(error)
            print("##############################################################################")

        }
        
                
    }
}
