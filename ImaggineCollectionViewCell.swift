//
//  ImaggineCollectionViewCell.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 1/16/20.
//  Copyright © 2020 Rabus Mccaleb. All rights reserved.
//

import UIKit

class ImaggineCollectionViewCell: UICollectionViewCell {
    
    var ImmagineVar : UIImage?
    @IBOutlet weak var Immagine: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let Image = ImmagineVar{
            Immagine.image = StateFavsSingletonClass.share.ResizeAllImageWithImage(ImmagineVar, Immagine)
        }// end of if statement bracket
    }// end of awakefromnib bracket

}
