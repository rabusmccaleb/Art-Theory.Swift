//
//  ViewController.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 8/26/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//
import Foundation

import UIKit

import AVFoundation


class ViewController: UIViewController{
    
    @IBOutlet var PanGesture: UIPanGestureRecognizer!
    @IBOutlet weak var MuseProgressBar: UIProgressView!
    // UIImageForUIDisplay Here:
    @IBOutlet weak var BackGroundUIImage: UIImageView!
    @IBOutlet weak var BackGroundGradientImage: UIImageView!
    @IBOutlet weak var TableViewBackGroundImage: UIImageView!
    //seach content search bar, view, and underlay image
    @IBOutlet weak var searchContentBar: UISearchBar!
    @IBOutlet weak var FrostedSearchView: UIView!
    @IBOutlet weak var MuseControlPlayButton: UIButton!
    @IBOutlet weak var MuseControlShowMuse: UIButton!
    
    @IBOutlet weak var ImageMuseToControlView: UIImageView!
    
    @IBOutlet var ViewControllerMain: UIView!
    
    //UIButton DisplayFavs and TurnOnTheLights:
    @IBOutlet weak var NightModeButton: UIButton!
    @IBOutlet weak var DisplayFavsButton: UIButton!
    
    @IBOutlet weak var MuseControlView : UIView!
    @IBOutlet weak var MuseBottomImage : UIImageView!
    @IBOutlet weak var MuseBackGroundView: UIView!// for frosted window
    @IBOutlet weak var MarkMaryLogo : UIImageView!
    
    @IBOutlet weak var Home: UIButton!
    @IBOutlet weak var Favs: UIButton!
    @IBOutlet weak var Muse: UIButton!
    @IBOutlet weak var Gallery: UIButton!
    @IBOutlet weak var NavContainer: UIView!//Exists as a UIView to subview views lol!
    @IBOutlet weak var StackViewForNav : UIStackView!
    @IBOutlet weak var NavBackGroundImageView: UIImageView!
    
    
    @IBOutlet weak var FavsButton : UIButton!// vestige outlets
    @IBOutlet weak var GalleryButton: UIButton!//vestige outlets
    
    @IBOutlet weak var ViewForBackGroundColor: UIView!
    
//ImageViewButton Access in order from right to left going down... Top one is top most left... Middle two is most right... it follows that logic.
    
    var SectionString : String = ""// this is for the Pickerdelagate to place a string in aassociotn with
    var PickerDelegate : SectionReturnerProtocol?/// here is the delegate
    
    override func viewWillAppear(_ animated: Bool) {
        NavContainer.addGestureRecognizer(TapNavOnOff)// to remove nav controller add nav controller
        
        var InstanceOfMainDataClass = mainDataClass()
        InstanceOfMainDataClass.SendingDataToSingleton()/// calls this function to send data that exists in this class to the singleton such that it will be accessable to the FavTableAndCollectionView in side of it's classes and it's logic
        MuseProgressBar.trackTintColor = StateFavsSingletonClass.share.ProgressoProgressColor// set up for muse
        StateFavsSingletonClass.share.OnLoadGalleryStoredData()
        StateFavsSingletonClass.share.ApplicationDidLoad = true
        StateFavsSingletonClass.share.OnLoadRestorePreviousData()/// this method is called under the condition that any data has been stored at all
        
        StateFavsSingletonClass.share.AutoPlayOnloadStatus()// sets the status when the user intially loads this view
        SizeReturn()/// calling this method for the UIFAVSDESIGNCLASS so that it is availible when the view is to be loaded for the user
        //Deleting all of the stored DataValues:
        //Deleting all of the stored DataValues:
        //Deleting all of the stored DataValues:

        //StateFavsSingletonClass.share.DeleteAllStoredData()/// this method is called under the condition thata any data has been stored at all
//        StateFavsSingletonClass.share.FavCollectionViewData.append([1 :[1: #imageLiteral(resourceName: "greeks-article")]])
//        print("Data-To-Be-Returned-For-Immagines-In-Array \(StateFavsSingletonClass.share.FavCollectionViewData)")
        
    
        /// load all of that data into its appropriate arrays on load that way when accessed the data displays when the user is ready to use it.
        
//        if MuseSingleton.share.song.isPlaying == true{
        MuseDisplayFunctionality()
        
       // MuseControlPlayButton.backgroundColor = .white
 
       MuseControlShowMuse.setImage(#imageLiteral(resourceName: "MuseDisplayUI"), for: .normal)
        
        BackGroundGradientImage.image = #imageLiteral(resourceName: "MarkMaryMainUIBackGroundVIew")// there is an image literal here but because it is transparent it seems not to be visible ther but double click to change
        BackGroundUIImage.image = ResizeImage()  ///don't freak soon this will be in an array that goes along with other commands for setting the tone for the display
        //MuseBottomImage.image = ImageMuseToControlView.image
        
        // ImageMuseToControlView.image = ResizeAllImage(ImageSingleton.share.ImageString[StateFavsSingletonClass.share.ImaggineNumber]!, ImageMuseToControlView)
        // will be setting it some other location but for now... this works
        
        
        var museControlCornerRadius : CGFloat = 0.0
        MuseControlView.layer.cornerRadius = museControlCornerRadius
        MuseControlView.clipsToBounds = true
        MuseBottomImage.layer.cornerRadius = museControlCornerRadius
        MuseBottomImage.clipsToBounds = true
        ImageMuseToControlView.layer.cornerRadius = museControlCornerRadius
        ImageMuseToControlView.clipsToBounds = true
        
        //MuseBottomImage.image = UIImage(contentsOfFile: ImageSingleton.share.ImageString[73]!)!
        
        ViewForBackGroundColor.backgroundColor = StateFavsSingletonClass.share.InitalMainContentBackGroundColor
        
        NavContainer.isHidden = true// hidden on the initial load such that the view when loaded is on the home page and it's objects are accessable.
        self.StackViewForNav.transform = CGAffineTransform(translationX: 0, y: 100)
        self.NavBackGroundImageView.transform = CGAffineTransform(translationX: 0, y: 100)
        self.Gallery.transform = CGAffineTransform(translationX: 0, y: 100)
        self.Home.transform = CGAffineTransform(translationX: 0, y: 100)
        /// for making the tab controller pop up when the view loads... so as seen abouve the tab controller needs to be down before it can pop up to be seen
        SettingUITabControlls("Home")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MarkMaryLogo.image = #imageLiteral(resourceName: "MarkMaryLogoControlTopContent")
       // GalleryButton.setBackgroundImage(#imageLiteral(resourceName: "MarkMaryToneIcon"), for: .normal)
       // FavsButton.setBackgroundImage(#imageLiteral(resourceName: "MarkMaryUIIconHeart"), for: .normal)
        //Setting UIImmagines here above:
        searchContentBar.backgroundColor = .clear
        searchContentBar.barStyle = .default
        
        MuseSingleton.share.MusicGrabAndStore()
        displayTitoloFunc()
        
        self.ViewControllerMain.layer.cornerRadius = 12.5
        self.ViewControllerMain.clipsToBounds = true
        
        //Three line code logic for frosted window visual effect on the musebar below
        var Frosted : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        MuseBackGroundView.addSubview(Frosted)
        Frosted.frame = MuseBackGroundView.bounds
        MuseControlView.isHidden = true
        
        
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        AnimateTabControllerUpShow()//makes tab contorller popup pop up animated when the view is visible
    }
  
    
    
    
    // BackGround Image resize function: It only has one image to resize so there won't be much more complexity then what is to be returned:
    
    func SizeReturn(){
        // this function is for the UIFavsDesign class but it may need to be called before then such that the information is availble when the user is able to use the view...
        let width = ((self.view.bounds.size.width)/2) - 16// the image size for the collection veiw will be half the size of the view plus and additional 8 are taken away to maxmize spacing...
        StateFavsSingletonClass.share.FavsWidth = width
    }
    
    
    func ResizeImage()-> UIImage{
        let ImageResize = max(BackGroundUIImage.bounds.size.width , BackGroundUIImage.bounds.size.height)/// max size of the image to be set is here such that the image placed in the image view is the same size as the image view
        var ImageSize : CGSize = CGSize(width: BackGroundUIImage.bounds.size.width, height: BackGroundUIImage.bounds.size.height)
        let _ = BackGroundUIImage.bounds.size
        // var ImmaggineName : String = SourceFile
        var ContainerImmage : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG") // image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        
        if let Imagefile = Bundle.main.path(forResource: "MarkMaryMainUIBackGroundVIew.", ofType: "png"){
            guard let ImageView = UIImage(contentsOfFile: Imagefile) else{
                return #imageLiteral(resourceName: "errorImage-vector-image-PnG")// image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
            }
            
            
            // this is to set the image size and width to an appropriate size that gets clipped and scaled properly:
            var UnscaledImageHeight = ImageView.size.height
            var UnscaledImageWidth = ImageView.size.width
            var ImageViewHeight =  BackGroundUIImage.bounds.size.width
            var newHeight = UnscaledImageHeight * ( ImageViewHeight / UnscaledImageWidth )
            
            ImageSize = CGSize(width: ImageViewHeight , height: newHeight)
            
            
            
            let ImageRender = UIGraphicsImageRenderer(size: ImageSize)/// this is the cg size
            ContainerImmage = ImageRender.image{ _ in ImageView.draw(in : CGRect(origin: .zero , size: ImageSize))
                
            }
        }
        
        return ContainerImmage/// this image has a default set to error displaying uiimage becuase it unless changed by the fact that there is an actual uiimage passed into the container image to be displayed
    }

    
    func ResizeAllImage(_ ImageBundle : String?,_ UIImageViewForSize: UIImageView)-> UIImage{
        let ImageResize = max(UIImageViewForSize.bounds.size.width , UIImageViewForSize.bounds.size.height)/// max size of the image to be set is here such that the image placed in the image view is the same size as the image view
        var ImageSize : CGSize = CGSize(width: UIImageViewForSize.bounds.size.width, height: UIImageViewForSize.bounds.size.height)
        let _ = UIImageViewForSize.bounds.size
        // var ImmaggineName : String = SourceFile
        var ContainerImmage : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG") // image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        
        if let Imagefile = ImageBundle{
            guard let ImageView = UIImage(contentsOfFile: Imagefile) else{
                return #imageLiteral(resourceName: "errorImage-vector-image-PnG")// image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
            }
            
            
            // this is to set the image size and width to an appropriate size that gets clipped and scaled properly:
            var UnscaledImageHeight = ImageView.size.height
            var UnscaledImageWidth = ImageView.size.width
            var ImageViewHeight =  UIImageViewForSize.bounds.size.width
            var newHeight = UnscaledImageHeight * ( ImageViewHeight / UnscaledImageWidth )
            
            ImageSize = CGSize(width: ImageViewHeight , height: newHeight)
            
            
            
            let ImageRender = UIGraphicsImageRenderer(size: ImageSize)/// this is the cg size
            ContainerImmage = ImageRender.image{ _ in ImageView.draw(in : CGRect(origin: .zero , size: ImageSize))
                
            }
        }
        
        return ContainerImmage/// this image has a default set to error displaying uiimage becuase it unless changed by the fact that there is an actual uiimage passed into the container image to be displayed
    }

///////////MainButtonTapCalls
    
    @IBAction func TopOneCallToDisplayNavControl(Sender: Any){
        let El : Int = 0
            var ElemSB = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let ElemViewC = ElemSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
            StateFavsSingletonClass.share.FavsBoolean = false// to insure favs is doesn't show instead
            ElemViewC.modalTransitionStyle = .crossDissolve
            ElemViewC.WhichValue = El
            self.present(ElemViewC, animated: true, completion: nil)
        }
    }
    ///////////////   ////////////   ////////////   ////////////   ////////////   ////////////

    
    
    @IBAction func TopTwoCallToDisplayNavControl(){
        let col : Int = 1
        let colSB = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let ColVIew = colSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
            StateFavsSingletonClass.share.FavsBoolean = false// to insure favs is doesn't show instead
            ColVIew.WhichValue = col
            ColVIew.modalTransitionStyle = .crossDissolve
            self.present(ColVIew, animated: true, completion: nil)
        }
        
    }
    ////////////   ////////////   ////////////   ////////////   ////////////   ////////////

    @IBAction func MiddleOneCallToDisplayNavControl(){
        let shape : Int = 2
       let ShapeSB = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let ShapeView = ShapeSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
            
            StateFavsSingletonClass.share.FavsBoolean = false// to insure favs is doesn't show instead
            ShapeView.WhichValue = shape
            ShapeView.modalTransitionStyle = .crossDissolve
            self.present(ShapeView, animated: true, completion: nil)
        }
    }
       ////////////   ////////////   ////////////   ////////////   ////////////   ////////////

    @IBAction func MiddleTwoCallToDisplayNavControl(){
        //will display navigation controller via an //present and animation
        let Perspec : Int = 3
        let PerspSB = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let PerspView = PerspSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
            StateFavsSingletonClass.share.FavsBoolean = false// to insure favs is doesn't show instead
            PerspView.WhichValue = Perspec
            PerspView.modalTransitionStyle = .crossDissolve
            self.present(PerspView, animated: true, completion: nil)
        }
    }
   ////////////   ////////////   ////////////   ////////////   ////////////   ////////////

    @IBAction func ButtomOneCallToDisplayNavControl(){
        //will display navigation controller via an //present and animation
       //"Expression"
        let Expression : Int = 4
        let ExpressionSB = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let ExpressionView = ExpressionSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
            StateFavsSingletonClass.share.FavsBoolean = false// to insure favs is doesn't show instead
            ExpressionView.WhichValue = Expression
            ExpressionView.modalTransitionStyle = .crossDissolve
            self.present(ExpressionView, animated: true, completion: nil)
        }
    }
    ////////////   ////////////   ////////////   ////////////   ////////////   ////////////
    /*
    lazy var ButtomTwoButton : UITapGestureRecognizer = {
        let BottomTwo = UITapGestureRecognizer(target: self, action: #selector(ButtomTwoCallToDisplayNavControl))
        BottomTwo.numberOfTapsRequired = 1
        
        return BottomTwo
    }()
    */
    @IBAction func ButtomTwoCallToDisplayNavControl(){
        //will display navigation controller via an //present and animation
        let prac : Int = 5
        let PracSB = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let PracView = PracSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
            StateFavsSingletonClass.share.FavsBoolean = false// to insure favs is doesn't show instead
            PracView.WhichValue = prac
            PracView.modalTransitionStyle = .crossDissolve
            self.present(PracView, animated: true, completion: nil)
        } 
    }   ////////////   ////////////   ////////////
    
     ///NightMode And DisplayFavsFunctionality:
    ///NightMode And DisplayFavsFunctionality:
    @IBAction func DisplayFavsFunction(_ sender: Any) {
        let FavsViewSB : UIStoryboard = UIStoryboard(name: "UIFavsDesign", bundle: nil)
        if let FavsViewVC = FavsViewSB.instantiateViewController(withIdentifier: "FavsID")as? UIDesignFavsClass{
            ///// any additional set uo here: Animation, value passs, etc
            FavsViewVC.modalTransitionStyle = .crossDissolve
            self.present(FavsViewVC, animated: true, completion: nil)
        }
    }
    
    
    func NightModeFunctionCall(){
        // no use a longer used method/function
    }
    @IBAction func NightModeFunctionality(_ sender: Any) {
        
        //// DUDE DELETE THIS WHEN DONE WITH DEBUGGING!
        
       // StateFavsSingletonClass.share.DeleteAllStoredData()
        
        let GallerySb : UIStoryboard = UIStoryboard(name: "Gallery", bundle: nil)
        if let GallerVC = GallerySb.instantiateViewController(withIdentifier: "Gallery")as? GalleryClass{
            self.present(GallerVC, animated: true, completion: nil)
        }
    }
    
    
    
    
    @IBAction func DisplayGallery(_ Sender : Any){
    let GallerySb : UIStoryboard = UIStoryboard(name: "Gallery", bundle: nil)
    if let GallerVC = GallerySb.instantiateViewController(withIdentifier: "Gallery")as? GalleryClass{
        self.present(GallerVC, animated: true, completion: nil)
    }
        
        
    }
    

    ////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////
    ///////////////// Stuff for the bottom tab:
    ////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////
    ///////////////// Stuff for the bottom tab:
    
    
    func MuseDisplayFunctionality(){
        if MuseSingleton.share.song.isPlaying == true{
            MuseControlPlayButton.setBackgroundImage(#imageLiteral(resourceName: "MainMuseControlPauseUI"), for: .normal)
        }else{
            MuseControlPlayButton.setBackgroundImage(#imageLiteral(resourceName: "MainMuseControlPlayUI"), for: .normal)
        }
    }
    @IBOutlet weak var MuseTitoloLable: UILabel!
    @IBOutlet weak var MuseArtistLable: UILabel!
    @IBOutlet weak var MuseTempoLabel: UILabel!
    
    @IBAction func PlayPauseBarButton(_ sender: Any) {
        MuseSingleton.share.singletonPlyPause()
        //MuseSingleton.share.TimerForSliderSongUpdate()
        MuseDisplayFunctionality()
        
    
 
    }
    @IBAction func DisplayMuseBarButton(_ sender: Any) {
        /// displaying muse view controller on click here:
        let MuseStoryBoard : UIStoryboard = UIStoryboard(name: "MuseView", bundle: nil)
        if let MuseViewController = MuseStoryBoard.instantiateViewController(withIdentifier: "MuseMVCIdentifier")as? MuseMVC{
            self.present(MuseViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func DragDisplayMuseView(_ sender: Any) {
        
      
        
        let MuseStoryBoard : UIStoryboard = UIStoryboard(name: "MuseView", bundle: nil)
        if let MuseViewController = MuseStoryBoard.instantiateViewController(withIdentifier: "MuseMVCIdentifier")as? MuseMVC{
           
            
            self.present(MuseViewController, animated: true, completion: nil)
        } 
    }
    
    
    func displayTitoloFunc(){
        var BarViewTitoloTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(displayTitolo), userInfo: nil, repeats: true)
    }
    
   @objc func displayTitolo(){
        MuseTitoloLable.text = MuseSingleton.share.DisplayTitolo()
        MuseTempoLabel.text = MuseSingleton.share.NewTimeFunction()
        MuseArtistLable.text = "Rosso Leo"
    
        var MuseCurr = MuseSingleton.share.song.currentTime
        var MuseDurr = MuseSingleton.share.song.duration
        var MuseRatio = Float(MuseCurr / MuseDurr)
        MuseProgressBar.progress = MuseRatio
        MuseProgressBar.setProgress(MuseProgressBar.progress, animated: true)
        MuseDisplayFunctionality()
    }
    
        /// NavigationControl:
        /// NavigationControl:
        /// NavigationControl:
        /// NavigationControl:
        /// NavigationControl:
    
    var SubViewToAdd : UIViewController?
    func AddingSubView(){
        // logic:
        if let SubView = SubViewToAdd {
            NavContainer.addSubview(SubViewToAdd!.view)
            SubViewToAdd!.view.willMove(toSuperview: NavContainer)
        }
    }
    
    func RemovingSubView(){
        // logic:
        if let SubView = SubViewToAdd {
            SubViewToAdd!.willMove(toParent: nil)
            SubViewToAdd!.view.removeFromSuperview()
            SubViewToAdd!.removeFromParent()
        }
    }
    
    
    func SettingUITabControlls(_ WhatWasClicked: String){
        switch WhatWasClicked{
        case "Home":
            Home.setBackgroundImage(#imageLiteral(resourceName: "Home"), for: .normal)
            Favs.setBackgroundImage(#imageLiteral(resourceName: "FavFade"), for: .normal)
            Muse.setBackgroundImage(#imageLiteral(resourceName: "MuseFav"), for: .normal)
            Gallery.setBackgroundImage(#imageLiteral(resourceName: "GalFade"), for: .normal)
            break
        case "Favs":
            Home.setBackgroundImage(#imageLiteral(resourceName: "HomeFade"), for: .normal)
            Favs.setBackgroundImage(#imageLiteral(resourceName: "Fav"), for: .normal)
            Muse.setBackgroundImage(#imageLiteral(resourceName: "MuseFav"), for: .normal)
            Gallery.setBackgroundImage(#imageLiteral(resourceName: "GalFade"), for: .normal)
            break
        case "Muse":
            Home.setBackgroundImage(#imageLiteral(resourceName: "HomeFade"), for: .normal)
            Favs.setBackgroundImage(#imageLiteral(resourceName: "FavFade"), for: .normal)
            Muse.setBackgroundImage(#imageLiteral(resourceName: "Muse"), for: .normal)
            Gallery.setBackgroundImage(#imageLiteral(resourceName: "GalFade"), for: .normal)
            break
        case "Gallery":
            Home.setBackgroundImage(#imageLiteral(resourceName: "HomeFade"), for: .normal)
            Favs.setBackgroundImage(#imageLiteral(resourceName: "FavFade"), for: .normal)
            Muse.setBackgroundImage(#imageLiteral(resourceName: "MuseFav"), for: .normal)
            Gallery.setBackgroundImage(#imageLiteral(resourceName: "Gal"), for: .normal)
            break
            
        default:
            print("Error->Show_Home")
            break
        }
        
    }
    
    
    func NavControlFunction(_ Place : String){
        if Place != "Home"{
            switch Place{
            case "Favs":
                let FavsViewSB : UIStoryboard = UIStoryboard(name: "UIFavsDesign", bundle: nil)
                  if let FavsViewVC = FavsViewSB.instantiateViewController(withIdentifier: "FavsID")as? UIDesignFavsClass{
                    var CheckView = FavsViewSB.instantiateViewController(withIdentifier: "FavsID")as? UIDesignFavsClass
                    if CheckView != SubViewToAdd {
                        RemovingSubView()
                    }
                    SubViewToAdd = FavsViewSB.instantiateViewController(withIdentifier: "FavsID")as? UIDesignFavsClass
                  }
                NavContainer.backgroundColor = .black
                AddingSubView()
                NavContainer.isHidden = false
                SettingUITabControlls(Place)
                break
            case "Muse":
                let MuseStoryBoard : UIStoryboard = UIStoryboard(name: "MuseView", bundle: nil)
                if let MuseViewController = MuseStoryBoard.instantiateViewController(withIdentifier: "MuseMVCIdentifier")as? MuseMVC{
                    
                    var CheckView = MuseStoryBoard.instantiateViewController(withIdentifier: "MuseMVCIdentifier")as? MuseMVC
                    if CheckView != SubViewToAdd {
                        RemovingSubView()
                    }
                    
                   SubViewToAdd = MuseStoryBoard.instantiateViewController(withIdentifier: "MuseMVCIdentifier")as? MuseMVC
                    
                    
                }
                NavContainer.backgroundColor = .black
                NavContainer.isHidden = false
                AddingSubView()
                SettingUITabControlls(Place)
                break
            case "Gallery":
                let GallerySb : UIStoryboard = UIStoryboard(name: "Gallery", bundle: nil)
                if let GallerVC = GallerySb.instantiateViewController(withIdentifier: "Gallery")as? GalleryClass{
                    var CheckView = GallerySb.instantiateViewController(withIdentifier: "Gallery")as? GalleryClass
                    if CheckView != SubViewToAdd {
                        RemovingSubView()
                        
                    }
                    
                    SubViewToAdd = GallerySb.instantiateViewController(withIdentifier: "Gallery")as? GalleryClass
                }
                NavContainer.isHidden = false
                NavContainer.backgroundColor = .black
                AddingSubView()
                SettingUITabControlls(Place)
                break
                
            default:
                print("Error->Returned_Home")
                break
            }
        }else{
            RemovingSubView()
            NavContainer.isHidden = true
            SettingUITabControlls(Place)
        }
    }
    
    
    
    @IBAction func HomeFunction(_ sender : Any){
        
        var ValuePass = "Home"
        NavControlFunction(ValuePass)
        
    }
    @IBAction func FavsFunction(_ sender : Any){
        
        var ValuePass = "Favs"
        NavControlFunction(ValuePass)
        
    }
    @IBAction func MuseFunction(_ sender: Any){
        
        var ValuePass = "Muse"
        NavControlFunction(ValuePass)
        
    }
    @IBAction func GalleryFunc(_ sender: Any){
        
        var ValuePass = "Gallery"
        NavControlFunction(ValuePass)
        
    }

    var TabControllerIsVisible = false
    var TapNavOnOff : UITapGestureRecognizer = {
        let TapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TapAddRemove))
        TapGestureRecognizer.numberOfTapsRequired = 1
        print("tap working")
     return TapGestureRecognizer
    }()
    
    @objc func TapAddRemove(){
        TabControllerIsVisible = !TabControllerIsVisible
        if TabControllerIsVisible == true{
        AnimateTabControllerDownDismiss()
        }
        if TabControllerIsVisible == true{
        AnimateTabControllerUpShow()
        }
    }
    
    func AnimateTabControllerDownDismiss(){
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.5 , initialSpringVelocity: 0.7, options: .curveEaseIn , animations: {()-> Void in
            
            self.StackViewForNav.transform = CGAffineTransform(translationX: 0, y: 100)
            self.NavBackGroundImageView.transform = CGAffineTransform(translationX: 0, y: 100)
            self.Gallery.transform = CGAffineTransform(translationX: 0, y: 100)
            self.Home.transform = CGAffineTransform(translationX: 0, y: 100)
            
        }, completion: nil)
    }
    
    func AnimateTabControllerUpShow(){
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.5 , initialSpringVelocity: 0.7, options: .curveEaseIn , animations: {()-> Void in
            
            self.StackViewForNav.transform = CGAffineTransform(translationX: 0, y: 0)
            self.NavBackGroundImageView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Gallery.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Home.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }, completion: nil)
    }
    
// to be used late in the set up fo nightmode function here
/*!NightModeSingletonClass.share.NightModeBoolean
     
     /// there's only one important item in there which is the "!" to turn the night mode boolean on and off on click of this button here
    */
    
    
    
    
}//end of class brackets




//actionc call for MUSE View to move to the top of the hierarchy
// var tommy = MuseMVC/// there is a realation to the values here but it won't function ideally

// Connect a tap gesture with UI Images   ////////////   ////////////   ////////////
/*
 
 viewDidLoad{
   connectionValuesToTapGestureRecognizer()
 }
 FOR LEARNING PURPOSES
func connectionValuesToTapGestureRecognizer(){
    ImageViewBottonBottomTwo.addGestureRecognizer(ButtomOneButton)
}


 lazy var ButtomTwoButton : UITapGestureRecognizer = {
 let BottomTwo = UITapGestureRecognizer(target: self, action: #selector(ButtomTwoCallToDisplayNavControl))
 BottomTwo.numberOfTapsRequired = 1
 
 return BottomTwo
 }()
 */
