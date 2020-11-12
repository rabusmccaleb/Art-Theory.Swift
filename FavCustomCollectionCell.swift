//
//  FavCustomCollectionCell.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 1/5/20.
//  Copyright © 2020 Rabus Mccaleb. All rights reserved.
//

import UIKit


class FavCustomCollectionCell: UICollectionViewCell {
    @IBOutlet weak var BackGroundImage : UIImageView!
    @IBOutlet weak var GradientView : UIView!
    @IBOutlet weak var TestoLabel : UILabel!
    @IBOutlet weak var ImmagineVar : UIImageView!
    var testo : String?
    var BackGroundImmaggine : UIImage?
    var Immaggine : UIImage?
    var ImaggineBoolean : Bool = false
    var TestoBoolean : Bool = false
    var ImageSize : CGSize?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // awake from nib takes in the data as it comes// the conetent is divided in half for optimal functionality... if the view
        if ImaggineBoolean == true && TestoBoolean == false{
            // set up to run such that if the imaggine is checked true than it shows just the immagine above all
            BackGroundImage.image = nil
            GradientView.backgroundColor = .clear
            TestoLabel.text  = ""/// essentially emptying the cache such that there actually becomes an image to show
            if let ImmagineCheck = Immaggine{
                ImmagineVar.image = ResizeImage(Imaggine: Immaggine)// should return an image to convert
                ImmagineVar.bounds.size = ReturnImageSize()//sets the size of the view based on the image size this will allow for a useful presentation
                ImmagineVar.frame.size = ReturnImageSize()
                ImmagineVar.layer.cornerRadius = 12.5
                ImmagineVar.clipsToBounds = true
            }
        }
        if TestoBoolean == true && ImaggineBoolean == false {
            /// sets the method to run such that if testo is checked true than it shows the testo data based on the given info
            
            if let BackImage =  BackGroundImmaggine {
                BackGroundImage.image = ResizeBackGroundImage(Imaggine: BackGroundImmaggine!)
            } 
            let FavsGradient = CAGradientLayer()
           FavsGradient.colors = [StateFavsSingletonClass.share.FavsGradientColor1.cgColor , StateFavsSingletonClass.share.FavsGradientColor2.cgColor]// this objects transitions from a darker value to a much lighter one on top of an image
            
            FavsGradient.frame = GradientView.bounds
            GradientView.layer.addSublayer(FavsGradient)// added layer is the favs gradient layer
            if let TestoText = testo{
                TestoLabel.text = testo!// testo data displays if there is data
            }
            
        }
        
        ImmagineVar.layer.cornerRadius = 12.5
        ImmagineVar.clipsToBounds = true
        
    }
    
    func ReturnImageSize()->CGSize{
        var newImageHeight : Float?
        if Immaggine != nil{
            if StateFavsSingletonClass.share.FavsWidth != nil{
            newImageHeight = Float(Immaggine!.size.height) * (Float(Immaggine!.size.width) / Float(StateFavsSingletonClass.share.FavsWidth!) )// formula fore resizing immage
                 ImageSize = CGSize(width: CGFloat(StateFavsSingletonClass.share.FavsWidth!), height: CGFloat(newImageHeight!))
            }else{
                ImageSize = CGSize(width: 0.0, height: 0.0)
            }
        }else{
            ImageSize = CGSize(width: 0.0, height: 0.0)
        }
       return ImageSize!
    }
    
    var CellHeight: CGFloat?
    
    func ReturnBackGroundImageSize(_ Image : UIImage)->CGSize{
        var newImageHeight : Float?
        if Immaggine != nil{
            if StateFavsSingletonClass.share.FavsWidth != nil{
                newImageHeight = Float(Immaggine!.size.height) * (Float(Immaggine!.size.width) / Float(StateFavsSingletonClass.share.FavsWidth!) )// formula fore resizing immage
                ImageSize = CGSize(width: CGFloat(StateFavsSingletonClass.share.FavsWidth!), height: CGFloat(newImageHeight!))
            }else{
                ImageSize = CGSize(width: 0.0, height: 0.0)
            }
        }else{
            ImageSize = CGSize(width: 0.0, height: 0.0)
        }
        return ImageSize!
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
//    }

    func ResizeBackGroundImage(Imaggine ImaggineObject: UIImage?)-> UIImage{
        
        let ImageResize = max(ImmagineVar.bounds.size.width , ImmagineVar.bounds.size.height)/// max size of the image to be set is here such that the image placed in the image view is the same size as the image view
        var ImageSize : CGSize = CGSize(width: ImmagineVar.bounds.size.width, height: ImmagineVar.bounds.size.height)
        let _ = ImmagineVar.bounds.size
        // var ImmaggineName : String = SourceFile
        var ContainerImmage : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG") // image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        
        
        guard let ImageView = ImaggineObject else{
            return #imageLiteral(resourceName: "errorImage-vector-image-PnG")// image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        }
        
        
        // this is to set the image size and width to an appropriate size that gets clipped and scaled properly:
        var UnscaledImageHeight = ImageView.size.height
        var UnscaledImageWidth = ImageView.size.width
        var ImageViewHeight =  ImmagineVar.bounds.size.width
        var newHeight = UnscaledImageHeight * ( ImageViewHeight / UnscaledImageWidth )
        
        ImageSize = CGSize(width: ImageViewHeight , height: newHeight)
        
        
        
        let ImageRender = UIGraphicsImageRenderer(size: ImageSize)/// this is the cg size
        ContainerImmage = ImageRender.image{ _ in ImageView.draw(in : CGRect(origin: .zero , size: ImageSize))
            
        }
        
        
        return ContainerImmage/// this image has a default set to error displaying uiimage becuase it unless changed by the fact that there is an actual uiimage passed into the container image to be displayed
    }
    


    
    func ResizeImage(Imaggine ImaggineObject: UIImage?)-> UIImage{
        
        let ImageResize = max(ImmagineVar.bounds.size.width , ImmagineVar.bounds.size.height)/// max size of the image to be set is here such that the image placed in the image view is the same size as the image view
        var ImageSize : CGSize = CGSize(width: ImmagineVar.bounds.size.width, height: ImmagineVar.bounds.size.height)
        let _ = ImmagineVar.bounds.size
        // var ImmaggineName : String = SourceFile
        var ContainerImmage : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG") // image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        
        
        guard let ImageView = ImaggineObject else{
            return #imageLiteral(resourceName: "errorImage-vector-image-PnG")// image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        }
        
        
        // this is to set the image size and width to an appropriate size that gets clipped and scaled properly:
        var UnscaledImageHeight = ImageView.size.height
        var UnscaledImageWidth = ImageView.size.width
        var ImageViewHeight =  ImmagineVar.bounds.size.width
        var newHeight = UnscaledImageHeight * ( ImageViewHeight / UnscaledImageWidth )
        
        ImageSize = CGSize(width: ImageViewHeight , height: newHeight)
        
        
        
        let ImageRender = UIGraphicsImageRenderer(size: ImageSize)/// this is the cg size
        ContainerImmage = ImageRender.image{ _ in ImageView.draw(in : CGRect(origin: .zero , size: ImageSize))
            
        }
        
        
        return ContainerImmage/// this image has a default set to error displaying uiimage becuase it unless changed by the fact that there is an actual uiimage passed into the container image to be displayed
    }
    
}// end of class brackets

//class CollectionLayout: UICollectionViewLayout{
//
//    func CollectionViewContentSize()-> CGSize{
//        var OldHeight : Float?
//        var OldWidth : Float?
//        var CalculatedHeight : Float?
//        var NewWidth : Float?
//
//        if let NW = StateFavsSingletonClass.share.FavsWidth{
//            NewWidth = StateFavsSingletonClass.share.FavsWidth!
//        }
//        if let CH = CalculatedHeight {
//            CalculatedHeight = OldHeight * (NewWidth! / OldWidth!)
//        }
//        return CGSize(width: NewWidth, height: CalculatedHeight)
//    }
//
//   override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//    var LayoutAttributesArray : Any?
//        <#code#>
//    }
//    override func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem]) {
//        <#code#>
//    }
//
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        <#code#>
//    }
//}
