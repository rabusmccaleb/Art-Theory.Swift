//
//  FavsMVC.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 12/5/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class FavsMVC: UIViewController{
    //DATA TYPE:
    /// this class needs only two bits of data:
                //1. ImmagineData
                //2. TestoData
    //All other data will be ignored
    
    //LOGICAL PREMISE:
    // if no immaggine then testo
    // if no testo then immagine
    // if both comparison based on a fixed value
    
    // LIMITATIONS AND FOCUS:
    //All data and logic will be set in this class such that the only repsonsibilty of the subclass will be to display appropriately
    /// An array for collection view will be returned for display
    /// An array for table view will be returned for display based of the logical premises set above
    /// The last nugget will be purely storage.
    let data = mainDataClass()/// class holding all of the data for to be interpreted
    var CollectionImmaggineData = [UIImage]()//Array OF UI Images
    var TableTestoData = [String]()// array of text
    var FavsData = StateFavsSingletonClass.share.CurrentFavsDataSessionArray// and array of all the data that has been stored
    var LocationData = [[Int : Int]]()// the updated version of data
    var ContentCounter : Int = 0
    /// logic for grabbing and sorting From mainDataClass instance:
func CheckForDuplicates(){// checks for duplicate values... if there are any of these values then it will
    if FavsData.isEmpty == false {///checks to insure that no bit of this dat is false
        for (CurrentWhich , CurrentCurrent) in FavsData[ContentCounter]{
            for x in 1...FavsData.count - 1{
                if (ContentCounter + 1) < FavsData.count{
                for (ComparisonWhich , ComparisonCurrent) in FavsData[ContentCounter + 1]{
                    if CurrentWhich == ComparisonWhich && CurrentCurrent == ComparisonCurrent{
                        FavsData.remove(at: x)/// remove the value that is equal to tht current value if its which value and currentview value are the same
                        }
                    }
                }
            }
            LocationData.append(FavsData[ContentCounter])
            FavsData.remove(at: ContentCounter)/// removing the value at zero
        }
    }
    }
func CheckAllForAllDuplicates(){
    
    for i in 0...FavsData.count - 1{/// will run this for as many values as there that exist initially... but that frankly is overkill it should be much shorter because the duplicates and the current should be removed
        StateFavsSingletonClass.share.CurrentFavsDataSessionArray = FavsData
        FavsData = StateFavsSingletonClass.share.CurrentFavsDataSessionArray/// seting this up store datat apppropriately
        CheckForDuplicates()
        print("Locatation: \(LocationData) , FavsData: \(FavsData)")
    }
}
    
    func CheckForTestoAndImmaggine(){
        
    }
    
    
    func TestoSort(){
        
        /// sorting algorithm based on the set of values stored as favs in the FavsSingletonClass
    }
    
    func ImmagineSort(){
        /// similar sorting algorithm based on the set of values stored as favs in the FavsSingletonClass
    }
    
    
    
    
}
