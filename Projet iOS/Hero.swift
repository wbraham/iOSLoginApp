//
//  Hero.swift
//  Projet iOS
//
//  Created by Walid Braham on 27/12/2018.
//  Copyright © 2018 Walid Braham. All rights reserved.
//

import UIKit

class Hero {
    
    var name: String?
    var team: String?
    var imageUrl: String?
    
    init(name: String?, team: String?, imageUrl: String?) {
        self.name = name
        self.team = team
        self.imageUrl = imageUrl
    }
}
