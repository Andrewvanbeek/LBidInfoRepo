//
//  HomeScreenButton.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/28/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import UIKit

public class HomeScreenButton: UIButton{
    override public func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 5
    }
}
