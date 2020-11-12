//
//  FavsCustomTableCell.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 12/30/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import UIKit

class FavsCustomTableCell: UITableViewCell {
    
    
    @IBOutlet weak var BackGroundImage: UIImageView!
    
    @IBOutlet weak var Testo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
