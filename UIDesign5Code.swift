//
//  UIDesign5Code.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 10/9/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation

class UIDesignFiveClass: UIViewController{
    
    @IBOutlet var ViewForStyleFive: UIView!
    @IBOutlet weak var TitoloLable: UILabel!
    @IBOutlet weak var FavButtImage: UIImageView!
    @IBOutlet weak var ImaggineVar: UIImageView!
    @IBOutlet weak var PaginaButtonString: UIButton!
    @IBOutlet weak var ArtistaCreditoLable: UILabel!
    @IBOutlet weak var RoundedEdgesUIImageView: UIImageView!
    //scroll view inset properties... control
    @IBOutlet weak var PopUpView: UIView!
    @IBOutlet weak var FrostedUIView: UIView!
    @IBOutlet weak var ViewPage: UIButton!
    @IBOutlet weak var DownLoadImage: UIButton!
    @IBOutlet weak var DismissPopUp: UIButton!
    @IBOutlet weak var InivisiblePopupview: UIView!
    var PopUpBoolean = true
   // var UIFiveDelegate : FavsDataDelegate?/// setting up the delegat to pass the data through this class by intializing the delagt to the curren protocol
    @IBOutlet weak var SubtleTwinImaggine : UIImageView!
    @IBOutlet weak var GradientUIImage: UIImageView!
    @IBOutlet weak var FrostedMainView: UIView!
    @IBOutlet weak var Constistentview: UIView!

    
    var PaginaBundleString : String?
    ///
    ///SeperateVariables
    var Titolo : String?
    var FavButt : UIImage?
    var Imaggine : UIImage?
    var PaginaImage : UIImage?
    var Artista : String?
    var BackGroundedUIRounded : UIImage? = StateFavsSingletonClass.share.MainRoundEdgeBackTransperncy
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        PopUpView.isHidden = PopUpBoolean
        InivisiblePopupview.isHidden = PopUpBoolean
        InivisiblePopupview.addGestureRecognizer(dismissPopUpTap)// to allow for the view to be dismissed when the pop up is visible and tapped
        PopUpViewFunction()
        /// POPUP VISUAL DISPALAY
        /* function:*/ PopUpViewFunction()
        /// END OF POP LAYOUT
        Constistentview.backgroundColor = StateFavsSingletonClass.share.TranslucentMainContentBackGroundColor
        
        connectionValuesToTapGestureRecognizer()
        
        FrostedMainView.backgroundColor = .clear
        
        
        var FrostedView : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        FrostedMainView.addSubview(FrostedView)
        FrostedView.frame = FrostedMainView.bounds//. creating this really beautiful display for function
        
        
        TitoloLable.text = ""
        /*
        if let ThisTitolo = Titolo{
            TitoloLable.text = Titolo!
        }*/
        if let ThisFavButt = FavButt{
            FavButtImage.image = FavButt!
        }
        if let ThisImaggine = Imaggine{
            ImaggineVar.image = ResizeImage(Imaggine: Imaggine)// for resizingimage such that it causes less memory conflict
            SubtleTwinImaggine.image = Imaggine!
        }
        if let ThisPaginaArtista = PaginaImage{
            PaginaButtonString.imageView?.image = PaginaImage!
        }
        if let ThisArtista = Artista{
            ArtistaCreditoLable.text = Artista!
        }
        
        if let ThisRoundedEdges = BackGroundedUIRounded{
            //RoundedEdgesUIImageView.image = BackGroundedUIRounded!
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
            ViewForStyleFive.backgroundColor = ColorArray[ColorInitalValue]
        }else{
            ColorArray.shuffle()
            ColorInitalValue = 0
            ViewForStyleFive.backgroundColor = ColorArray[ColorInitalValue]
        }
    }
    
    func nightModeFunction(){
     // no use a longer used method/function
    }
    
    ///actions outlet functions and functions in general here
    @IBAction func PaginaButtonStringFunc(_ sender: Any) {
    }
    
   

    //Value Stored
    func connectionValuesToTapGestureRecognizer(){
        FavButtImage.addGestureRecognizer(FavsTapped)
    }
    
    
    lazy var FavsTapped : UITapGestureRecognizer = {
        let  Tapped = UITapGestureRecognizer(target: self, action: #selector(FavsStoreFunction))
        Tapped.numberOfTapsRequired = 1
        
        return Tapped
    }()
    
    @objc func FavsStoreFunction(){
        // no use a longer used method/function
    }
    func FavsValueLocation(WhichValuePass Which: Int, CurrentVVPass CVV: Int, ImageDataPass IDP:UIImage){
        // no use a longer used method/function

    }

    //PopUPControl:
    //PopUPControl:
    //PopUPControl:
    @IBAction func DisplpayPopUp(_ sender : Any){
        PopUpView.isHidden = !PopUpBoolean
        InivisiblePopupview.isHidden = !PopUpBoolean
    }
    
    let dismissPopUpTap : UITapGestureRecognizer = {
        var DimissPopUpTap = UITapGestureRecognizer(target: self, action: #selector(InvisiblePopupViewDismissFunc))
        DimissPopUpTap.numberOfTapsRequired = 1
        return DimissPopUpTap// sets up and returns the tap to be dismissed
    }()
    
    @objc func InvisiblePopupViewDismissFunc(){
        PopUpView.isHidden = true
        InivisiblePopupview.isHidden = true
    }

    @IBAction func ViewPageFunction(_ sender: Any) {
        let PaginaSB : UIStoryboard = UIStoryboard(name: "PaginaView", bundle: nil)
        if let PaginaVC = PaginaSB.instantiateViewController(withIdentifier: "Pagina")as? PaginaViewClass{
            self.present(PaginaVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func DownLoadImageFunction(_ sender: Any) {
        if let Image = ImaggineVar.image{// first logic catcher for the condtion that the image does not exist
            UIImageWriteToSavedPhotosAlbum(ImaggineVar.image!, nil, #selector(imageDownloadNotifyer(_:FinishedDownloadingWithError:_:)), nil)
        }
    }
    
    @objc func FinishedDownloadedImage(){
        PopUpBoolean = true
        PopUpView.isHidden = PopUpBoolean// once download proceeds then the popup should recede// needs to animate that however... a decrease in size and very quickly dissolve
        // logic for notifying the user that the image has downloaded
    }
    
    @IBAction func DimissPopUpFunction(_ sender: Any) {
        PopUpBoolean = true
        PopUpView.isHidden = PopUpBoolean// once download proceeds then the popup should recede// needs to animate that however... a decrease in size and very quickly dissolve
    }
    
    func PopUpViewFunction(){
        PopUpView.layer.cornerRadius = 12.0
        PopUpView.clipsToBounds = true
        let FrostedPopDisplay : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        FrostedUIView.addSubview(FrostedPopDisplay)
        FrostedPopDisplay.frame = FrostedUIView.bounds
    ////// Visual Display Of button control:
        //cancel:
        DismissPopUp.titleLabel?.text = "CANCEL"
        DismissPopUp.titleLabel?.textColor = StateFavsSingletonClass.share.PopUpCancleTextColor
        DismissPopUp.titleLabel?.font = StateFavsSingletonClass.share.PaginaPopUpFontCancel
        //rest of font and button control:
        ViewPage.titleLabel?.text = "VIEW PAGE"
        ViewPage.titleLabel?.font = StateFavsSingletonClass.share.PaginaPopUpFont
        ViewPage.titleLabel?.textColor = StateFavsSingletonClass.share.PopUpTextColor
    }
    
    func ResizeImage(Imaggine ImaggineObject: UIImage?)-> UIImage{
        
        let ImageResize = max(ImaggineVar.bounds.size.width , ImaggineVar.bounds.size.height)/// max size of the image to be set is here such that the image placed in the image view is the same size as the image view
        var ImageSize : CGSize = CGSize(width: ImaggineVar.bounds.size.width, height: ImaggineVar.bounds.size.height)
        let _ = ImaggineVar.bounds.size
        // var ImmaggineName : String = SourceFile
        var ContainerImmage : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG") // image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        
        
        guard let ImageView = ImaggineObject else{
            return #imageLiteral(resourceName: "errorImage-vector-image-PnG")// image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        }
        
        
        // this is to set the image size and width to an appropriate size that gets clipped and scaled properly:
        var UnscaledImageHeight = ImageView.size.height
        var UnscaledImageWidth = ImageView.size.width
        var ImageViewHeight =  ImaggineVar.bounds.size.width
        var newHeight = UnscaledImageHeight * ( ImageViewHeight / UnscaledImageWidth )
        
        ImageSize = CGSize(width: ImageViewHeight , height: newHeight)
        
        
        
        let ImageRender = UIGraphicsImageRenderer(size: ImageSize)/// this is the cg size
        ContainerImmage = ImageRender.image{ _ in ImageView.draw(in : CGRect(origin: .zero , size: ImageSize))
            
        }
        
        
        return ContainerImmage/// this image has a default set to error displaying uiimage becuase it unless changed by the fact that there is an actual uiimage passed into the container image to be displayed
    }
    
    
}



extension UIDesignFiveClass : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @objc func imageDownloadNotifyer(_ image : UIImage , FinishedDownloadingWithError error: Error?, _ ContextInfo: UnsafeRawPointer?){
        if image == nil{
            print("Error")
        } else{
            print("Successful save")
        }
    }
}
