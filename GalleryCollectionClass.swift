//
//  GalleryCollectionClass.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 1/2/20.
//  Copyright © 2020 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit

class GalleryCollectionClass : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet weak var GalleryCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // any other logic needed is to be placed here to be prepared to be viewd
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        return ImageSingleton.share.FavedArrayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        let CollectionCell = self.GalleryCollection.dequeueReusableCell(withReuseIdentifier: "CustomColletionCell", for: indexPath )as! UICollectionViewCell
        
        
        return CollectionCell
    }
    

    
}// End Of Class Brackets

