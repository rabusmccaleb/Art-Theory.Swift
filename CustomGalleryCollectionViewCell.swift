//
//  CustomGalleryCollectionViewCell.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 1/3/20.
//  Copyright © 2020 Rabus Mccaleb. All rights reserved.
//

import UIKit

class CustomGalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ReUseCell : UICollectionViewCell!
    @IBOutlet weak var CollectionImaggine : UIImageView!
    var ImageBundle : String?
    var ImageBeforeResize : UIImage?/// image to be used for resizing of both cell and image
    var OldImageHeight : CGFloat?
    var NewImageHeight : CGFloat?
    var OldImageWidth : CGFloat?
    var NewImageWidth : CGFloat?
    
    func SetHeightForData(){
        OldImageWidth = ImageBeforeResize?.size.width
        
        
    }
    
}
