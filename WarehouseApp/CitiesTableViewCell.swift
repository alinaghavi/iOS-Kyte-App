//
//  CitiesTableViewCell.swift
//  WarehouseApp
//
//  Created by Ali on 1/23/1396 AP.
//  Copyright © 1396 Kyte. All rights reserved.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var citiesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
