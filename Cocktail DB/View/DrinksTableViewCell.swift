//
//  DrinksTableViewCell.swift
//  Cocktail DB
//
//  Created by MineDest on 9/13/20.
//  Copyright © 2020 MineDest. All rights reserved.
//

import UIKit

class DrinksTableViewCell: UITableViewCell {

    @IBOutlet weak var DrinksImageView: UIImageView!
    @IBOutlet weak var DrinksNameLanguage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
