//
//  DrinksTableViewCell.swift
//  Cocktail DB
//
//  Created by MineDest on 9/13/20.
//  Copyright © 2020 MineDest. All rights reserved.
//

import UIKit

class DrinksTableViewCell: UITableViewCell {

    @IBOutlet weak var drinksImageView: UIImageView!
    @IBOutlet weak var drinksNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
              super.prepareForReuse()
        isHidden = false
        isEditing = false
        isSelected = false
        self.drinksImageView.image = nil
        self.drinksNameLabel.text = nil
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
