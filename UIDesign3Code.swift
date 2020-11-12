//
//  UIDesign3Code.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 10/9/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation

class UIDesignThreeClass: UIViewController{
    
    @IBOutlet var ViewForStyleThree: UIView!
    @IBOutlet weak var TitoloLable: UILabel!
    @IBOutlet weak var FavButtImage: UIImageView!
    @IBOutlet weak var ImaggineVar: UIImageView!
    @IBOutlet weak var TestoContentLable: UILabel!
    @IBOutlet weak var PaginaButtonString: UIButton!
    @IBOutlet weak var SubtleView: UIView!
    var PaginaBundleString : String?
    
   
     @IBOutlet weak var GradientUIImage: UIImageView!
    
    
    
    @IBOutlet weak var FrostedMainView: UIView!
    @IBOutlet weak var Constistentview: UIView!

    
    
    
    var titolo : String?
    var FavButt : UIImage?
    var Imaggine : UIImage?
    var Testo : String?
    var paginaUrlBundle : String?
    override func viewWillAppear(_ animated: Bool) {
//        InivisiblePopupview.backgroundColor = .clear
//        InivisiblePopupview.isHidden = true
//        InivisiblePopupview.addGestureRecognizer(RemoveViewTap)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PopUpView.isHidden = PopUpBoolean
        PopUpViewFunction()
        InivisiblePopupview.isHidden = true
        InivisiblePopupview.addGestureRecognizer(RemoveViewTap)
        
        TestoContentLable.numberOfLines = 0
        nightModeFunction()
        TitoloLable.text = ""
        
       // PaginaButtonString.setImage(#imageLiteral(resourceName: "MarkMaryPaginaUIIcon"), for: .normal)/// set to look this way on load... the only questio is will it have the issue of that stupid ass blue color
        
        FrostedMainView.backgroundColor = .clear
        
        var FrostedView : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        FrostedMainView.addSubview(FrostedView)
        FrostedView.frame = FrostedMainView.bounds//. creating this really beautiful display for function
        
        var ColorArray : [UIColor] = StateFavsSingletonClass.share.MainReturnPalete()
        ViewForStyleThree.backgroundColor! = ColorArray[ColorInitalValue]
        
       // NightClubModeTimer() nightclubtimer
        
        connectionValuesToTapGestureRecognizer()
        /*if let OptionalTitolo = titolo{
            TitoloLable.text = titolo
        }*/
        if let OptionalTesto = Testo{
            TestoContentLable.text = Testo
        }
        if let HeartImage = FavButt{
            FavButtImage.image = FavButt!
        }/// optional binding to insure there is indeed an image there
        if let MainImage = Imaggine{
            ImaggineVar.image = ResizeImage(Imaggine: MainImage)/// this lowers the memory cost of each image in the view controller
        }/// optional binding to insure there is indeed an image there
        
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
            ViewForStyleThree.backgroundColor = ColorArray[ColorInitalValue]
        }else{
            ColorArray.shuffle()
            ColorInitalValue = 0
            ViewForStyleThree.backgroundColor = ColorArray[ColorInitalValue]
        }
    }
    
    
    func nightModeFunction(){
            TitoloLable.textColor = .white
            TestoContentLable.textColor = .white
           Constistentview.backgroundColor = #colorLiteral(red: 0.1637933552, green: 0.1756276488, blue: 0.2069563866, alpha: 1) //StateFavsSingletonClass.share.NightModeBackgroundColor
            ///FavButtImage.image =// white version of display
            ///ImaggineVar.image =/// should be the same so nothing
            ///PaginaButtonString.imageView = /// equals the same thing there shouldn't be a change
            //// display rules for night mode
            
            SubtleView.layer.cornerRadius = 15.0
            SubtleView.clipsToBounds = true
            GradientUIImage.image = #imageLiteral(resourceName: "MarkMaryMainContentGradient")
 
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
    
    //PopUPControl:
    //PopUPControl:
    //PopUPControl:
    @IBAction func DisplpayPopUp(_ sender : Any){
        PopUpView.isHidden = !PopUpBoolean
        InivisiblePopupview.isHidden = !PopUpBoolean
    }
    
    @IBOutlet weak var InivisiblePopupview : UIView!
    @IBOutlet weak var PopUpView: UIView!
    @IBOutlet weak var ViewPage: UIButton!
    @IBOutlet weak var DownLoadImage: UIButton!
    @IBOutlet weak var DismissPopUp: UIButton!
    @IBOutlet weak var FrostedUIView: UIView!
    var PopUpBoolean = true
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
    let RemoveViewTap : UITapGestureRecognizer = {
        var TapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self , action: #selector(RemoveTap) )
            TapGesture.numberOfTapsRequired = 1
        return TapGesture
    }()
    @objc func RemoveTap(){
        PopUpView.isHidden = true
        InivisiblePopupview.isHidden = true
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

extension UIDesignThreeClass : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @objc func imageDownloadNotifyer(_ image : UIImage , FinishedDownloadingWithError error: Error?, _ ContextInfo: UnsafeRawPointer?){
        if image == nil{
            print("Error")
        } else{
            print("Successful save")
        }
    }
}

