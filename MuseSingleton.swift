//
//  MuseSingleton.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 10/14/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import SwiftAudio

class MuseSingleton{/// begining of singleton class
    
    
    private init(){
        
    }
    static let share = MuseSingleton()/// Singleton pattern created here
    weak var CurrentSongDurrartion: UILabel!//
    //// varibles for MuseMVC
    var ArraySongValue = 0
    
    var seeWhatValueScanPrint = "This String Non-Optional Prints"//
    var song = AVAudioPlayer()//
    
    var MusePlayPauseBoolean : Bool = true
    
    weak var Songtitle: UILabel?//
    weak var MusicSlider: UISlider?//
    weak var DoubleTapBackButton: UIButton?//
    weak var ReplayButton: UIButton?//
    weak var PresentMainViewControllerButton: UIButton?//will use to present main view controller modually rather than reomoving it one hundred percent from the screen that way I can attempt to medigate the issue of muse view forgetting all of it's current functionallity

    // UI Image Icons var
    // UI Image Icons var
    // UI image Icons var
    // @IBOutlet weak var restartSkipBackImage: UIImageView!
    //@IBOutlet weak var playPauseImage: UIImageView!
    // @IBOutlet weak var SkipForwardImage: UIImageView!
    //
    var AudioArray = [String?]()
    var ReplayValueForAction : Int = 0
    var ReplayBool = false
    var ReplayAllBool = false
    var pauseBool = true
    var pauseBool2ForAutoPlay = false
    var shuffleActiveQuestion : Bool = false
    var museTimeForNext : Timer? // optional timer to be trigured down below
    var MusicTime : Timer? // optional timer to be trigured down below
    lazy var MuseDictionarySize = MuseDictionary().count// lazy wrapped the varible to allow it to be intializeed before the function below is called... when shuffle is pressed this value will be altered and replaced with it's array size count
    lazy var MusicDictionaryForUse = MuseDictionary()// is placed in the MuseGrabAndStore() function and will be altered bve the shuffle fucntion below such that the new shuffled array will be played rather than the old and default arr
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
        var m11 = ["Forgoten" : Bundle.main.path(forResource: "Forgotten Fugue", ofType: "m4a", inDirectory: "PracticeMuse"),]
        var m12 = ["S T O R M": Bundle.main.path(forResource: "Storm", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m13 = ["Agression": Bundle.main.path(forResource: "Agression", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m14 = ["Monster Cat" : Bundle.main.path(forResource: "Monster Cat", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m15 = ["Virtual Minds" : Bundle.main.path(forResource: "Virtual minds-mastered", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m16 = ["Chaotic Tumble" : Bundle.main.path(forResource: "Chaotic Tumble - Remasterd", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m17 = ["It's Just Us" : Bundle.main.path(forResource: "It's just us Extended", ofType: "m4a", inDirectory: "PracticeMuse")]
        var m18 = ["Obsession" : Bundle.main.path(forResource: "Obsession", ofType: "m4a", inDirectory: "PracticeMuse")]
        //Chaotic Tumble.
        
        var ArrayOfMuseDicionaries = [m0,m1,m2,m3,m4,m5,m6,m7,m14,m15,m8,m9,m10,m11,m12,m13,m16,m17, m18]
        
        return ArrayOfMuseDicionaries
    }
    
    func MuseTitoloGrab()->String{// logic to grab the title of AVsession object
        if shuffleActiveQuestion == true{
            PrepareShuffleArray()
            ArraySongValue = shuffleIntArray[shuffleArrayCounter]
        }
        var TitoloString : String?
        var TitoloArray = MusicDictionaryForUse
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
    
    var Titolo : String?
    func MuseBundleGrab()->String?{
        if shuffleActiveQuestion == true{
            PrepareShuffleArray()
            ArraySongValue = shuffleIntArray[shuffleArrayCounter]
        }
        var BundleString : String?
        var BundleArray = MusicDictionaryForUse
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
            Titolo = key//// returns titolot key
            
        }
        if BundleString != nil{// returns error here
            return BundleString
        }else {
            return "Error-Int-Bundle-Display-Function"
        }
    }
    

    // Begining of Skeleton MusicGrabAndStore function
    // Begining of Skeleton MusicGrabAndStore function
    // Begining of Skeleton MusicGrabAndStore function
    var arrayOfSongTitolos = [String]()
    func placeSongTitolosInArray(){
        for x in 0...MusicDictionaryForUse.count - 1{
            for (Titolo, songData) in MusicDictionaryForUse[x]{
                arrayOfSongTitolos.append(Titolo)
            }
        }
    }
    func MusicGrabAndStore(){
        
    if let StingSong = MuseBundleGrab(){
        do{
                print("There Is StringData")
            song = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: MuseBundleGrab()!))
            song.prepareToPlay()// preparing the audio session... but mainlyo crucial to the view did load
            
            let musicSession = AVAudioSession.sharedInstance()
            do{
                
                let sessionEr = try musicSession.setCategory(AVAudioSession.Category.playback)
            }catch let sessionErr{print("session errot")/*for catching any optional errors durinf the playing proccess*/}
        }catch let songErr{print("songErr")}
        
        }//end bracket for checking if there is a song availible
    }
    
    var MusicPlayer = AudioPlayer()
    var MusicQuePlayer = QueuedAudioPlayer()
    var AlwaysPlayNextSongBool = true// default to true unless the user decides otherwise// for example if the user wants to replay song
    var isPlaying : Bool = false
    var ReplayBoolean : Bool = false
   
    func QueAddAllAudio(){
        var MusicArray = MuseDictionary()
        for x in 0...MusicArray.count - 1 {
            for(MusicTitle, Music) in MusicArray[x]{
                if Music != nil{
                    
            var Audio = AudioItem(MusicTitle, Music!)
                    //AudioItem.title = MusicTitle
                    do{
                        
                        try MusicQuePlayer.add(item: Audio, playWhenReady: false)}catch{
                            print("Unable_To_Que_Music_Item::: MuseSingleton(), AddAllAudio()")
                    }
                }else{
                    print("AudioFile-Not-AVailible::: MuseSingleton(), AddAllAudio()")
                }
            }
        }
        MuseSingleton.share.MusicQuePlayer.automaticallyPlayNextSong = AlwaysPlayNextSongBool
    }
    var ShuffleBoolean : Bool = false// defaulted to falsed
    func ShuffleAudioQue(){
        if ShuffleBoolean == true{
        var MusicItemsTobQued = MuseDictionary()
        MusicItemsTobQued.shuffle()
        var CurrentlyPlayingItem = MusicPlayer.currentItem?.getTitle()
        MusicQuePlayer.removeUpcomingItems()
        for x in 0...MusicItemsTobQued.count - 1 {
            for(SongTitle, Music) in MusicItemsTobQued[x]{
                if SongTitle != CurrentlyPlayingItem{
                    var Audio = AudioItem(SongTitle, Music)
                    do{
                        try MusicQuePlayer.add(item: Audio, playWhenReady: false)
                    }catch{ print ("Erro_Adding-Audio_Item")}
                }
            }
        }
        }else {
            MusicQuePlayer.event.playbackEnd.addListener(self, PlayItemNext(_:))
        }
    }
    
    func PlayItemNext(_ Data : AudioPlayer.PlaybackEndEventData){
        var LocationOfCurrentItem : Int?
        for x in 0...MuseDictionary().count - 1 {
            for(MusicTitle, Music) in MuseDictionary()[x]{
                if MusicTitle == MusicQuePlayer.currentItem?.getTitle(){
                    LocationOfCurrentItem = x
                    print(" Music Title \(MusicTitle), Location of Current Item : \(LocationOfCurrentItem)")
                }
            }
        }
        if LocationOfCurrentItem != nil{
            MusicQuePlayer.removeUpcomingItems()
            QueAddAllAudio()
            if Data == .playedUntilEnd {
                do{
                    try MusicQuePlayer.jumpToItem(atIndex: LocationOfCurrentItem! + 1 )
                }catch{
                    print("Error_Jumping-TO_NextItem")
                }
            }
        }
    }
    func MusicPlayerFunc(){
        let AudioItem = DefaultAudioItem(audioUrl: MuseBundleGrab()!, sourceType: .file)
        do{
            try MusicPlayer.load(item: AudioItem, playWhenReady: true)}catch{
                print("Error_Playing_AudioSession")
        }
    }
    func QuePlay(){ MusicQuePlayer.play()}
    func QuePause(){MusicQuePlayer.pause()}
    func QueNext(){do{try MusicQuePlayer.next()
        if let MusicTitle = MusicQuePlayer.currentItem?.getTitle(){
        print(MusicQuePlayer.currentItem?.getTitle()!)
        }
    }catch{print("Error-QueNext")}}
    func QuePrevious(){ do{try MusicQuePlayer.previous()}catch{print("Error-QuePrevious")}}
    func QueRestart(){do{try MusicQuePlayer.jumpToItem(atIndex: 0)}catch{print("Error-RestartingQue")}}
    func QueReplay(){
        MusicQuePlayer.event.playbackEnd.addListener(self, ListeningForMusicQueEnd(_:))
    }
    func ListeningForMusicQueEnd(_ Data : AudioPlayer.PlaybackEndEventData){
        if Data == .playerStopped{
            if ReplayBool == true{
                do {try MusicQuePlayer.jumpToItem(atIndex: 0)}catch{print("Replay_Error: MuseSinglton/PerformReplayLogic()")}}//end of if statement
        }
    }
    func AudioItem(_ Title : String, _ UrlFile : String? )-> DefaultAudioItem{
        var Song = DefaultAudioItem.init(audioUrl: UrlFile!, artist: "Rosso Leo", title: Title, albumTitle: "Todd", sourceType: .file, artwork: nil)
        return Song
    }
    func SetForUISlider(_ JumpToValue : Int){do{try MusicQuePlayer.jumpToItem(atIndex: JumpToValue)}catch{print("Error_JUMPING-To_SliderValue: \(JumpToValue)")}}
    func QueCheckIfPlayBackError(){ MusicQuePlayer.event.playbackEnd.addListener(self, CheckIfPlayBackError)}//will call soon once I can determined how the the Player.pause status is true
    func CheckIfPlayBackError(_ Data : AudioPlayer.PlaybackEndEventData){
        if Data == .playerStopped {isPlaying = false// if music is not playing then the view can update accordingly
        }else{isPlaying = true// if music is playing then this is checked true and the view can update accordingly
        }}//end bracket to check if there is a playback error
    func QueIsPlaying(){ MusicQuePlayer.event.stateChange.addListener(self, QueCheckIfPlaying)}
    func QueCheckIfPlaying(_ Data : AudioPlayer.StateChangeEventData){if Data == .playing {isPlaying = true}else{isPlaying = false}}// end of check if playing method
    
    @objc func finishedPlaying( _ myNotification: NSNotification) {
        Skip()// if it does work we will add more logic related to every for every state... but in their own functions
        print("Did Reach The end")
    }
    
    @objc func AVReachedTheEnd(){
        Skip()// if it does work we will add more logic related to every for every state... but in their own functions
        print("Did Reach The end")
    }
    
    func NewTimeFunction()->String{
        var TimeDisplay = "\(NewTimeFunctionCurr())/\(NewTimeFunctionDurr())"
        return TimeDisplay
    }
    func DisplayTitolo()->String{
       // return MuseTitoloGrab()/// use to return the muse grab data here but made an error with shuffle
        
        return Titolo!
    }
    func DisplayTimeCurr()->String{
       return NewTimeFunctionCurr()
    }
    func DisplayTimeDurr()->String{
        return NewTimeFunctionDurr()
    }
    func DisplayArtista()->String{
        return "Rosso Leo"
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

    func playMuse(){
        song.play()
        autoPlay()
        MusePlayPauseBoolean = true
    }

    func autoPlay(){
//        if ReplayBool != true{/// a larger saftey measure to insure that the time is triggured using many timmers to check if the muse value has actually eneded or reached the 0.5seconds
//          museTimeForNext = Timer.scheduledTimer(timeInterval: 0.1 , target: self, selector: #selector(continueToNextMuse), userInfo: nil, repeats: true)
//        }
    }
    
    
    
    @objc func  continueToNextMuse(){
        print("AutoPlay Timer Active")
        var storeCurrentSongValue: String?
        
        
        if song.isPlaying == true {
            if Int(song.currentTime) == Int(song.duration) && ReplayBool == false {
                Skip()
            }
        }else{
            
            if song.currentTime >= (song.duration - 0.49999999) && ReplayBool == false {
                var Skipin2SecondsTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(autoplayAfterPoint2Seconds), userInfo: nil, repeats: false)
                
            }
            
        }

    }
    
    @objc func autoplayAfterPoint2Seconds(_ Notify : Notification){
        Skip()
    }
    
    func replayAll(){
        if ReplayAllBool == true && ArraySongValue == MuseDictionarySize-1{
            ArraySongValue = 0
            MusicGrabAndStore()
            playMuse()
        }
    }
    //time of song function and logic
    //time of song function and logic
    
    func SessionChecker(){
        song.delegate?.audioPlayerDidFinishPlaying?(song, successfully: true)

    }

    
    //new time function begins here:
    
    //CURRENT LOGC
     func NewTimeFunctionCurr()->String{
        
        var usingZero = 0
        var CurrTimeSec = Int(song.currentTime)%60// gives the time remaining after finding the minutes
        var CurrTimeMin = Int(song.currentTime)/60 // gives you time in minutes
        var CurrentSecondHolder : Int// will have the second values placed here for the string to be called and printed
        var CurrentMinuteHolder : Int// will have the second values placed here for the string to be called and print
        var StringOfMinuteTime : String = ""
        var StringOfSecondTime : String = ""
        
        var bundleStringOfTimeLogic : String = ""
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
        
        return OfficialCurrent
    }
        ////
        /////
        ////
        ////
        ////
        ////
        
        
        func NewTimeFunctionDurr()->String{
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
        
      
        return OfficialDurration
    }

    
    //pause function and logic
    //pause function and logic
    func pauseMuse(){
        song.stop()
        
        MusePlayPauseBoolean = false
    }
    //Update array song value function and logic for skipping forward
    //Update array song value function and logic for skipping forward
    func UpdateArraySongValue(){
        if shuffleActiveQuestion == false{
        ArraySongValue = ArraySongValue + 1
        }
        if shuffleActiveQuestion == true{
            ShuffleArrayUpdater()
        }
    }
    //Update array song value function and logic for skipping Back
    //Update array song value function and logic for skipping Back
    func BackArrayUpdateSongValue(){
        if shuffleActiveQuestion == false{
        ArraySongValue = ArraySongValue - 1
        if ArraySongValue <= 0{
            ArraySongValue = 0
        }
        }
        if shuffleActiveQuestion == true{
            ShuffleArrayDownDater()
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
 
    }
    //shuffle array function and logic
    //shuffle array function and logic
    var shuffleIntArray = [Int]()
    var shuffleArrayCounter = 0
    func PrepareShuffleArray(){
        for x in 0...MusicDictionaryForUse.count - 1{
            shuffleIntArray.append(x)/// appending the maximum list of values in the musicDicitionary.. and passing that list of ints to the shuffle array
        }
        shuffleIntArray.shuffle()// doubling the randomness
        shuffleIntArray.shuffle()// doubling the randomness by shuffling the integer array twice
    }
    func ShuffleArrayUpdater(){
        if shuffleArrayCounter < MusicDictionaryForUse.count{
            shuffleArrayCounter = shuffleArrayCounter + 1
        }
        else{
            if ReplayValueForAction == 1 {
                shuffleArrayCounter = 0
            }else{
                shuffleArrayCounter = MusicDictionaryForUse.count
                song.pause()
            }
        }
    }
    func ShuffleArrayDownDater(){
        if shuffleArrayCounter > 0 {
            shuffleArrayCounter = shuffleArrayCounter - 1
        }else{
            shuffleArrayCounter = 0
        }
    }
    func shuffleArray(){
        shuffleActiveQuestion = !shuffleActiveQuestion
        var removeHere = ArraySongValue
        var SongCurrentTitoloToBeRemoved = DisplayTitolo()
        PrepareShuffleArray()// shuffles int array in the potential oppotunity in which the system wants to use the shuffled values
        if shuffleActiveQuestion == true{
//
//
//            MusicDictionaryForUse.remove(at: removeHere)
//            // MuseArraySize = equals new count for current song removed from array
//            // MusicArrayForUse = new array that repalces old array in the musicgrab and store function
//            var ArrayForMuse = MusicDictionaryForUse
//            ArrayForMuse.shuffle()
//            MuseDictionarySize = ArrayForMuse.count
//            MusicDictionaryForUse = ArrayForMuse
            autoPlay()//calling auto play after shuffle is called regaredless if something is playing or not unless obviosely from the clause above a replaybool is equal true
            
            if song.isPlaying{
                autoPlay()
                //place for image change to light up shuffle
            }
        }
        
        if shuffleActiveQuestion == false{
            
            MuseDictionarySize = MuseDictionary().count
            MusicDictionaryForUse = MuseDictionary()
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
    func singletonShuffle() {
        shuffleValue = !shuffleValue
        shuffleArray()
        //image shuffle active image
    }
    //Play and Pause
    //Play and Pause
    func singletonPlyPause() {
        if song.isPlaying == true{
            pauseMuse()
            //image change to pause button here
        }else{
            if ReplayBool == true{
                replayAVAudio()
                /// call the fucntion that causese the audio to replay
            }else{
                playMuse()
                //currDurration()
                autoPlay()
            }
        }
    }
    //restart and Skip back
    //restart and Skip back
    func singletonRestartSkipBack() {
        if song.currentTime <= 1.5{
            SkipBack()
        }else{
            Restart()
        }
    }
    ///Skip/Next LOL
    ///Skip/Next LOL
 func singletonSkipFastforward() {
        //1. Pause whatever is being played:
        pauseMuse()
        //2. Skip to what ever is next in the audio array:
        Skip()
        //will be for displaying song title
        //currDurration()
        autoPlay()
    }
    //replay
    //replay
    
    var ReplayImage : UIImage = #imageLiteral(resourceName: "ReplayNone")// image literal as replay none is default
    func singletonReplay() {
        ReplayValueForAction = ReplayValueForAction + 1
        if ReplayValueForAction  == 1 {
            ReplayAllBool = true
            ReplayBool = false
            autoPlay()
            //replay all image
            ReplayImage = #imageLiteral(resourceName: "ReplayAll")// image literal replay all boolean becomes the new booleaan unless changed
        }
        if ReplayValueForAction == 2{
            
            ReplayAllBool = false
            ReplayBool = !ReplayBool
            autoPlay()
            replayAVAudio()
            //replay current image
            ReplayImage = #imageLiteral(resourceName: "ReplayThisSong")/// replay all boolean is the boolean that come when clicked twice to play the one song
        }
        
        if ReplayValueForAction >= 3 {
            ReplayValueForAction = 0
            ReplayBool = false
            ReplayAllBool = false
            
            if ReplayBool == false && ReplayBool == false{
                //the three function amigos
                //currDurration()
                autoPlay()
                // the three function amigos
                ReplayImage = #imageLiteral(resourceName: "ReplayNone")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    ////// slider functionality here:
    ////// slider functionality here:
    
    func SliderTimeForEachMuseFunciton(SliderHere Slider: UISlider?){
        /// this is to set slider's max value and intialialize it per song and as the audio is about to be displayed...
        //will be easy to call from all methods that needs to call this function
        if let sliderQuestionmark = Slider{
        Slider!.maximumValue = Float(song.duration)//will set max value for UIslider upon th view loading
        }
        TimerForSliderSongUpdate()// will be called to update timer value as song plays
        
    }
 
    func singletonMusicSliderUpdate(SliderHere Slider: UISlider?) {
        /// called to update the song current play time to what ever time the user moved it too...
         if let SliderQuestionMark = Slider{
        pauseMuse()// mayber I don't need this value... spotify doesnt pause whrn you adjust the slider... and things seem to work well for them maybe I don't need it either
        song.currentTime = TimeInterval(Slider!.value)
        
        var sliderDelayPlayTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(SliderUpdateAfterValueCalled), userInfo: nil, repeats: false)
        }
    }
    
    
    @objc func SliderUpdateAfterValueCalled(){
        song.prepareToPlay()
        playMuse()
        TimerForSliderSongUpdate()
    }
    
    
    var CurrentTimeChangerVar : Float  = 0.0
    func TimerForSliderSongUpdate(){
        //lol just the timer called to set and update the slider value based on the songs current time
        var MusicTime = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdatingTheSliderCurrentTimeValue), userInfo: nil, repeats: true)
        
    }
    @objc func UpdatingTheSliderCurrentTimeValue(){
        ///sets the slider value to the current value of the song....
        CurrentTimeChangerVar = Float(song.currentTime)
       ///should send it's value to the slider by making an instance of the view controlle class but not presenting it.... that way the value can be updated even when the slider isn;t pressent
    }
    
    
    
    //NotificationCenter.default.addObserver(self, selector: #selector(self.autoplayAfterPoint2Seconds(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.song.currentTime)
    //def.addObserver(self, selector: #selector(autoplayAfterPoint2Seconds), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.song.currentTime)


    
}//// end of singleton class




