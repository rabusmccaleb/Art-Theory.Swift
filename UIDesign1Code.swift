//
//  UIDesign1Code.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 10/9/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation

class UIDesignOneClass: UIViewController{
    //varible outlets and general variables here:
    
    @IBOutlet var ViewForStyleOne: UIView!
    @IBOutlet weak var TitoloLable: UILabel!
    @IBOutlet weak var TestoContentLable: UILabel!
    @IBOutlet weak var FavButtImage: UIImageView!
    @IBOutlet weak var ImaggineVar: UIImageView!
    @IBOutlet weak var PaginaButtonString: UIButton!
    @IBOutlet weak var FavsButtonImmagine: UIButton!
    @IBOutlet weak var SubtleView: UIView!
    @IBOutlet weak var GradientUIImage: UIImageView!
    @IBOutlet weak var ScrollView: UIScrollView!

    
    
    @IBOutlet weak var PaginaFrostedViewButton: UIView!
    /// exist to insuer the vire trul captures this pass from image to view smoothly
    @IBOutlet weak var GradientView: UIView!
    
    @IBOutlet weak var InvisibleViewForPopup: UIView!
    
    
    @IBOutlet weak var FrostedMainView: UIView!
    @IBOutlet weak var Constistentview: UIView!

    
    var Design1FavsBoolean : Bool = false/// indicating that there is a boolean checked
    var PaginaBundleString : String?
   // var UIOneDelegate : FavsDataDelegate?
    /// data pass varibles
    var Titolo : String?
    var FavButt : UIImage?
    var Imaggine : UIImage?
    var Testo : String?
    var paginaUrlBundle : String?
    /// ViewDidLoad fuction
    override func viewDidLoad() {
        super.viewDidLoad()
        TestoContentLable.numberOfLines = 0
        
        
        
    
        
        PopUpView.isHidden = PopUpBoolean
        PopUpViewFunction()
        InvisibleViewForPopup.isHidden = PopUpBoolean// default set to true aka invisiable down below
        
        
        
       // PaginaButtonString.setImage(#imageLiteral(resourceName: "MarkMaryPaginaUIIcon"), for: .normal)/// set to look this way on load... the only questio is will it have the issue of that stupid ass blue color
        
        let PaginaFrosted = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        PaginaFrostedViewButton.addSubview(PaginaFrosted)
        PaginaFrosted.frame = PaginaFrostedViewButton.bounds
        PaginaFrostedViewButton.layer.cornerRadius = 5.0
        PaginaFrostedViewButton.clipsToBounds = true
        
        
        
        TitoloLable.text = ""
        connectionValuesToTapGestureRecognizer()
        //NightClubModeTimer()
        
       // sets the UIColor for background and font
        //view.backgroundColor =  StateFavsSingletonClass.share.MainContentBackGroundColor
        ViewForStyleOne.backgroundColor =  StateFavsSingletonClass.share.MainContentBackGroundColor
        Constistentview.backgroundColor = StateFavsSingletonClass.share.MainContentBackGroundColor
        self.TestoContentLable.textColor = .white
        
        var imageGradient = CAGradientLayer()
        imageGradient.colors = [
            UIColor.clear.cgColor,
            StateFavsSingletonClass.share.MainContentBackGroundColor5percent.cgColor ,
            StateFavsSingletonClass.share.MainContentBackGroundColor12percent.cgColor ,
        StateFavsSingletonClass.share.MainContentBackGroundColor65percent.cgColor,
            StateFavsSingletonClass.share.MainContentBackGroundColor.cgColor
        ]
        imageGradient.locations = [ 0.15, 0.30, 0.50 , 0.65 , 0.8]
        imageGradient.frame = GradientView.bounds
        GradientView.layer.insertSublayer(imageGradient, at: 0)
        
        
        
        
        let GradientTransition = CAGradientLayer()
        GradientTransition.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, StateFavsSingletonClass.share.MainContentBackGroundColor.cgColor,  StateFavsSingletonClass.share.MainContentBackGroundColor.cgColor]/// need to figure out how to make this a custom color
        //GradientTransition.frame = GradientView.bounds
       // GradientView.layer.insertSublayer(GradientTransition , at: 0 )//(GradientTransition)
        
      //imageGradient.frame = ImaggineVar.bounds
       // ImaggineVar.layer.insertSublayer(imageGradient, at: 0)
        
    
        
        FrostedMainView.backgroundColor = .clear
        
        var FrostedView : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        
        FrostedMainView.addSubview(FrostedView)
        FrostedView.frame = FrostedMainView.bounds//. creating this really beautiful display for function
        
        /*
        if let OptionalTitolo = Titolo{
        TitoloLable.text = Titolo
        }*/
        if let OptionalTesto = Testo{
        TestoContentLable.text = Testo
        }
        if let HeartImage = FavButt{
            FavButtImage.image = FavButt!
        }/// optional binding to insure there is indeed an image there
        if let MainImage = Imaggine{
           // ImaggineVar.image = Imaggine!
            ImaggineVar.image = ResizeImage(Imaggine: Imaggine)
        }/// optional binding to insure there is indeed an image there
        
        
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
    
    
    
    ///NightClubMode:
    var ColorInitalValue = 0
    func MainColorOccilatorUpdater(){
        ColorInitalValue = ColorInitalValue + 1
    }
    
    func NightClubModeTimer(){
//
    }
    
    @objc func NightClubDisplay(){
//
    }
    
    
    
    

    ///actions outlet functions and functions in general here
    @IBAction func PaginaButtonStringFunc(_ sender: Any) {
        if let OptionalPaginaBundle = paginaUrlBundle {
            /// passing in the bundle value into the singlton class to displat data
            
            // checking if the bundle url is avalible
            // will set the destination of pagina here
            //then it will display the controller and pull up the content availble
            // maybe if the user can't connect to the interenet then just display the an error not connected to the interenet view controller
        }
    }
    
    //Value Stored:
    //Value Stored:
    //Value Stored:
    func connectionValuesToTapGestureRecognizer(){
       // FavButtImage.addGestureRecognizer(FavsTapped)
    }

    /*
    lazy var FavsTapped : UITapGestureRecognizer = {
        let  Tapped = UITapGestureRecognizer(target: self, action: #selector(FavsStoreFunction))
        Tapped.numberOfTapsRequired = 1
        return Tapped
    }()
    */
    
    

    
    //PopUPControl:
    //PopUPControl:
    //PopUPControl:
    @IBAction func DisplpayPopUp(_ sender : Any){
        PopUpView.isHidden = !PopUpBoolean
        InvisibleViewForPopup.isHidden = !PopUpBoolean
    }
    
    @IBAction func InvisibleViewRemovePopUp(_ sender: Any) {
        PopUpBoolean = true
        PopUpView.isHidden = PopUpBoolean
        InvisibleViewForPopup.isHidden = PopUpBoolean
    }
    
    
    @IBOutlet weak var PopUpView: UIView!
    @IBOutlet weak var FrostedUIView: UIView!
    @IBOutlet weak var ViewPage: UIButton!
    @IBOutlet weak var DownLoadImage: UIButton!
    @IBOutlet weak var DismissPopUp: UIButton!
    var PopUpBoolean = true
    
    @IBAction func ViewPageFunction(_ sender: Any) {
        
        let PaginaSB : UIStoryboard = UIStoryboard(name: "PaginaView", bundle: nil)
        if let PaginaVC = PaginaSB.instantiateViewController(withIdentifier: "Pagina")as? PaginaViewClass{
            self.present(PaginaVC, animated: true, completion: nil)
            
        }
           /*
        let PaginaViewSB : UIStoryboard = UIStoryboard(name: "WebSub", bundle: nil)
        if let PaginaView = PaginaViewSB.instantiateViewController(withIdentifier: "WebSubID")as? WebSubView{
            self.present(PaginaView, animated: true, completion: nil)
        }
        */
        PopUpBoolean = true
        PopUpView.isHidden = PopUpBoolean
        InvisibleViewForPopup.isHidden = PopUpBoolean
    }
    
    @IBAction func DownLoadImageFunction(_ sender: Any) {
        if let Image = ImaggineVar.image{// first logic catcher for the condtion that the image does not exist
            UIImageWriteToSavedPhotosAlbum(ImaggineVar.image!, self, #selector(imageDownloadNotifyer(_:FinishedDownloadingWithError:_:)), nil)
            
        }
    }
    
    @objc func FinishedDownloadedImage(){
        PopUpBoolean = true
        PopUpView.isHidden = PopUpBoolean// once download proceeds then the popup should recede// needs to animate that however... a decrease in size and very quickly dissolve
        // logic for notifying the user that the image has downloaded
        InvisibleViewForPopup.isHidden = PopUpBoolean
    }
    
    @IBAction func DimissPopUpFunction(_ sender: Any) {
        PopUpBoolean = true
        PopUpView.isHidden = PopUpBoolean// once download proceeds then the popup should recede// needs to animate that however... a decrease in size and very quickly dissolve
        InvisibleViewForPopup.isHidden = PopUpBoolean
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
    
    
}

extension UIDesignOneClass : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
   @objc func imageDownloadNotifyer(_ image : UIImage , FinishedDownloadingWithError error: Error?, _ ContextInfo: UnsafeRawPointer?){
        if image == nil{
            print("Error")
        } else{
            print("Successful save")
        }
    }
}
