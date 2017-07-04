//
//  MessageModel.swift
//  luxe
//
//  Created by Andrew Van Beek on 7/1/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import Foundation

struct MessageModel {
    var messageId: String?
    var name: String
    var body: String
    

    
    init(name: String, body: String){
        self.name = name
        self.body = body
    }
}
