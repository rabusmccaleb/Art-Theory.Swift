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

class MuseMVCtWo: UIViewController {
    
    @IBOutlet weak var CurrentSongDurrartion: UILabel!//
    
    //// varibles for MuseMVC
    
    
    var seeWhatValueScanPrint = "This String Non-Optional Prints"//
    var song = AVAudioPlayer()//
    
    @IBOutlet weak var Songtitle: UILabel!//
    @IBOutlet weak var MusicSlider: UISlider!//
    @IBOutlet weak var DoubleTapBackButton: UIButton!//
    @IBOutlet weak var ReplayButton: UIButton!//
    @IBOutlet weak var PresentMainViewControllerButton: UIButton!//will use to present main view controller modually rather than reomoving it one hundred percent from the screen that way I can attempt to medigate the issue of muse view forgetting all of it's current functionallity
    
    
    // UI Image Icons var
    // UI Image Icons var
    // UI image Icons var
    // @IBOutlet weak var restartSkipBackImage: UIImageView!
    //@IBOutlet weak var playPauseImage: UIImageView!
    // @IBOutlet weak var SkipForwardImage: UIImageView!
    //
    var AudioArray = [String?]()
    var ArraySongValue = 0
    var ReplayValueForAction : Int = 0
    var ReplayBool = false
    var ReplayAllBool = false
    var pauseBool = true
    var pauseBool2ForAutoPlay = false
    var shuffleActiveQuestion:Bool = false
    var museTimeForNext : Timer? // optional timer to be trigured down below
    var MusicTime : Timer? // optional timer to be trigured down below
    lazy var MuseArraySize = MuseArray().count
    lazy var MuseDictionarySize = MuseDictionary().count// lazy wrapped the varible to allow it to be intializeed before the function below is called... when shuffle is pressed this value will be altered and replaced with it's array size count
    lazy var MusicArrayForUse = MuseDictionary()// is placed in the MuseGrabAndStore() function and will be altered bve the shuffle fucntion below such that the new shuffled array will be played rather than the old and default arr
    //
    
    lazy var CurrentSongDurration = song.duration
    lazy var CurrentSongPlayLength = song.currentTime
    
    /////////////////////////////////////////
    ///////////////////////////////////////
    //////////////////////////////////////
    ////////////////////////////////////
    //WHERE ALL OF AUDIO IS BE PLACED:
    //--------------------------------------
    
    
    func MuseDictionary()-> [[String:String?]]{
        var m0 = ["A Rocket Man": Bundle.main.path(forResource: "A Rocket Man", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m1 = ["A Tear In Paint And Time" : Bundle.main.path(forResource: "A tear in paint-and time", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m2 = ["Greek" : Bundle.main.path(forResource: "El grecco", ofType:"m4a", inDirectory: "PracticeMuse")]
        var m3 = ["Practice" :  Bundle.main.path(forResource: "for liz", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m4 = ["Emotion" : Bundle.main.path(forResource: "forLiz2", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m5 = ["Frenzy" :  Bundle.main.path(forResource: "frenzy", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m6 = ["Summer Phantasm" : Bundle.main.path(forResource: "Summer Phantasm", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m7 = ["Where" : Bundle.main.path(forResource: "Where_ - 5_3_19, 11.22 AM", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m8 = ["Dance Of Life" : Bundle.main.path(forResource: "Old Emotions", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m9 = ["Dance Of An End" : Bundle.main.path(forResource: "Old Emotions of Existence - Extended", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m10 = ["Frantic Apparition" : Bundle.main.path(forResource: "Frenetic Apparition", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m11 = ["Forgoten Fugue" : Bundle.main.path(forResource: "Forgotten Fugue", ofType: "m4a", inDirectory: "PracticeMuse"),]
        
        var ArrayOfMuseDicionaries = [m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11]
        
        return ArrayOfMuseDicionaries
    }
    func MuseTitoloGrab()->String{// logic to grab the title of AVsession object
        var TitoloString : String?
        var TitoloArray = MusicArrayForUse
        var TitoloInt = ArraySongValue
        if ArraySongValue < MuseDictionarySize{
            TitoloInt = ArraySongValue
        }else if ArraySongValue >= MuseDictionarySize{
            ArraySongValue = 0
            TitoloInt = ArraySongValue
        }else{
            ArraySongValue = ArraySongValue - ArraySongValue
            TitoloInt = ArraySongValue
        }
        var Titolo = TitoloArray[TitoloInt]
        for (key, element) in Titolo{
            TitoloString = key
        }
        if TitoloString != nil{// returns display value here
            return TitoloString!
        }else {
            return "Error-Int-Title-Display-Function"// display error here
        }
    }
    func MuseBundleGrab()->String?{
        var BundleString : String?
        var BundleArray = MusicArrayForUse
        var BundleInt = ArraySongValue
        if ArraySongValue < MuseDictionarySize{
            BundleInt = ArraySongValue
        }
        else if ArraySongValue >= MuseDictionarySize{
            ArraySongValue = 0
            BundleInt = ArraySongValue
        }
        else{
            ArraySongValue = ArraySongValue - ArraySongValue
            BundleInt = ArraySongValue
        }
        var Bundle = BundleArray[BundleInt]
        for (key, element) in Bundle{// gives bundle here
            BundleString = element
        }
        if BundleString != nil{// returns error here
            return BundleString
        }else {
            return "Error-Int-Bundle-Display-Function"
        }
    }
    
    
    func MuseArray() -> [String?] {
        
        let m0 = Bundle.main.path(forResource: "A Rocket Man", ofType: "m4a", inDirectory: "PracticeMuse")
        let m1 = Bundle.main.path(forResource: "A tear in paint-and time", ofType: "m4a", inDirectory: "PracticeMuse")
        let m2 = Bundle.main.path(forResource: "El grecco", ofType:"m4a", inDirectory: "PracticeMuse")
        let m3 = Bundle.main.path(forResource: "for liz", ofType: "m4a", inDirectory: "PracticeMuse")
        let m4 = Bundle.main.path(forResource: "forLiz2", ofType: "m4a", inDirectory: "PracticeMuse")
        let m5 = Bundle.main.path(forResource: "frenzy", ofType: "m4a", inDirectory: "PracticeMuse")
        let m6 = Bundle.main.path(forResource: "Summer Phantasm", ofType: "m4a", inDirectory: "PracticeMuse")
        let m7 = Bundle.main.path(forResource: "Where_ - 5_3_19, 11.22 AM", ofType: "m4a", inDirectory: "PracticeMuse")
        let m8 = Bundle.main.path(forResource: "Old Emotions", ofType: "m4a", inDirectory: "PracticeMuse")
        let m9 = Bundle.main.path(forResource: "Old Emotions of Existence - Extended", ofType: "m4a", inDirectory: "PracticeMuse")
        let m10 = Bundle.main.path(forResource: "Frenetic Apparition", ofType: "m4a", inDirectory: "PracticeMuse")
        let m11 = Bundle.main.path(forResource: "Forgotten Fugue", ofType: "m4a", inDirectory: "PracticeMuse")
        
        //Frenetic Apparition
        
        //END ALL OF AUDIO IS BE PLACED In Array:
        var MusicArray = [m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11]// for all audio file to pass through in the event of an update you know like the use pressing shuffle or something
        // AudioArray[MuseNum]
        
        return MusicArray
    }
    
    ///this is where the song is called and pulled from the array fucntion made above called MuseArray()
    func SongFromArr(_ ArrAy:[String?])->String?{
        //var MuseArraySize = MuseArray().count // placed as a permenant value so that it can be altered if shuffle is clicked, so that there aren't any exceptions thrown when skip is clicked
        // if statement for if the song array value gets larger than it's index so it just restarts
        if ArraySongValue < MuseDictionarySize{
            var Location = ArrAy[ArraySongValue]// array values pulled from the array number which is chosen and updated by the value ArraySongValue above
            let SongLocation = Location
            return SongLocation
        }else if ArraySongValue <= 0 {
            ArraySongValue = 0
            var RestartLocation = ArrAy[ArraySongValue]
            let SongLocationRestart = RestartLocation
            return SongLocationRestart
        }else{
            ArraySongValue = ArraySongValue - ArraySongValue
            var RestartLocation = ArrAy[ArraySongValue]
            let SongLocationRestart = RestartLocation
            return SongLocationRestart
        }
        ////// if array song value is decremented less than or equal to zereo just play the value at zero so this is for the double tap skip back to the previous song button... keep that in mind while playing because it has limited capabilities.
        
    }
    
    // ViewDidLoad Function
    // ViewDidLoad Function
    // ViewDidLoad Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // let doubleTapGesture = UITapGestureRecognizer(target: self , selector: #selector())
        
        //playPauseImage.image = UIImage(named: "Play.png")
        // restartSkipBackImage.image = UIImage(named: "RestartSkipBack.png")
        //SkipForwardImage.image = UIImage(named: "SkipForward.png")
        MusicGrabAndStore()
        displaySongTitle()//
        timeOfSong()//
        DoubleTapBackButton.addGestureRecognizer(DoubleTapBack)
        
        SliderTimeForEachMuseFunciton()
        
        
        
        CurrentSongDurration = song.duration// an attempt to solve the auto timmer issue on first song being played by intializing these values before they are needed
        CurrentSongPlayLength = song.currentTime// an attempt to solve the auto timmer issue on first song being played by intializing these values before they are needed
        
        
    }
    
    
    
    
    
    
    // Begining of Skeleton MusicGrabAndStore function
    // Begining of Skeleton MusicGrabAndStore function
    // Begining of Skeleton MusicGrabAndStore function
    func MusicGrabAndStore(){
        do{
            song = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: MuseBundleGrab()!))
            song.prepareToPlay()// preparing the audio session... but mainly crucial to the view did load
            
            let musicSession = AVAudioSession.sharedInstance()
            do{
                
                let sessionEr = try musicSession.setCategory(AVAudioSession.Category.playback)
            }catch let sessionErr{print("session errot")/*for catching any optional errors durinf the playing proccess*/}
        }catch let songErr{print("songErr")}
    }
    
    //////////////////////////////////
    //////////////////////////////////
    ///////basic call functions
    ///////basic call functions
    ///////basic call functions
    //////////////////////////////////
    //////////////////////////////////
    
    //play function and logic
    //play function and logic
    func theseValuesToBeInitialized(){
        // lazy var CurrentSongDurration = song.duration
        //lazy var CurrentSongPlayLength = song.currentTime
    }
    func SliderTimeForEachMuseFunciton(){
        //will be easy to call from all methods that needs to call this function
        MusicSlider.maximumValue = Float(song.duration)//will set max value for UIslider upon th view loading
        TimerForSliderSongUpdate()// will be called to update timer value as song plays
        
    }
    
    func playMuse(){
        song.play()
        
        autoPlay()
        //currDurration()
        displaySongTitle()
        SliderTimeForEachMuseFunciton()
    }
    //Current Durration Function
    //Current Durration Function
    func currDurration(){
        if pauseBool != false{
            MusicTime = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(NewTimeFunction), userInfo: nil, repeats: true)
        }
    }
    
    //the two autoplay function and logic
    //the two autoplay function and logic
    func autoPlay(){
        if ReplayBool != true{
            museTimeForNext = Timer.scheduledTimer(timeInterval: 0.5 , target: self, selector: #selector(continueToNextMuse), userInfo: nil, repeats: true)
        }
    }
    
    
    
    @objc func  continueToNextMuse(){
        print("AutoPlay Timer Active")
        var storeCurrentSongValue: String?
        
        
        if song.isPlaying == true {
            if Int(song.currentTime) == Int(song.duration) && ReplayBool == false {
                Skip()
                // autoPlay()
            }
        }else{
            
            if song.currentTime >= (song.duration - 0.49999) && ReplayBool == false {
                var Skipin2SecondsTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(autoplayAfterPoint2Seconds), userInfo: nil, repeats: false)
                
            }
        }
        /*
         else{
         autoPlay()// recursive in some sense... they constaintly call one another until the conditon is met
         }
         */
    }
    
    @objc func autoplayAfterPoint2Seconds(){
        Skip()
    }
    
    func replayAll(){
        if ReplayAllBool == true && ArraySongValue == MuseArraySize-1{
            ArraySongValue = 0
            MusicGrabAndStore()
            playMuse()
        }
    }
    //time of song function and logic
    //time of song function and logic
    
    //new time function begins here:
    
    //CURRENT LOGC
    @objc func NewTimeFunction(){
        var usingZero = 0
        var CurrTimeSec = Int(song.currentTime)%60// gives the time remaining after finding the minutes
        var CurrTimeMin = Int(song.currentTime)/60// gives you time in minutes
        var CurrentSecondHolder : Int// will have the second values placed here for the string to be called and printed
        var CurrentMinuteHolder : Int// will have the second values placed here for the string to be called and print
        var StringOfMinuteTime : String = ""
        var StringOfSecondTime : String = ""
        // Curr time logic
        
        if CurrTimeSec < 10{// current less than 10
            StringOfSecondTime = "0\(CurrTimeSec)"
        }
        if CurrTimeSec >= 10{
            StringOfSecondTime = "\(CurrTimeSec)"
        }
        
        if CurrTimeMin < 10{
            StringOfMinuteTime = "\(CurrTimeMin)"
        }
        if CurrTimeMin >= 10{
            "\(CurrTimeMin)"
        }
        
        
        var OfficialCurrent = "\(StringOfMinuteTime):\(StringOfSecondTime)"
        ////
        /////
        ////
        ////
        ////
        ////
        //DURATION LOGIC
        var DurrusingZero = 0
        var DurTimeSec = Int(song.duration)%60// gives the time remaining after finding the minutes
        var DurTimeMin = Int(song.duration)/60// gives you time in minutes
        var DurationSecondHolder : Int// will have the second values placed here for the string to be called and printed
        var DurationMinuteHolder : Int// will have the second values placed here for the string to be called and print
        var DurStringOfMinuteTime : String = ""
        var DurStringOfSecondTime : String = ""
        // Dur time logic
        
        if DurTimeSec < 10{// current less than 10
            DurStringOfSecondTime = "0\(DurTimeSec)"
        }
        if DurTimeSec >= 10{
            DurStringOfSecondTime = "\(DurTimeSec)"
        }
        
        if DurTimeMin < 10{
            DurStringOfMinuteTime = "\(DurTimeMin)"
        }
        if DurTimeMin >= 10{
            DurStringOfMinuteTime = "\(DurTimeMin)"
        }
        
        
        var OfficialDurration = "\(DurStringOfMinuteTime):\(DurStringOfSecondTime)"
        
        CurrentSongDurrartion.text = "\(OfficialCurrent):\(OfficialDurration)"
    }
    
    
    
    
    /// original Time Function below
    @objc func timeOfSong(){// became an objective-C function to get the timer to work above
        // Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block:)
        var currTime = Int(song.currentTime)
        
        var currTimeMin = 0
        var currSongDurrationMinutes = Int(song.duration)/60
        var currSongDurrationSeconds = Int(song.duration)%60
        var TimeTracker = 60
        var songDurrationLessThanTenSeconds:String = ""
        
        if currSongDurrationSeconds < 10{// for song durration
            songDurrationLessThanTenSeconds = "0\(currSongDurrationSeconds)"
        }else{var songDurrationLessThanTenSeconds = "\(currSongDurrationSeconds)"}
        
        var DurrationOfCurrSong = Int(song.duration)
        if DurrationOfCurrSong < 60{
            CurrentSongDurrartion.text =  "\(0):0\(currTime)/\(0):\(DurrationOfCurrSong)"
        }
        
        
        if currTime < 60 {// current time less than a minute
            CurrentSongDurrartion.text = "\(currTimeMin):0\(currTime)/\(currSongDurrationMinutes): \(songDurrationLessThanTenSeconds)"
        }// current time less than a minute
        
        
        if currTime >= TimeTracker{// current time greater than a minute
            if currTime < 10{
                TimeTracker = TimeTracker + TimeTracker
                currTimeMin = currTimeMin + 1
                var timeUpdate = currTimeMin + 1
                var newCurrentTime = currTime % (TimeTracker/timeUpdate)
                CurrentSongDurrartion.text = "\(currTimeMin):0\(newCurrentTime)/\(currSongDurrationMinutes): \(songDurrationLessThanTenSeconds)"
            }else{
                TimeTracker = TimeTracker + TimeTracker
                currTimeMin = currTimeMin + 1
                var timeUpdate = currTimeMin + 1
                var newCurrentTime = currTime % (TimeTracker/timeUpdate)
                CurrentSongDurrartion.text = "\(currTimeMin):\(newCurrentTime)/\(currSongDurrationMinutes): \(songDurrationLessThanTenSeconds)"
            }
        }else{
            if currTime < 10 {
                CurrentSongDurrartion.text = "\(currTimeMin):0\(currTime)/\(currSongDurrationMinutes): \(songDurrationLessThanTenSeconds)"}
        }
        if currTime>=10{
            CurrentSongDurrartion.text = "\(currTimeMin):\(currTime)/\(currSongDurrationMinutes): \(songDurrationLessThanTenSeconds)"
        }
    }
    //pause function and logic
    //pause function and logic
    func pauseMuse(){
        
        song.stop()
    }
    //Update array song value function and logic for skipping forward
    //Update array song value function and logic for skipping forward
    func UpdateArraySongValue(){
        ArraySongValue = ArraySongValue + 1
    }
    //Update array song value function and logic for skipping Back
    //Update array song value function and logic for skipping Back
    func BackArrayUpdateSongValue(){
        ArraySongValue = ArraySongValue - 1
        if ArraySongValue <= 0{
            ArraySongValue = 0
        }
    }
    //skip function and logic
    //skip function and logic
    func Skip(){
        //2. Skip to what ever is next in the audio array:
        UpdateArraySongValue()
        MusicGrabAndStore()
        //3. Play that value:
        playMuse()
        SliderTimeForEachMuseFunciton()/// updates slider value
    }
    
    //Skip Back function and logid
    //Skip Back function and logic
    func SkipBack(){
        BackArrayUpdateSongValue()
        MusicGrabAndStore()
        playMuse()
    }
    //restart function and logic
    //restart function and logic
    func Restart(){
        if song.isPlaying{
            pauseMuse()
        }
        song.currentTime = 0.0
        playMuse()
        SliderTimeForEachMuseFunciton()
    }
    //display title function and logic
    //display title function and logic
    func displaySongTitle(){
        var MusicTitle = ["A Rocket Man","A Tear in Paint and Time","El Grecco", "Score 1", "Emotion","Frenzy","Summer Phantasm","Where", "Dance of life","Dance of an end","Frenetic Apparition","Forgotten Fugue"]
        
        var mark = MusicTitle[ArraySongValue]
        Songtitle.text = MuseTitoloGrab()
    }
    //shuffle array function and logic
    //shuffle array function and logic
    func shuffleArray(){
        shuffleActiveQuestion = !shuffleActiveQuestion
        var NewShuffledArray = MuseDictionary()
        var removeHere = ArraySongValue
        
        if shuffleActiveQuestion == true{
            
            NewShuffledArray.remove(at: removeHere)
            // MuseArraySize = equals new count for current song removed from array
            // MusicArrayForUse = new array that repalces old array in the musicgrab and store function
            var ArrayForMuse = NewShuffledArray
            ArrayForMuse.shuffle()
            MuseDictionarySize = ArrayForMuse.count
            MusicArrayForUse = ArrayForMuse
            autoPlay()//calling auto play after shuffle is called regaredless if something is playing or not unless obviosely from the clause above a replaybool is equal true
            
            if song.isPlaying{
                autoPlay()
                //place for image change to light up shuffle
            }
        }
        
        if shuffleActiveQuestion == false{
            
            MuseArraySize = MuseDictionary().count
            MusicArrayForUse = MuseDictionary()
        }
    }
    
    
    //replay audio logic
    //replay audio logic
    func replayAVAudio(){
        var currentAVAudio = song//stores current somg to be replayed
        currentAVAudio.numberOfLoops = -10
        currentAVAudio.prepareToPlay()
        currentAVAudio.play()
        
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
        SkipBack()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //DoubleTapBackButton.addGestureRecognizer(DoubleTapBack)
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
    //shuffle
    
    var shuffleValue = false
    @IBAction func shuffle(_ sender: Any) {
        shuffleValue = !shuffleValue
        
        shuffleArray()
        
        //image shuffle active image
        
        // will run a random sort allgortithm converting array values in to purely numerical values then grab those values and placed the numerical representation as in a new array...
        
    }
    //Play and Pause
    //Play and Pause
    //Play and Pause
    @IBAction func PlyPause(_ sender: Any) {
        if song.isPlaying == true{
            
            pauseMuse()
            //  var showPlayImage = Bundle.main.path(forResource: "Play", ofType: "png", inDirectory: "Icons")
            
            //if let PauseForPlayImage = showPlayImage{
            // playPauseImage.image = UIImage(named: showPlayImage!)
            //}
            
            //let PauImage = "Play.png"
            
            // if let PauseForPlayImage = {
            //  playPauseImage.image = UIImage(named: PauImage)
            
            //image change to pause button here
        }else{
            
            
            //var showPlayImage = Bundle.main.path(forResource: "Pause", ofType: "png", inDirectory: "Icons")
            //let PauImage = "Pause.png"
            
            // if let PauseForPlayImage = {
            // playPauseImage.image = UIImage(named: PauImage)
            //}
            if ReplayBool == true{
                replayAVAudio()
                /// call the fucntion that causese the audio to replay
            }else{
                playMuse()
                currDurration()
                autoPlay()
                
                
            }
            //image change here to play button
        }
        //this one below is a function to pause and play music it will also be callled when the controller is down and out of view.
    }
    //restart and Skip back
    //restart and Skip back
    //restart and Skip back
    
    
    
    @IBAction func RestartSkipBack(_ sender: Any) {
        
        if song.currentTime <= 1.5{
            SkipBack()
            
        }else{
            Restart()
            
        }
    }
    
    ///Skip/Next LOL
    ///Skip/Next LOL
    ///Skip/Next LOL
    @IBAction func SkipFastforward(_ sender: Any) {
        //logic:
        
        //1. Pause whatever is being played:
        pauseMuse()
        //2. Skip to what ever is next in the audio array:
        Skip()
        //will be for displaying song title
        displaySongTitle()
        currDurration()
        autoPlay()
    }
    //replay
    //replay
    //replay
    
    
    @IBAction func Replay(_ sender: Any) {
        ReplayValueForAction = ReplayValueForAction + 1
        //var ReplayValueForUpdate = ReplayValueForAction
        // ReplayBool = !ReplayBool// can use loogic like this for playPause functionality
        // called to update the autoplay value notifying it of it's current value
        
        
        
        if ReplayValueForAction  == 1 {
            ReplayAllBool = true
            ReplayBool = false
            autoPlay()
            //replay all image
            // function call to restar playlist
        }
        if ReplayValueForAction == 2{
            
            ReplayAllBool = false
            ReplayBool = !ReplayBool
            autoPlay()
            // museTimeForNext?.invalidate()// doesn't I don't think need to be invalidated because this only solves the propblem temporarily
            replayAVAudio()
            //replay current image
        }
        
        if ReplayValueForAction >= 3 {
            ReplayValueForAction = 0
            ReplayBool = false
            ReplayAllBool = false
            
            if ReplayBool == false && ReplayBool == false{
                //the three function amigos
                
                displaySongTitle()
                currDurration()
                autoPlay()
                // the three function amigos
            }
            
        }
        
        
        /*
         var currentPlay = song
         
         if ReplayBool == true{
         if song.isPlaying == true{
         
         var loopCount = -1
         song.numberOfLoops = loopCount// this restarts the song from zero indefinitely then you play it over again
         }else{
         var loopCount = -1
         song.numberOfLoops = loopCount
         song.play()
         //https://stackoverflow.com/questions/45912830/how-can-i-repeat-a-song-in-ios
         //  willSet
         }
         }
         if ReplayBool == false{
         //the three function amigos
         displaySongTitle()
         currDurration()
         autoPlay()
         // the three functio amigos
         }
         */
    }
    
    @IBAction func ShowPlayList(_ sender: Any) {
        //  present(PlaylistView, animated: true, completion: nil)
    }
    
    @IBAction func MusicSliderUpdate(_ sender: Any) {
        
        pauseMuse()// mayber I don't need this value... spotify doesnt pause whrn you adjust the slider... and things seem to work well for them maybe I don't need it either
        song.currentTime = TimeInterval(MusicSlider.value)
        
        var sliderDelayPlayTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(SliderUpdateAfterValueCalled), userInfo: nil, repeats: false)
        
    }
    
    @IBAction func PresentMainViewControllerFunc(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    @objc func SliderUpdateAfterValueCalled(){
        song.prepareToPlay()
        playMuse()
        TimerForSliderSongUpdate()
    }
    
    
    func TimerForSliderSongUpdate(){
        var MusicTime = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdatingTheSliderCurrentTimeValue), userInfo: nil, repeats: true)
        
    }
    
    @objc func UpdatingTheSliderCurrentTimeValue(){
        MusicSlider.value = Float(song.currentTime)
        
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

