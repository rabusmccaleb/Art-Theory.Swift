//
//  FavTableClass.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 12/27/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit

class FavTableCell: UITableViewCell{
    @IBOutlet weak var Testo : UILabel!
    @IBOutlet weak var TestoBackgoundImage : UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .red
        self.addSubview(TestoBackgoundImage)
        self.addSubview(Testo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .red
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // any extra code or logic here
        self.backgroundColor = .red/// this will be used to check and see if anything at all is displaying from the table cell
        TestoBackgoundImage.image =  #imageLiteral(resourceName: "9")
    }
}
