//
//  ButtonsLayout.swift
//  Projet iOS
//
//  Created by Walid Braham on 25/12/2018.
//  Copyright © 2018 Walid Braham. All rights reserved.
//

import UIKit

class ButtonsLayout: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        layer.cornerRadius = frame.size.height / 2.0
        
        layer.shadowColor = UIColor(red:0,green:0,blue:0,alpha:0.25).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 0
        layer.shadowOpacity = 1
    }
}
