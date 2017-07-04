//
//  MessageTableView.swift
//  luxe
//
//  Created by Andrew Van Beek on 7/1/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import Foundation
import UIKit

class MessageTableViewCell: UITableViewCell {
    
    static let REUSE_ID = "MessageTableViewCell"
    
    let nameLabel : UILabel = UILabel()
    let bodyLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        bodyLabel.numberOfLines = 0
        
        self.addSubview(nameLabel)
        self.addSubview(bodyLabel)
        
        let views = ["nameLabel": nameLabel, "bodyLabel": bodyLabel]
        

        //Vertical constraints
    
  
        
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
