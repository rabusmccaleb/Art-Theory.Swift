//
//  GalleryClass.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 12/18/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit

class GalleryClass : UIViewController{
    @IBOutlet weak var BackButton : UIButton!
    @IBOutlet weak var LogoImage : UIImageView!
    @IBOutlet weak var PlayPauseButton : UIButton!
    @IBOutlet weak var ShowMuseControlButton : UIButton!
    @IBOutlet weak var FavsButton : UIButton!
    @IBOutlet weak var Immaggine : UIImageView!
    @IBOutlet weak var Progresso : UIProgressView!
    @IBOutlet weak var ShowFavs : UIButton!
    @IBOutlet weak var SlideButton : UIButton!
    @IBOutlet weak var ShiftButton : UIButton!
    @IBOutlet weak var BackGroundImmagine : UIImageView!
    @IBOutlet weak var BackGroundFrostedView: UIView!

    var ImageBundleArray = ImageSingleton.share.ImageDictionaryBundleReturn()/// image dictionary object pulled here
    
    
    override func viewWillAppear(_ animated: Bool) {
        PlayPauseButton.isHidden = true
        SlideButton.isHidden = true
        ShowMuseControlButton.isHidden = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        SetUserDefaults()
        SetFavDefaults()
        MuseTimerChecker()
        ProgressoFunc()
        //presenting images for the first image view value
        print(GalleryCounter)
        CompareForFav()
        var GalleryBundle : String?
        var GalleryValue = 0
        print(GalleryCounter)
        if GalleryCounter < ImageBundleArray.count{
        for(Value, Bundle) in ImageBundleArray[GalleryCounter]{
            GalleryBundle = Bundle
        }
        }else{// stops the view from exceeding it's limit... to insure there is no error thrown
           GalleryCounter = ImageBundleArray.count - 1
        NewGalleryDefaultsValue(GalleryViewLocatoin: GalleryCounter)// for storing most recent view value to default... under the condition that the user doesn't update it their selvs...to alow for easy transition
            for(Value, Bundle) in ImageBundleArray[GalleryCounter]{
                GalleryBundle = Bundle
            }
        }
        Immaggine.image = GalleryImageResize(ImaggineSourceFile: GalleryBundle)// to insure which ever image stopped at the view stays at that image
        self.view.backgroundColor = StateFavsSingletonClass.share.GalleryMainContentBackGroundColor
        self.view.layer.cornerRadius = 15.0
        self.view.clipsToBounds = true
        
        LogoImage.image = #imageLiteral(resourceName: "MarkMaryArtGalleryLogo")
        ShiftButton.setBackgroundImage(#imageLiteral(resourceName: "MarkMaryGalleryShuffle"), for: .normal)
        
        
        
        Progresso.trackTintColor = StateFavsSingletonClass.share.ProgressoUnfilledSection
        Progresso.progressTintColor = StateFavsSingletonClass.share.ProgressoProgressColor
        Progresso.tintColor = StateFavsSingletonClass.share.progressoProgressFillsection
        Progresso.transform = Progresso.transform.scaledBy(x: 1.0 , y: 1.0)
        Progresso.layer.cornerRadius = 10.0/// rounding out the corner of the animation layer's radius
        Progresso.clipsToBounds = true
        Progresso.layer.sublayers![1].cornerRadius = 10.0
        Progresso.subviews[1].clipsToBounds = true
        SettingUIForSlide()
        
        HeartBooleanChecker()
        SetBackground()

    }
    
    func SettingUIForSlide(){
        if SlideTimer?.isValid == true{
            BackButton.setBackgroundImage(#imageLiteral(resourceName: "MarkMaryAutoPlayIndicatorUIButton"), for: .normal)
        }else{
            BackButton.setBackgroundImage(#imageLiteral(resourceName: "MarkMaryControlMainContentPausePlay"), for: .normal)
        }
        
    }
    
    func SetBackground(){
         BackGroundImmagine.image = Immaggine.image
        if #available(iOS 13.0, *) {
            let UIFrostedView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterialDark))
            BackGroundFrostedView.addSubview(UIFrostedView)
            UIFrostedView.frame = BackGroundFrostedView.bounds
        } else {
            // Fallback on earlier versions
            let UIFrostedView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
            BackGroundFrostedView.addSubview(UIFrostedView)
            UIFrostedView.frame = BackGroundFrostedView.bounds
        }
         
         
     }
    
    
    @IBAction func DismissView(_ Sender : Any){
        /// all the slide functionality is now  here
        SlideActive = !SlideActive
        if SlideActive == false{
            SlideTimer?.invalidate()
            
            var GalleryBundle : String?
            var GalleryValue = 0
            for(Value, Bundle) in ImageBundleArray[GalleryCounter]{
                GalleryBundle = Bundle
            }
            
            Immaggine.image = GalleryImageResize(ImaggineSourceFile: GalleryBundle)// to insure which ever image stopped at the view stays at that image
        }else{
            SlideTimer = Timer.scheduledTimer(timeInterval: GalleryDurration, target: self, selector: #selector(SlideShowTimer), userInfo: nil, repeats: true)
        }
        
        SettingUIForSlide()
    }
    
    func RemoveAllDirtyMemory(){
        var ClearMemoryTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(RemoveAllDirtMemoryTrigger), userInfo: nil, repeats: false)
    }
    
    @objc func RemoveAllDirtMemoryTrigger(){
        // setting all dirty memory values to empty
        self.Immaggine.image = nil
        self.LogoImage.image = nil
        self.BackButton.setBackgroundImage(nil, for: .normal)
        self.FavsButton.setBackgroundImage(nil, for: .normal)
        self.PlayPauseButton.setBackgroundImage(nil, for: .normal)
        self.ShowMuseControlButton.setBackgroundImage(nil, for: .normal)
        self.ShiftButton.setBackgroundImage(nil, for: .normal)
        self.SlideButton.setBackgroundImage(nil, for: .normal)
        //all assets are empty when dismised and reset when ready for use
        
    }
    
    
    @IBAction func ShowFavsCollection(_ sender : Any){
        let FavsCollectionSB : UIStoryboard = UIStoryboard(name: "GalleryCollectionView", bundle: nil)
        if let FavCollectionVC = FavsCollectionSB.instantiateViewController(withIdentifier: "Gallery")as? GalleryClass{
            self.present(FavCollectionVC, animated: true, completion: nil)
            
        }
    }
    @IBAction func DisplayMuseControl(_ sender : Any){
        let MuseControlSB : UIStoryboard = UIStoryboard(name: "MuseView", bundle: nil)
        if let MuseControlVC = MuseControlSB.instantiateViewController(withIdentifier: "MuseMVCIdentifier")as? MuseMVC{
            self.present(MuseControlVC, animated: true, completion: nil)
        }
    }
    
    
    ///// MUSE CONTROL FUNCTIONALITY:
    ///// MUSE CONTROL FUNCTIONALITY:
    ///// MUSE CONTROL FUNCTIONALITY:
    var MuseTimer : Timer?
    func MuseTimerChecker(){
        MuseTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(MuseButtonSetter), userInfo: nil, repeats: true)
        
    }
    
    @objc func MuseButtonSetter(){
        MuseChecker()
    }
    
    
    func MuseChecker(){
        if MuseSingleton.share.song.isPlaying == true{
         // pause image here
            PlayPauseButton.setBackgroundImage(#imageLiteral(resourceName: "BlackPauseUIImage"), for: .normal)
        }else{
            // play image here
            PlayPauseButton.setBackgroundImage(#imageLiteral(resourceName: "BlackPLayButton"), for: .normal)
        }
    }
    
    @IBAction func PlayPause(_ Sender: Any){
        MuseSingleton.share.singletonPlyPause()
        MuseChecker()
    }
    
    
    /// progress view:
    /// progress view:
    /// progress view:
    func ProgressoFunc(){
        var ProgressMax : Float = Float(ImageBundleArray.count - 1)
        var ProgressCounter : Float = Float(GalleryCounter)
        var ProgressoRatio : Float = Float( ProgressCounter / ProgressMax)
        Progresso.progress = ProgressoRatio
        Progresso.setProgress(ProgressoRatio, animated: true)
    }
    // GALLERY CONTROL FUNCTIONALITY:
    // GALLERY CONTROL FUNCTIONALITY:
    // GALLERY CONTROL FUNCTIONALITY:
    var GalleryDefaults = UserDefaults.standard
    let GalleryKey = "GalleryKey"
    var GalleryCounter : Int = 0
    func SetUserDefaults(){
        
        var GalleryCheckInt = GalleryDefaults.object(forKey: GalleryKey)as? Int
        if GalleryCheckInt != nil{
            if  GalleryCheckInt! > 0{
                GalleryCounter = GalleryCheckInt!
            }
        }else {
            GalleryDefaults.set(GalleryCounter, forKey: GalleryKey)
        }// checks to see if any values are stored in this method otherwise it skips over it and the gallery counter value is defaulted to zero showing the first image in the gallery
    }
    func NewGalleryDefaultsValue(GalleryViewLocatoin GalleryInt: Int){
        GalleryDefaults.set(GalleryInt, forKey: GalleryKey)as? Int
    }
    func GalleryUpDater(){
        if GalleryCounter < ImageBundleReturn().count - 1{
            GalleryCounter = GalleryCounter + 1
        }else{
            GalleryCounter = ImageBundleArray.count - 1
        }
    }
    func GalleryDownDater(){
        if GalleryCounter > 0 {
            GalleryCounter = GalleryCounter - 1
        }else{
           GalleryCounter = 0
        }
    }
    func ImageBundleReturn()->[[Int : String?]]{
        return ImageBundleArray
    }
    func next(){
        GalleryUpDater()
        NewGalleryDefaultsValue(GalleryViewLocatoin: GalleryCounter)
        var GalleryBundle : String?
        var GalleryValue = 0
        for(Value, Bundle) in ImageBundleReturn()[GalleryCounter]{
            GalleryBundle = Bundle
        }
        Immaggine.image = GalleryImageResize(ImaggineSourceFile: GalleryBundle)
        ProgressoFunc()// updates the progress view
        CompareForFav()/// for comparing vales for heart checker
        NewGalleryDefaultsValue(GalleryViewLocatoin: GalleryCounter)// for storing most recent view value to default
        BackGroundImmagine.image = Immaggine.image
        
        if GalleryCounter == 3 {
            Animation2()
        }
    }
    func Previous(){
        GalleryDownDater()
        NewGalleryDefaultsValue(GalleryViewLocatoin: GalleryCounter)//to store the value of the galleryLocation
        var GalleryBundle : String?
        var GalleryValue = 0
        for(Value, Bundle) in ImageBundleReturn()[GalleryCounter]{
            GalleryBundle = Bundle
        }
        Immaggine.image = GalleryImageResize(ImaggineSourceFile: GalleryBundle)
        ProgressoFunc()/// updates the progress view
        CompareForFav()
        NewGalleryDefaultsValue(GalleryViewLocatoin: GalleryCounter)
        BackGroundImmagine.image = Immaggine.image
    }
    var ShiftBoolean : Bool = false
    var BundleContainerArray = [[Int : String?]]()
    @IBAction func ShiftGalleryValues(){
        ShiftBoolean = !ShiftBoolean
        if ShiftBoolean == true{
         BundleContainerArray = ImageBundleArray
        ImageBundleArray.shuffle()
        ImageBundleReturn()/// updates the array in memory
        }else{
            ImageBundleArray = BundleContainerArray
            BundleContainerArray = [[1:""]]// just emptied the array data was transfered to the  BundleImage array
            ImageBundleReturn()/// updates the array in memory
        }
    }
    
    
    
    
    
    
    
    
    
    
    /// animation check to see how it looks
    /// stated that if the location in the image array equals three then call this animation
    func Animation2(){

            
        self.Immaggine.transform = CGAffineTransform(translationX: 0, y: 300)//ample amount of horizontal space to slide object accross the view.
        //viewDidLoad()
        UIView.animate(withDuration: 0.5, delay: 0.0 , usingSpringWithDamping: 1.0, initialSpringVelocity: 0.9, options: .curveLinear , animations: {()-> Void in
            
             self.Immaggine.transform = CGAffineTransform(translationX: 0, y: 0)/// the object is slid smoothly or speedingly across the screen
             
         }, completion: nil)
        
        
        
           }// end of animation 2 brackets
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
    
    
//    @IBAction func NextFunction(_ Sender: Any){
//        next()
//    }
//    @IBAction func BackFunction(){
//        Previous()
//    }
    
    @IBAction func NextButton(_ Sender: Any){
        next()
        
    }
    @IBAction func Previous(_ Sener: Any){
        Previous()
        
    }
    
    @IBAction func NextGestureFunction(_ Sender: Any){
        next()
    }

    @IBAction func BackGestureFunction(_ Sender: Any){
        Previous()
    }
    
    var SlideActive : Bool = false
    var SlideTimer : Timer?
    var GalleryDurration : TimeInterval = 4.3//set this as a TimeInterval variable
    @IBAction func SlideFunction(_ Sender: Any){
        // a ui botton whos functionality has been replaced with the old back button
    }
    
    @objc func SlideShowTimer(){
        next()
    }
    
    
    
    ///For top background image:
    func GalleryImageResize(ImaggineSourceFile SourceFile : String?)-> UIImage{
        let ImageResize = max(Immaggine.bounds.size.width , Immaggine.bounds.size.height)/// max size of the image to be set is here such that the image placed in the image view is the same size as the image view
        var ImageSize : CGSize = CGSize(width: Immaggine.bounds.size.width, height: Immaggine.bounds.size.height)
        let _ = Immaggine.bounds.size
        //  var ImmaggineName : String = SourceFile
        var ContainerImmage : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG") // image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        
        if let Imagefile = SourceFile{
            guard let ImageView = UIImage(contentsOfFile: Imagefile) else {
                return #imageLiteral(resourceName: "errorImage-vector-image-PnG")
            }
            
            // this is to set the image size and width to an appropriate size that gets clipped and scaled properly:
            var UnscaledImageHeight = ImageView.size.height
            var UnscaledImageWidth = ImageView.size.width
            var ImageViewHeight =  Immaggine.bounds.size.width
            var newHeight = UnscaledImageHeight * ( ImageViewHeight / UnscaledImageWidth )
            
            ImageSize = CGSize(width: ImageViewHeight , height: newHeight)
            
            
            
            let ImageRender = UIGraphicsImageRenderer(size: ImageSize)/// this is the cg size
            ContainerImmage = ImageRender.image{ _ in ImageView.draw(in : CGRect(origin: .zero , size: ImageSize))
                
                
            }// imageview closing bracket
        }//image file closing bracket
        
        return ContainerImmage
    }
    
    
    ///Favs Architecture and Functionality:
    ///Favs Architecture and Functionality:
    ///Favs Architecture and Functionality:
    ///Favs Architecture and Functionality:
    var GalleryHeartBoolean : Bool = false
    func HeartBooleanChecker(){
        if GalleryHeartBoolean == true{
            FavsButton.setBackgroundImage(#imageLiteral(resourceName: "MarkMaryFullHeart"), for: .normal)
        }
        if GalleryHeartBoolean == false{
            FavsButton.setBackgroundImage(#imageLiteral(resourceName: "MarkMaryEmptyHeart"), for: .normal)
        }
    }
    
 
    
    @IBAction func FavContol(_ sender: Any){
        if GalleryHeartBoolean == false{
            AppendFavData()
            GalleryCounter = GalleryCounter + 0
            CompareForFav()
            SaveNewData()
            print(FavedArray) // is printing th e faved array value
            
        }else{
            RemoveFavsData()
            GalleryCounter = GalleryCounter + 0
            CompareForFav()
            SaveNewData()
            print(FavedArray) // is printing th e faved array value
        }
    }
    
    @IBAction func DoubleClickFavControl(_ sender: Any){
        if GalleryHeartBoolean == false{
            AppendFavData()
            GalleryCounter = GalleryCounter + 0
            CompareForFav()
            SaveNewData()
            print(FavedArray) // is printing th e faved array value
            
        }else{
            RemoveFavsData()
            GalleryCounter = GalleryCounter + 0
            CompareForFav()
            SaveNewData()
            print(FavedArray) // is printing th e faved array value
        }
    }
    
    var FavStorage = UserDefaults.standard
    var FavKey : String = "FavStorage"
    var FavedArray = [Int]()
    func SetFavDefaults(){
        if FavStorage.object(forKey: FavKey)as? [Int] == nil{
            FavStorage.set(FavedArray, forKey: FavKey) as? [Int]
        }else{
            FavedArray = FavStorage.object(forKey: FavKey)as! [Int]
        }///so this method checks if there exists an array anf if there does there does then it sets the stored values to the array that will be actually in use
    }
    func SaveNewData(){
       FavStorage.set(FavedArray, forKey: FavKey)as? [Int]/// takes the new data and saves it to user defaults an array onject ready for comparison
    }
    
    func AppendFavData(){
        FavedArray.append(GalleryCounter)
    }
    
    var FavValueFound : Bool = false
    func CompareForFav(){// with this object opperating on 100% the object sets it's self up for good storage
        if FavedArray.isEmpty == false {// if there actully is somethihng in this array then run the code
          print("Running past empty array check")
            
            for x in 0...FavedArray.count - 1{// check through the length of the array
                if FavValueFound == false{/// if there wasn'tt a value found then run the code
                if GalleryCounter == FavedArray[x]{/// if the gallery counter is equal to the data stored in ther array then
                    GalleryHeartBoolean = true
                    HeartBooleanChecker()
                   // FavsButton.setBackgroundImage(#imageLiteral(resourceName: "MarkMaryFullHeart"), for: .normal)// set the background image to checked heart
                    FavValueFound = true
                }else{
                    print("Checked if array was empty")
                    GalleryHeartBoolean = false
                    HeartBooleanChecker()
                   // FavsButton.setBackgroundImage( #imageLiteral(resourceName: "MarkMaryEmptyHeart"), for: .normal)
                    }// end of else statement brackets
                }//end of value found brackets
            }// end of for loop brackets
        }
        
        if FavedArray.isEmpty == true{// object exist outside of the brackets
            print("FavArray was empty: So no check Happened")
            GalleryHeartBoolean = false// if the array is empty then set the galleryHeartBoolean to false
            HeartBooleanChecker()// show that in the ui
        }
        
        FavValueFound = false
    }// end of compare for fav method
    
    
    func RemoveFavsData(){
        var locationInArrayToRemove : Int?
        
        if FavedArray.isEmpty == false{
        for x in 0...FavedArray.count - 1{
            if GalleryCounter == FavedArray[x]{
                locationInArrayToRemove = x
                }
            }
        }
        if locationInArrayToRemove != nil{
            FavedArray.remove(at: locationInArrayToRemove!)/// exist outside of the for loop such that it doesn't cause index errors
        }
    }

    
}//end of class brackets

































/*
 // original CompareForFavMethod:
 func CompareForFav(CVV CurrentViewValue : Int){
 if FavedArray.isEmpty == false{
 var FavBooleanChecker : Bool = false
 for x in 0...FavedArray.count - 1{
 if CurrentViewValue == FavedArray[x]{
 GalleryHeartBoolean = true
 FavBooleanChecker = true
 }
 if CurrentViewValue != FavedArray[x] && FavBooleanChecker == false{
 GalleryHeartBoolean = false
 }
 }
 HeartBooleanChecker()
 }
 }
 */
