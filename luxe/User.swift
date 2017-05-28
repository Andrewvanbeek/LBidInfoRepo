//
//  User.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/28/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import Foundation
import Firebase

public class User {
    
//    let email:String
//    
//    init(email: String) {
//        self.email = email
//    }
//    
    class func register(email: String, password: String){
        if (email != "" && password != ""){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
        }
        }
    }
    
    
    
}
