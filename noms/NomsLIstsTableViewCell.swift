//
//  NomsLIstsTableViewCell.swift
//  noms
//
//  Created by William Vuong on 7/22/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import UIKit

class NomsLIstsTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numRestaurantsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
