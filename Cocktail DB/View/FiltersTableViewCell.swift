//
//  FiltersTableViewCell.swift
//  Cocktail DB
//
//  Created by MineDest on 9/13/20.
//  Copyright © 2020 MineDest. All rights reserved.
//

import UIKit

class FiltersTableViewCell: UITableViewCell {

    @IBOutlet weak var filtersLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

}
