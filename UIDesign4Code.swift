//
//  UIDesign4Code.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 9/30/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation

class UIDesignFourClass: UIViewController {
    
    @IBOutlet var ViewForStyleFour: UIView!
    @IBOutlet weak var OptionalBackImage: UIImageView!
    @IBOutlet weak var TitoloLable: UILabel!
    @IBOutlet weak var MainLable: UILabel!

    @IBOutlet weak var GradientUIImage: UIImageView!
    
    @IBOutlet weak var FrostedMainView: UIView!
    @IBOutlet weak var Constistentview: UIView!

    
    
    var Titolo : String?
    var LableMain : String?
    var BackgroundImage : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ColorArray : [UIColor] = StateFavsSingletonClass.share.MainReturnPalete()
        ViewForStyleFour.backgroundColor! = ColorArray[ColorInitalValue]
        nightModeFunction()
        
        FrostedMainView.backgroundColor = .clear
        
        var FrostedView : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        FrostedMainView.addSubview(FrostedView)
        FrostedView.frame = FrostedMainView.bounds//. creating this really beautiful display for function
        
        TitoloLable.text = ""
        if let ThisTitolo = Titolo{
           // TitoloLable.text = Titolo!
        }
        if let ThisMainLable = LableMain{
            MainLable.text = LableMain!
        }
        if let ThisBackgroundImage = BackgroundImage{
            OptionalBackImage.image = BackgroundImage!
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
            ViewForStyleFour.backgroundColor = ColorArray[ColorInitalValue]
        }else{
            ColorArray.shuffle()
            ColorInitalValue = 0
            ViewForStyleFour.backgroundColor = ColorArray[ColorInitalValue]
        }
    }
    
    
    
    func nightModeFunction(){
      
                Constistentview.backgroundColor = StateFavsSingletonClass.share.NightModeBackgroundColor
                //OptionalBackImage.image = /// may not need
                TitoloLable.textColor = .white
                MainLable.textColor = .white
            
            GradientUIImage.image = #imageLiteral(resourceName: "MarkMaryMainContentGradient")
            
    
    }

    func ResizeImage(Imaggine ImaggineObject: UIImage?)-> UIImage{
        
        let ImageResize = max(OptionalBackImage.bounds.size.width , OptionalBackImage.bounds.size.height)/// max size of the image to be set is here such that the image placed in the image view is the same size as the image view
        var ImageSize : CGSize = CGSize(width: OptionalBackImage.bounds.size.width, height: OptionalBackImage.bounds.size.height)
        let _ = OptionalBackImage.bounds.size
        // var ImmaggineName : String = SourceFile
        var ContainerImmage : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG") // image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        
        
        guard let ImageView = ImaggineObject else{
            return #imageLiteral(resourceName: "errorImage-vector-image-PnG")// image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        }
        
        
        // this is to set the image size and width to an appropriate size that gets clipped and scaled properly:
        var UnscaledImageHeight = ImageView.size.height
        var UnscaledImageWidth = ImageView.size.width
        var ImageViewHeight =  OptionalBackImage.bounds.size.width
        var newHeight = UnscaledImageHeight * ( ImageViewHeight / UnscaledImageWidth )
        
        ImageSize = CGSize(width: ImageViewHeight , height: newHeight)
        
        
        
        let ImageRender = UIGraphicsImageRenderer(size: ImageSize)/// this is the cg size
        ContainerImmage = ImageRender.image{ _ in ImageView.draw(in : CGRect(origin: .zero , size: ImageSize))
            
        }
        
        
        return ContainerImmage/// this image has a default set to error displaying uiimage becuase it unless changed by the fact that there is an actual uiimage passed into the container image to be displayed
    }

    
}
