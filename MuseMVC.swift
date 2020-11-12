//
//  MuseMVC.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 9/2/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//
import Foundation

import UIKit

import AVFoundation
import AVKit/// importing now for vid.
import ImageIO//



class MuseMVC: UIViewController {
    
    @IBOutlet weak var CurrentSongDurrartion: UILabel!

    @IBOutlet weak var VideoView: UIView!
    
    @IBOutlet weak var BacKColorView: UIView!
    
    @IBOutlet weak var NationalLayoutImaggine: UIImageView!/// National like national gerographic
    
    @IBOutlet var MuseMainView: UIView!
    
    @IBOutlet weak var FrostedMuseView: UIView!
    
    @IBOutlet weak var DurUILable: UILabel!
    var seeWhatValueScanPrint = "This String Non-Optional Prints"
    @IBOutlet weak var Songtitle: UILabel!
    @IBOutlet weak var MusicSlider: UISlider!
    @IBOutlet weak var DoubleTapBackButton: UIButton!
    @IBOutlet weak var ReplayButton: UIButton!
    @IBOutlet weak var ShuffleButton: UIButton!
    

    @IBOutlet weak var ShowPlayListTableImage: UIImageView!
    @IBOutlet weak var MuseBarImage: UIImageView!
    
    @IBOutlet weak var PlayPauseUIImage: UIButton!
    
    @IBOutlet weak var MarkMaryTopLogo: UIImageView!
    @IBOutlet weak var OddShapesImages: UIImageView!
    
    var ImageStringArray = [String?]()
    /////////////////////////////////////////
    ///////////////////////////////////////
    //////////////////////////////////////
    ////////////////////////////////////
    //WHERE ALL OF AUDIO IS BE PLACED:
    //--------------------------------------

// ViewDidLoad Function
// ViewDidLoad Function
// ViewDidLoad Function
    
    override func viewWillAppear(_ animated: Bool) {
     /// can't code that edits property put it here because the varibles that relates to the interface builder aren't avaible
             //VideoGrabAndStore()// doing away with the video as back ground for now Until it can be propperly placed..
        //BackGroundImageSetter()

    }
    
    override func viewDidAppear(_ animated: Bool) {
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //VideoGrabAndStore()// doing away with the video as back ground for now Until it can be propperly placed..
        //museViewBackTimer()// doing away with the muse background fluctuation for now. It doesn't work well for the asethetic.
        
        ReplayButton.setBackgroundImage(MuseSingleton.share.ReplayImage, for: .normal)
        
       // BackGroundImageSetter()
        //OddShapeArray.shuffle()
      //  UIImageBackGroundTimer()
       // OddShapesImages.image = OddShapeArray[OddShapeCounter]

        MarkMaryTopLogo.image = #imageLiteral(resourceName: "MarkMaryLogoControlTopContent") // Should functionaly fill the same way it would on the story board set
        //NationalLayoutImaggine.image = BackGroundImageArray[0]
        ShuffleChecker()/// responsible for the ui image shuffle active change
        
   
        
        self.MuseMainView.layer.cornerRadius = 25.0
        self.MuseMainView.clipsToBounds = true
        
        
        let VibrancyViewMuse : UIVibrancyEffect = UIVibrancyEffect(blurEffect: UIBlurEffect(style: .dark))
        let FrostedWindowMuse : UIBlurEffect = UIBlurEffect(style: .dark)
        let frostedMuse = UIVisualEffectView(effect: FrostedWindowMuse)
       // FrostedMuseView.addSubview(frostedMuse)
       // frostedMuse.frame = FrostedMuseView.bounds
        FrostedMuseView.layer.cornerRadius = 18.0
        FrostedMuseView.clipsToBounds = true
        // Do any additional setup after loading the view.
       // let doubleTapGesture = UITapGestureRecognizer(target: self , selector: #selector())
        
 
        
        
        
        var ColorOfTrack : UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5467649648)
        var ColroTrackBar : UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8989876761)
        MusicSlider.minimumTrackTintColor = ColroTrackBar
        MusicSlider.maximumTrackTintColor = ColorOfTrack
        MusicSlider.tintColor = ColroTrackBar
        
        
        displayTitoloTimer()


        
        
        DoubleTapBackButton.addGestureRecognizer(DoubleTapBack)
        MuseSingleton.share.SliderTimeForEachMuseFunciton(SliderHere: MusicSlider)
        TimerForSliderSongUpdate()
       
        Songtitle.text! = MuseSingleton.share.DisplayTitolo()
        //TimeTitolo
        CurrentSongDurrartion.text! = MuseSingleton.share.DisplayTimeCurr()
       // museViewBackTimer()
        //ArtistaTitolo
        //VideoGrabAndStore()
   
        
        ImageSingleton.share.ReturnImageString()
        ImageStringArray = ImageSingleton.share.ImageString
        ImageStringArray.shuffle()
        NationalLayoutImaggine.image = ResizeImage(ImaggineSourceFile: ImageStringArray[0])
        UIImageBackGroundTimer()
        
        MuseSingleton.share.QueAddAllAudio()// Places all the Items in a que
        checkIfPlayOrPaused()
    }
    
    func MusePlayChecker(){
        if MuseSingleton.share.song.isPlaying == false {
        //UIIMage here pause UI Image here
        PlayPauseUIImage.setImage(#imageLiteral(resourceName: "MarkMaryPauseIcon"), for: .normal) //imageView!.image = pauseImage
        }else{
        //UIIMage here pause UIIMage here
        PlayPauseUIImage.setImage(#imageLiteral(resourceName: "MarkMaryPlayIcon"), for: .normal)
        }
    }
    
    //BackVideoFoundation:
    //BackVideoFoundation:
    //BackVideoFoundation:
    //BackVideoFoundation:
    
    var VideoViewValue : Int = 10
    
    func VidViewValueUpdater (){
        VideoViewValue = VideoViewValue + 1
    }

    func VideoBundleArrayReturn()->[String?]{
        let v0 =  Bundle.main.path(forResource: "BombFromBelowMarkMary", ofType: "mp4", inDirectory: "MarkMaryVidMp4")
        var v1 =  Bundle.main.path(forResource: "BombMarkMary", ofType: "mov", inDirectory: "MarkMaryVid")
        var v2 =  Bundle.main.path(forResource: "BrokenBridgePunMarkMary", ofType: "mov", inDirectory: "MarkMaryVid")
        var v3 =  Bundle.main.path(forResource: "DeceptiveSmirkMarkMary", ofType: "mov", inDirectory: "MarkMaryVid")
        var v4 =  Bundle.main.path(forResource: "GreatNewYorkMarkMary", ofType: "mov", inDirectory: "MarkMaryVid")
        var v5 =  Bundle.main.path(forResource: "MarkMaryMotorCoaster", ofType: "mov", inDirectory: "MarkMaryVid")
        var v6 =  Bundle.main.path(forResource: "MobileMarkMary", ofType: "mov", inDirectory: "MarkMaryVid")
        var v7 =  Bundle.main.path(forResource: "PhatomOfMarkMary", ofType: "mov", inDirectory: "MarkMaryVid")
        var v8 =  Bundle.main.path(forResource: "Plane-lyMarkMary", ofType: "mov", inDirectory: "MarkMaryVid")
        var v9 =  Bundle.main.path(forResource: "ReWritingHistoryMarkMary", ofType: "mov", inDirectory: "MarkMaryVid")
        var v10 =  Bundle.main.path(forResource: "SeductionMarkMary", ofType: "mov", inDirectory: "MarkMaryVid")
        var v11 =  Bundle.main.path(forResource: "ShootingMarkMary", ofType: "mov", inDirectory: "MarkMaryVid")
        var v12 =  Bundle.main.path(forResource: "TrainAndCarMeetMarkMary", ofType: "mp4", inDirectory: "MarkMaryVidMp4")
        
        let VidReturnArray = [v0 , v1 , v2 , v3 , v4 , v5 , v6 , v7 , v8 , v9 , v10 , v11 , v12]
        return VidReturnArray
    }
    
    func VideoReturnUrl()->String{
        var InstanceOfVidArray = VideoBundleArrayReturn()
        InstanceOfVidArray.shuffle()
        var VideoString : String = ""//InstanceOfVidArray[VideoViewValue]!
        return VideoString
    }
    
    
    
    
    func VideoGrabAndStore(){
        
        var MuseVidUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "Brunette_2_512kb", ofType: "mp4")!)
        
        
        var Video = AVPlayer(url: MuseVidUrl)
        
        
        var VideoLayer = AVPlayerLayer(player: Video)
        
        VideoLayer.frame = self.VideoView.frame
        
        self.VideoView.layer.addSublayer(VideoLayer)
        
        VideoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        Video.volume = Float(0.0)// muting this
        Video.play()
    }
    
    /// UIImageArrayBackGroundChanger:
    /// UIImageArrayBackGroundChanger:
    var OddShapeArray = [UIImage]()
    var OddShapeCounter = 0
    var BackGroundImageArray = [UIImage]()
    var BackGroundImageCounter = 0
   // var ImageAfterBottomCode : UIImage?
    
    
    func ResizeImage(ImaggineSourceFile SourceFile : String?)-> UIImage{
        let ImageResize = max(NationalLayoutImaggine.bounds.size.width , NationalLayoutImaggine.bounds.size.height)/// max size of the image to be set is here such that the image placed in the image view is the same size as the image view
        var ImageSize : CGSize = CGSize(width: NationalLayoutImaggine.bounds.size.width, height: NationalLayoutImaggine.bounds.size.height)
        let _ = NationalLayoutImaggine.bounds.size
        // var ImmaggineName : String = SourceFile
        var ContainerImmage : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG") // image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
    
        if let Imagefile = SourceFile{
            guard let ImageView = UIImage(contentsOfFile: Imagefile) else{
                return #imageLiteral(resourceName: "errorImage-vector-image-PnG")// image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
            }
            
            
            // this is to set the image size and width to an appropriate size that gets clipped and scaled properly:
            var UnscaledImageHeight = ImageView.size.height
            var UnscaledImageWidth = ImageView.size.width
            var ImageViewHeight =  NationalLayoutImaggine.bounds.size.width
            var newHeight = UnscaledImageHeight * ( ImageViewHeight / UnscaledImageWidth )
            
            ImageSize = CGSize(width: ImageViewHeight , height: newHeight)
            
            
            
            let ImageRender = UIGraphicsImageRenderer(size: ImageSize)/// this is the cg size
            ContainerImmage = ImageRender.image{ _ in ImageView.draw(in : CGRect(origin: .zero , size: ImageSize))
                
            }
        }
        
        return ContainerImmage/// this image has a default set to error displaying uiimage becuase it unless changed by the fact that there is an actual uiimage passed into the container image to be displayed
    }
    
    
    
    
    func UIImageBackgroundUpDater(){
        if BackGroundImageCounter < ImageStringArray.count{
            BackGroundImageCounter = BackGroundImageCounter + 1
        }
        if BackGroundImageCounter >= ImageStringArray.count{
            BackGroundImageArray.shuffle()
            BackGroundImageCounter = 0
        }
    }
    

    
    
    var BackGroundTimer : Timer?
    func UIImageBackGroundTimer(){
        BackGroundTimer = Timer.scheduledTimer(timeInterval: 3.0 , target: self, selector: #selector(UIImageBackgroundChanger), userInfo: nil, repeats: true)
    }
    @objc func UIImageBackgroundChanger(){
        UIImageBackgroundUpDater()
        NationalLayoutImaggine.image = ResizeImage(ImaggineSourceFile: ImageStringArray[BackGroundImageCounter])
    }
    
    //BackVideoFoundation End:
    //BackVideoFoundation End:
    //BackVideoFoundation End:
    //BackVideoFoundation End:
    
    var MuseBackCounter : Int = 0
    func MuseBackUpdater(){
        if MuseBackCounter >= (StateFavsSingletonClass.share.UIColorArray.count)-1 {
            MuseBackCounter = 0
        }else {
            MuseBackCounter = MuseBackCounter + 1
        }
    }
    
    
    ////// logic can and should be used in all other classes
    func displayTitoloTimer(){
        var LableTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(DisplayAllUILables), userInfo: nil, repeats: true)
    }
    @objc func DisplayAllUILables(){
        // all threee lables here:
         MusicSlider.maximumValue = Float(MuseSingleton.share.song.duration)
        //SongTitolo
        if let MusicTitle = MuseSingleton.share.MusicQuePlayer.currentItem?.getTitle(){
           Songtitle.text! = MuseSingleton.share.MusicQuePlayer.currentItem!.getTitle()!
           }
        //TimeTitolo
        CurrentSongDurrartion.text! = MuseSingleton.share.DisplayTimeCurr()
        DurUILable.text! = MuseSingleton.share.DisplayTimeDurr()
        // Check if playiing
       checkIfPlayOrPaused()
        //ArtistaTitolo
        
    }
    
    //double tap function and logic
    //double tap function and logic
    //double tap function and logic
    //double tap function and logic
    lazy var DoubleTapBack : UITapGestureRecognizer = {
        let DoubleTap = UITapGestureRecognizer(target: self, action: #selector(AfterDoubleTapSkipBack))
        DoubleTap.numberOfTapsRequired = 2
       
        return DoubleTap
        
    }()
    @objc func AfterDoubleTapSkipBack(){
        MuseSingleton.share.QuePrevious()
    }

    ///////end of basic call functions 
    ///////end of basic call functions
    ///////end of basic call functions
    
    //////////////////////////////////
    //////////////////////////////////
    // BEGINING OF BUTTON FUNCTIONS
    // BEGINING OF BUTTON FUNCTIONS
    // BEGINING OF BUTTON FUNCTIONS
    //////////////////////////////////
    //////////////////////////////////
 
    
//shuffle
//shuffle
    
func ShuffleChecker(){
        if MuseSingleton.share.ShuffleBoolean == true{
            ShuffleButton.setBackgroundImage(#imageLiteral(resourceName: "ShuffleActive"), for: .normal)
        }else{
            ShuffleButton.setBackgroundImage(#imageLiteral(resourceName: "ShuffleInactive"), for: .normal)
        }
    }
    
var shuffleValue = false
    @IBAction func shuffle(_ sender: Any) {
        MuseSingleton.share.ShuffleBoolean = !MuseSingleton.share.ShuffleBoolean
      // MuseSingleton.share.singletonShuffle()
            //image shuffle active image
        ShuffleChecker()
        MuseSingleton.share.ShuffleAudioQue()
        
    }
//Play and Pause
//Play and Pause
    var StoreStatus : Double?
    var CheckStatus : Double?
    var isPlaying : Bool?
    
    
    
    func checkIfPlayOrPaused(){
        MuseSingleton.share.QueIsPlaying()
         CheckIfPlaying()
    }
    
    func CheckIfPlaying(){
        if MuseSingleton.share.isPlaying == false{
            let playImage : UIImage = #imageLiteral(resourceName: "MarkMaryPlayIcon")
            PlayPauseUIImage.setImage(playImage, for: .normal)
        }else{
            let pauseImage : UIImage = #imageLiteral(resourceName: "MarkMaryPauseIcon")
            PlayPauseUIImage.setImage(pauseImage, for: .normal) //imageView!.image = pauseImage
        }
    }

    
    func TimeCheckDelay(){
        var TimeDelay = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(IsPlaying), userInfo: nil, repeats: false)
    }
    
    @objc func IsPlaying(){
        
    }
    
    func CheckIfPaused(){
        if CheckStatus != nil && StoreStatus != nil {
            if CheckStatus == StoreStatus{
                isPlaying = false//if the storestaus is equal to the value passed then the que is playing
            }else{
                isPlaying = true//if StoreStatus the current is not equal to the value passed then the thing is playing
            }
        }
    }
    

    @IBAction func PlyPause(_ sender: Any) {
        var NeverTrue = false
        if NeverTrue == true{
        MuseSingleton.share.singletonPlyPause()
        MuseSingleton.share.SliderTimeForEachMuseFunciton(SliderHere: MusicSlider)

        
        if MuseSingleton.share.song.isPlaying == true {
            //UIIMage here pause UI Image here
            let pauseImage : UIImage = #imageLiteral(resourceName: "MarkMaryPauseIcon")
            PlayPauseUIImage.setImage(pauseImage, for: .normal) //imageView!.image = pauseImage
        }else{
            //UIIMage here pause UIIMage here
            let playImage : UIImage = #imageLiteral(resourceName: "MarkMaryPlayIcon")
            PlayPauseUIImage.setImage(playImage, for: .normal)
        }
        }
        
        if MuseSingleton.share.isPlaying == false{
            MuseSingleton.share.QuePlay()
        }else{
            MuseSingleton.share.QuePause()
        }
        checkIfPlayOrPaused()// based on rather the MusicQuePlayer is playing determine the UIObject to be displayed
       
       
        //if MuseSingleton.share.MusicQuePlayer
    }
//restart and Skip back
//restart and Skip back
    @IBAction func RestartSkipBack(_ sender: Any) {
        var NeverTrue = false
        if NeverTrue == true {
        MuseSingleton.share.singletonRestartSkipBack()
        MuseSingleton.share.SliderTimeForEachMuseFunciton(SliderHere: MusicSlider)
        MusePlayChecker()
        }
        
        if MuseSingleton.share.MusicQuePlayer.currentTime < Double(2.0){
             MuseSingleton.share.QuePrevious()//if the song playing is greater than 2 seconds long restart from the begining
        }else{
            MuseSingleton.share.QueRestart()// if the que is greater than 2 seconds go to the prvious
        }//end of if else statement brackets for the MusicQueLogic
    }
///Skip/Next LOL
///Skip/Next LOL
///Skip/Next LOL
    @IBAction func SkipFastforward(_ sender: Any) {
        var NeverTrue = false
        if NeverTrue == true {
    MuseSingleton.share.singletonSkipFastforward()
    MuseSingleton.share.SliderTimeForEachMuseFunciton(SliderHere: MusicSlider)
    MusePlayChecker()
        }/// Never true
            MuseSingleton.share.QueNext()//only one action should be performed with this function
    }
//replay
//replay
//replay
    @IBAction func Replay(_ sender: Any) {
        MuseSingleton.share.QueReplay()
    ReplayButton.setBackgroundImage(MuseSingleton.share.ReplayImage, for: .normal)
    }
    
/// display playlist
/// display playlist
    @IBAction func ShowPlayList(_ sender: Any) {
        let PlayListStoryBoard : UIStoryboard = UIStoryboard(name: "PlaylistView", bundle: nil)
        if let PlayListViewController : UIViewController = PlayListStoryBoard.instantiateViewController(withIdentifier: "PlaylistID")as? PlayListView{
            self.present(PlayListViewController, animated: true, completion: nil)
        }
    }
/// Dismiss this view from the view hierarchy
/// Dismis this view from the view hierarchy
    @IBAction func PresentMainViewControllerFunc(_ sender: Any) {
       // BackGroundTimer!.invalidate()
        dismiss(animated: true, completion: nil)
        RemoveImageFromMemory()/// timer function trigered to clear image and timer out of memory and runtime loop
        
    }
    

    @IBAction func DisplayMuseList(_ sender : Any){
        let ListViewSB : UIStoryboard = UIStoryboard(name: "PlaylistView", bundle: nil)
        if let ListViewVC : UIViewController = ListViewSB.instantiateViewController(withIdentifier: "PlaylistID")as? PlayListView{
            self.present(ListViewVC, animated: true, completion: nil)
        }
        
        //if BackGroundTimer != nil{
            BackGroundTimer?.invalidate()
       // }/// this is to invalidate timer such that there is less stain on central proccesing power. With two timers set for the same interval performing highorder functions in succession is causng a spike in cpu power...
    }
    
    @IBAction func MusicSliderUpdate(_ sender: Any) {
        var NeverTrue = false
        if NeverTrue == true{
        MuseSingleton.share.SliderTimeForEachMuseFunciton(SliderHere: MusicSlider)
        MuseSingleton.share.singletonMusicSliderUpdate(SliderHere: MusicSlider)
        }
        
        
        MuseSingleton.share.MusicQuePlayer.pause()
        do{
            try MuseSingleton.share.MusicQuePlayer.seek(to: TimeInterval(MusicSlider.value))
                //Double(MusicSlider.value)
            //jumpToItem(atIndex: Int(MusicSlider.value), playWhenReady: false)
            
        }catch{print("Error_UpdatingSlider_Value-TO-MusicQue \(MusicSlider.value)")}
        
        MuseSingleton.share.MusicQuePlayer.play()
        TimerForSliderSongUpdate()
        
    }
    
    func TimerForSliderSongUpdate(){
        //lol just the timer called to set and update the slider value based on the songs current time
        var MusicTime = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdatingTheSliderCurrentTimeValue), userInfo: nil, repeats: true)
        
    }
    @objc func UpdatingTheSliderCurrentTimeValue(){
        var NeverTrue = false
        if NeverTrue == true {// make true or remove... apple won't let this exist
        //// sets the slider value to the current value of the song....
        MusicSlider.value = MuseSingleton.share.CurrentTimeChangerVar
        /// should send it's value to the slider by making an instance of the view controlle class but not presenting it.... that way the value can be updated even when the slider isn;t pressent
        MusePlayChecker()
      //  MusicSlider.setThumbImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
        }
        
        MusicSlider.maximumValue = Float(MuseSingleton.share.MusicQuePlayer.duration)
        MusicSlider.value = Float(MuseSingleton.share.MusicQuePlayer.currentTime)
    }
    

    @IBAction func DragDismissMuseMVC(_ sender: Any) {

    }
    
    func RemoveImageFromMemory(){
        var removeTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(RemoveObjects), userInfo: nil, repeats: false)
    }
    @objc func RemoveObjects(){
        BackGroundTimer?.invalidate()
        NationalLayoutImaggine.image = nil// set this property to nil such that the image clears out of the memory when the view is not present
    }
    
    @IBAction func SwipeRight(_ sender: Any) {
        MuseSingleton.share.Skip()
        MusePlayChecker()
    }
    
    @IBAction func SwipeLeft(_ sender: Any) {
        MuseSingleton.share.SkipBack()
        MusePlayChecker()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        RemoveImageFromMemory()/// timer function trigered to clear image and timer out of memory and runtime loop
    }
    
}



















































/*
 func MusicGrabAndStore1(){
 //https://medium.com/yay-its-erica/creating-a-music-player-app-in-swift-3-53809471f663
 //
 let m0 = Bundle.main.path(forResource: "A Rocket Man", ofType: "m4a", inDirectory:"PracticeMuse" )
 
 do{
 song = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: m0!))//key code
 song.prepareToPlay()//absolutely key
 
 let musicSession = AVAudioSession.sharedInstance()
 
 do{
 var SessionEr =  try musicSession.setCategory(AVAudioSession.Category.playback)//absolutely key
 }catch let sessionError{
 print(sessionError)
 }
 }catch let SongError{
 print(SongError)
 }
 }
 
 
 
 /// this updates the slider value every every 0.1 seconds... target self just means target view controller...selector just selects the updating function related to the value... user infor I have no idea what that meands... and repeats just means obviously you know repeats lol.
 // understanding the timer function: https://learnappmaking.com/timer-swift-how-to/
 //https://www.youtube.com/watch?v=S3BSK8UVJyc
 //timeOfSong()
 
 image change programatically
 https://stackoverflow.com/questions/26569371/how-do-you-create-a-uiimage-view-programmatically-swift
 https://stackoverflow.com/questions/26193132/swift-display-image-uiimageview
 
 
 // @objc func NumberOfTapsUpdater()-> Int{
 //   return 0
 //  }
 
 var Button : UIButton
 var Event : UIEvent
 @IBAction func RestartSkipBack(_ sender: Any,_ tapCount: UIEvent) {
 
 Button.addTarget(RestartSkipBack(Any, Event), action: #Selector(doubleTapResponse), for: <#T##UIControl.Event#>)
 
 // var NumberOfTaps = NumberOfTapsUpdater()
 
 SkipBack()
 //the three function amigos
 displaySongTitle()
 currDurration()
 autoPlay()
 
 Restart()
 
 // the three functio amigos
 
 //  NumberOfTaps = NumberOfTaps + 1
 
 //var CheckingForTaps = Timer.scheduledTimer(timeInterval: 0.4 , target: self, selector: #selector(NumberOfTapsUpdater), userInfo: nil, repeats: true)
 
 // if NumberOfTaps == 2{
 //   SkipBack()
 //  } else {
 //     Restart()
 //  }
 
 }
 
 
 Using Awake from Nib:
 /// https://developer.apple.com/documentation/objectivec/nsobject/1402907-awakefromnib   awake from nib is good and crucial for post did load fucntion calls and funcitonality... check out the link.

 
 Double Tap:
 // great understanding of how  a UIdouble tap gesture works... but as of now I'm not sure what kind of struction this constatn varible makes, is it a closer, a struct, a getter setter what is this kind of structure
 // https://www.youtube.com/watch?v=b9aPba5wT-4
 /// issue sittin infront of my face was orienctation for some reason the xcode wouldn't ever reach the return value because of the notes
 
 
 @objc func doubleTapResponse(){
 
 if tapCount == 2{
 SkipBack()
 displaySongTitle()
 currDurration()
 autoPlay()
 }
 else{
 Restart()
 displaySongTitle()
 currDurration()
 autoPlay()
 }
 }
 
 
 
 /*
 // APPLE DOCUMENTATION FOR UIIMAGES:
 /// this functio follows apple documentation but I don't enjoy the speed of the implimentation, it's memory benefits don't out weigh the opportunity cost of t the speed. Instead I'm opting for the newly built in api for rendering and resizing images as seen in the example above...I can however say it could work for loading in images from the server that are meant to be stagnant once loaded
 func BackGroundImageSetter(_ ImageStringName : String , _ ExtesionName : String)->UIImage?{
 //       // BackGroundImageArray.append(UIImage(contentsOfFile: "2016.222_print")!)
 //        var ImageStringName = "greeks-article"
 //        var ExtesionName = "jpg"
 var ImageAfterBottomCode : UIImage?
 // var DirectoryName = ""
 // if let ImageURL = Bundle.main.url(forResource: ImageStringName, withExtension: ExtesionName , subdirectory: DirectoryName
 if let imageView = self.NationalLayoutImaggine {
 let ImageBounds = NationalLayoutImaggine.bounds
 let MaxSize = max(ImageBounds.size.width, ImageBounds.size.height)
 let queue = DispatchQueue.global(qos: .utility)
 
 queue.async {
 var filterImage : UIImage? = nil
 if let ImageURL = Bundle.main.url(forResource: ImageStringName, withExtension: ExtesionName ){
 if let ImageSource = CGImageSourceCreateWithURL(ImageURL as CFURL, nil){
 let Options : [NSString : Any] = [kCGImageSourceThumbnailMaxPixelSize : MaxSize , kCGImageSourceCreateThumbnailFromImageAlways : true ]
 
 if let scaledImage = CGImageSourceCreateThumbnailAtIndex(ImageSource, 0, Options as CFDictionary){
 let image = UIImage(cgImage: scaledImage)
 ImageAfterBottomCode = image
 //self.SetImage(image: image)
 // self.NationalLayoutImaggine.image = image// can't do this without a lag
 }}}}}
 return ImageAfterBottomCode
 }
 
 func SetImage(){
 
 }
 
 
 */
 
 
 
 /// this updates the slider value every every 0.1 seconds... target self just means target view controller...selector just selects the updating function related to the value... user infor I have no idea what that meands... and repeats just means obviously you know repeats lol.
 //https://www.youtube.com/watch?v=S3BSK8UVJyc
 /*
 var currTime = Int(song.currentTime)
 var currTimeMin = 0
 var currSongDurrationMinutes = Int(song.duration)/60
 var currSongDurrationSeconds = Int(song.duration)%60
 var TimeTracker = 60
 
 if currTime < 60 {
 CurrentSongDurrartion.text = "\(currTimeMin)\(currTime)/\(currSongDurrationMinutes): \(currSongDurrationSeconds)"
 }
 else if currTime >= TimeTracker{
 TimeTracker = TimeTracker + TimeTracker
 currTimeMin = currTimeMin + 1
 var timeUpdate = currTimeMin + 1
 var newCurrentTime = currTime % (TimeTracker/timeUpdate)
 CurrentSongDurrartion.text = "\(currTimeMin)\(newCurrentTime))/\(currSongDurrationMinutes): \(currSongDurrationSeconds)"
 }else{
 CurrentSongDurrartion.text = "\(currTimeMin)\(currTime))/\(currSongDurrationMinutes): \(currSongDurrationSeconds)"}
 */
 
 */
