//
//  CustomCellsClasses.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 12/26/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit

/// classes for custom cells of all types code to be placed

///UIFavsTable And UICOllections custom cells
class FavsCollectionCell: UICollectionViewCell{
    @IBOutlet weak var Immagine : UIImageView!
    
    /*
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
     
     //very useful method making uichanges before view is loaded... read more about it in the apple documentation.
    }
    */
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}




///For UITableOC CustomCells:
class MainTableOCCell: UITableViewCell{
    @IBOutlet weak var MainTesto : UILabel!
    @IBOutlet weak var MainImmagine : UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

class SubTableOCCell: UITableViewCell{
    @IBOutlet weak var SubTesto : UILabel!
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

///UIMuseViewCustomP-list-TableCells:
class PListCustomCells: UITableViewCell{
    @IBOutlet weak var Titolo: UILabel!
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
