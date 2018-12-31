//
//  ViewController.swift
//  Projet iOS
//
//  Created by Walid Braham on 25/12/2018.
//  Copyright © 2018 Walid Braham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gradient()
        navbarSetup()
    }

    func gradient() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.1).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.1).cgColor
    
        let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop, colorBottom]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = self.view.bounds
        self.view.layer.addSublayer(gradientLayer)
    }

    func navbarSetup() {
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = true
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "  ", style: .plain, target: nil, action: nil)
    self.navigationController?.navigationBar.tintColor = UIColor(red: 107.0/255.0 , green: 83.0/255.0, blue: 195.0/255.0 , alpha: 1)
    }
    
}

