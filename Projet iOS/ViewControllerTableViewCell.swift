//
//  ViewControllerTableViewCell.swift
//  Projet iOS
//
//  Created by Walid Braham on 27/12/2018.
//  Copyright © 2018 Walid Braham. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var heroImage: UIImageView!
    

    @IBOutlet weak var heroName: UILabel!
    
    
    @IBOutlet weak var heroTeam: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
