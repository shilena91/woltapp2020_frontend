//
//  TableViewCell.swift
//  woltapp
//
//  Created by Hoang Pham on 25.1.2020.
//  Copyright © 2020 Hoang Pham. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var restaurantImg: UIImageView!
    
    @IBOutlet var delivery: UILabel!
    @IBOutlet var descriptions: UILabel!
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
