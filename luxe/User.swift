//
//  User.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/28/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import Foundation
import UIKit
import Firebase


public class User: NSObject {
    
    //MARK: Properties
    let name: String 
    let email: String
    let id: String
    
    init(name: String, email: String, id: String, profilePic: UIImage) {
        self.name = name
        self.email = email
        self.id = id
    }

    
    class func loginUser(withEmail: String, password: String, completion: @escaping (Bool) -> Swift.Void) {
        Auth.auth().signIn(withEmail: withEmail, password: password, completion: { (user, error) in
            if error == nil {
                let userInfo = ["email": withEmail, "password": password]
                UserDefaults.standard.set(userInfo, forKey: "userInformation")
                print("done")
                completion(true)
            } else {
                completion(false)
            }
        })
    }
    
    class func logOutUser(completion: @escaping (Bool) -> Swift.Void) {
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: "userInformation")
            completion(true)
        } catch _ {
            completion(false)
        }
    }

}
