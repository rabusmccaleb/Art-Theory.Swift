//
//  UIDesign2Code.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 10/9/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation

class UIDesignTwoClass: UIViewController{
    
    
    @IBOutlet var ViewForStyleTwo: UIView!
    @IBOutlet weak var TitoloLable: UILabel!
    @IBOutlet weak var FavButtImage: UIImageView!
    @IBOutlet weak var TestoContentLable: UILabel!
    @IBOutlet weak var FavsButtonImagine: UIButton!
    @IBOutlet weak var SubtleView: UIView!
    
    @IBOutlet weak var FrostedMainView: UIView!
    @IBOutlet weak var Constistentview: UIView!

    @IBOutlet weak var GradientUIImage: UIImageView!
    @IBOutlet weak var InvisiblePopUpView: UIView!
    
    
    var Design2FavsBoolean : Bool = false
    //var UITwoDelegate : FavsDataDelegate?
    
    var Titolo : String?
    var FavImage: UIImage?
    var Testo : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nightModeFunction()
        TestoContentLable.numberOfLines = 0
        TitoloLable.text = ""
        //FavsButtonImagine.imageView?.image = UIImage(named: "MuseBar.png")
        var ColorArray : [UIColor] = StateFavsSingletonClass.share.MainReturnPalete()
        ViewForStyleTwo.backgroundColor! = ColorArray[ColorInitalValue]
        NightClubModeTimer()
        
        FrostedMainView.backgroundColor = .clear
        
        
        var FrostedView : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        FrostedMainView.addSubview(FrostedView)
        FrostedView.frame = FrostedMainView.bounds//. creating this really beautiful display for function
        
        

        /*
        if let ThisTitolo = Titolo{ 
            TitoloLable.text = Titolo!
        }
        */
        if let ThisFavImage = FavImage{
            FavButtImage.image = FavImage!
        }
        if let ThisTesto = Testo{
            TestoContentLable.text = Testo!
        }
        
        
    }
    
    
    ///NightClubMode:
    var ColorInitalValue = 0
    func MainColorOccilatorUpdater(){
        ColorInitalValue = ColorInitalValue + 1
    }
    
    func NightClubModeTimer(){
        let NightClubTimer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(NightClubDisplay), userInfo: nil, repeats: true)
    }
    
    @objc func NightClubDisplay(){
        MainColorOccilatorUpdater()
        var ColorArray : [UIColor] = StateFavsSingletonClass.share.MainReturnPalete()
        
        if ColorInitalValue < ColorArray.count{
            ViewForStyleTwo.backgroundColor = ColorArray[ColorInitalValue]
        }else{
            ColorArray.shuffle()
            ColorInitalValue = 0
            ViewForStyleTwo.backgroundColor = ColorArray[ColorInitalValue]
        }
    }
    
    
    

    
    
    
    func nightModeFunction(){

            TitoloLable.textColor = .white
           // FavButtImage.image =// will not need ot change this but in the event I do or jusst want to the setup is avalible
            TestoContentLable.textColor = .white
            Constistentview.backgroundColor = StateFavsSingletonClass.share.NightModeBackgroundColor
            //// display rules for night mode
            
            SubtleView.layer.cornerRadius = 15.0
            SubtleView.clipsToBounds = true
            GradientUIImage.image = #imageLiteral(resourceName: "MarkMaryMainContentGradient")
            

    }
    
    
    
    

    
}// end of class brackets
