//
//  MainModelMVC.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 9/30/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation

class MainModelFunctionality: mainDataClass{
    /// STAY WITHIN O(1) OR O(N)!
    /// STAY WITHIN O(1) OR O(N)!
    var Auto : Bool = false
   // var WhichValue = 0//setting it up like the UIImage label n my practice app// now in a sigleton
    ///////// DAY MODE CODE TO CALL FOR COLOR USE
    var DayModeColorOfButton : UIColor = .black
    var DayModeColorOfBackGround : UIColor = .white
    var DayModeColorOfText : UIColor = .black
    ///////// NIGHT MODE CODE TO CALL
    var NightModeColorOfButton : UIColor = .white
    var NightModeColorOfBackGround : UIColor = UIColor(displayP3Red: 51.00, green: 44.00, blue: 44.00, alpha: 1.00)
    var NigtModecolorOfText : UIColor = .white
////////VIEWSCONTROLLER RETURN FUNCTIONS TO BE CALLED
////////VIEWSCONTROLLER RETURN FUNCTIONS TO BE CALLED
////////VIEWSCONTROLLER RETURN FUNCTIONS TO BE CALLED
////////VIEWSCONTROLLER RETURN FUNCTIONS TO BE CALLED
////////VIEWSCONTROLLER RETURN FUNCTIONS TO BE CALLED
////////VIEWSCONTROLLER RETURN FUNCTIONS TO BE CALLED
    ////////////View 0:
    func ViewStyleZero()->UIViewController{
        StateFavsSingletonClass.share.FavsHeartVisibilityBoolean = false
        let ErrorStoryBoard : UIStoryboard = UIStoryboard(name: "ErrorViewController", bundle: nil)
        let ErrorView : UIViewController = ErrorStoryBoard.instantiateViewController(withIdentifier: "ErrorView")as! ErrorClassView
        return ErrorView
    }
    ////////////VIEW 1:
    func ViewStyleOne(Titolo Titolo: String, Immagine Immagine: UIImage, Pagina Pagina:
        String?, Testo Testo:String)-> UIViewController{
        StateFavsSingletonClass.share.FavsHeartVisibilityBoolean = true
        let DisplayOneStoryBoad : UIStoryboard = UIStoryboard(name: "UIDesign1", bundle: nil)
        if let DisplayOneView = DisplayOneStoryBoad.instantiateViewController(withIdentifier: "DesignOne")as? UIDesignOneClass{
            DisplayOneView.Titolo = Titolo
            DisplayOneView.Imaggine = Immagine
            DisplayOneView.Testo = Testo
            DisplayOneView.paginaUrlBundle = Pagina
            
             return DisplayOneView
        }else{
            let ErrorStoryBoard : UIStoryboard = UIStoryboard(name: "ErrorViewController", bundle: nil)
            let ErrorView : UIViewController = ErrorStoryBoard.instantiateViewController(withIdentifier: "ErrorView")as! ErrorClassView
            return ErrorView
        }
    }
    /////////////VIEW 2:
    func ViewStyleTwo(Titolo Titolo: String, Testo Testo: String)->UIViewController{
           StateFavsSingletonClass.share.FavsHeartVisibilityBoolean = false
        let DisplayTwoStoryBoard : UIStoryboard = UIStoryboard(name: "UIDesign2", bundle: nil)
        if let DisplayTwoView = DisplayTwoStoryBoard.instantiateViewController(withIdentifier: "DesignTwo")as? UIDesignTwoClass{
            DisplayTwoView.Titolo = Titolo
            DisplayTwoView.Testo = Testo
            return DisplayTwoView
        }else{
            let ErrorStoryBoard : UIStoryboard = UIStoryboard(name: "ErrorViewController", bundle: nil)
            let ErrorView : UIViewController = ErrorStoryBoard.instantiateViewController(withIdentifier: "ErrorView")as! ErrorClassView
            return ErrorView
        }
    }
    ////////////VIEW 3:
    func ViewStyleThree(Titolo Titolo: String, Immagine Immagine: UIImage, Pagina Pagina: String?, Testo Testo:String)->UIViewController{
           StateFavsSingletonClass.share.FavsHeartVisibilityBoolean = true
        let DisplayThreeStoryBoard : UIStoryboard = UIStoryboard(name: "UIDesign3", bundle: nil)
        if let DisplayThreeView = DisplayThreeStoryBoard.instantiateViewController(withIdentifier: "DesignThree")as? UIDesignThreeClass{
            DisplayThreeView.titolo = Titolo
            DisplayThreeView.Imaggine = Immagine
            DisplayThreeView.Testo = Testo
            DisplayThreeView.PaginaBundleString = Pagina
            return DisplayThreeView
        }else{
            let ErrorStoryBoard : UIStoryboard = UIStoryboard(name: "ErrorViewController", bundle: nil)
            let ErrorView : UIViewController = ErrorStoryBoard.instantiateViewController(withIdentifier: "ErrorView")as! ErrorClassView
            return ErrorView
        }
    }
    //////////////VIEW 4:
    func ViewStyleFour(MainText MainText: String,Titolo Titolo: String, OptionalBackImmagine Immagine: UIImage )->UIViewController{
           StateFavsSingletonClass.share.FavsHeartVisibilityBoolean = true
        let DisplayFourStoryBoad : UIStoryboard = UIStoryboard(name: "UIDesign4", bundle: nil)
        if let DisplayFourView = DisplayFourStoryBoad.instantiateViewController(withIdentifier: "DesignFour")as? UIDesignFourClass{
            DisplayFourView.LableMain = MainText
            DisplayFourView.Titolo = Titolo
            DisplayFourView.BackgroundImage = Immagine
            
            return DisplayFourView
        }else{
            let ErrorStoryBoard : UIStoryboard = UIStoryboard(name: "ErrorViewController", bundle: nil)
            let ErrorView : UIViewController = ErrorStoryBoard.instantiateViewController(withIdentifier: "ErrorView")as! ErrorClassView
            return ErrorView
        }
    }
    ////////////VIEW 5:
    func ViewStyleFive(Titolo Titolo: String, Immagine Immagine: UIImage, Pagina Pagina: String?, Artista Artista: String)->UIViewController{
           StateFavsSingletonClass.share.FavsHeartVisibilityBoolean = true
        let DisplayFiveStoryBoard : UIStoryboard = UIStoryboard(name: "UIDesign5", bundle: nil)
        if let DisplayFiveView = DisplayFiveStoryBoard.instantiateViewController(withIdentifier: "DesignFive")as? UIDesignFiveClass{
            DisplayFiveView.Titolo = Titolo
            DisplayFiveView.Imaggine = Immagine
            DisplayFiveView.PaginaBundleString = Pagina
            DisplayFiveView.Artista = Artista
            
            return DisplayFiveView
        }else{
            let ErrorStoryBoard : UIStoryboard = UIStoryboard(name: "ErrorViewController", bundle: nil)
            let ErrorView : UIViewController = ErrorStoryBoard.instantiateViewController(withIdentifier: "ErrorView")as! ErrorClassView
            return ErrorView
        }
    }
/////////////LOGIC OF PULLING THE DATA TYPE FORM THE DATA CLASS--- FUNCTIONS CALLED SWITCHED BOARD
/////////////LOGIC OF PULLING THE DATA TYPE FORM THE DATA CLASS--- FUNCTIONS CALLED SWITCHED BOARD
/////////////LOGIC OF PULLING THE DATA TYPE FORM THE DATA CLASS--- FUNCTIONS CALLED SWITCHED BOARD
/////////////LOGIC OF PULLING THE DATA TYPE FORM THE DATA CLASS--- FUNCTIONS CALLED SWITCHED BOARD
/////////////LOGIC OF PULLING THE DATA TYPE FORM THE DATA CLASS--- FUNCTIONS CALLED SWITCHED BOARD
/////////////LOGIC OF PULLING THE DATA TYPE FORM THE DATA CLASS--- FUNCTIONS CALLED SWITCHED BOARD
/////////////LOGIC OF PULLING THE DATA TYPE FORM THE DATA CLASS--- FUNCTIONS CALLED SWITCHED BOARD
/////////////LOGIC OF PULLING THE DATA TYPE FORM THE DATA CLASS--- FUNCTIONS CALLED SWITCHED BOARD
    func TestoDataFunction(TestoDictionArray TestoDictionary:[Int:String])->String{
        var TestoString : String?
        var errorString : String = "ERR0R-TESTO-DATA-NOT-DISPLAYING-FROM-MAINDATAFUNCTIONALITY-AT\(currentViewValue)"
        for (key, element) in TestoDictionary{
            if key == currentViewValue {
                TestoString = element

            }
        }
        if TestoString != nil{
            return TestoString!
        }else{
            return errorString
        }
        
    }
    func TitoloDataFunction(TitoloStrings TitoloDataArray: [String])->String{
        var TitoloArrayForUse = TitoloDataArray
        return TitoloArrayForUse[currentViewValue]
    }
    
    func ImmagineDataFunction(UIImageGrab Image : [Int:UIImage?])->UIImage{
        var ErroUIImage = UIImage(named: "errorImage-vector-image-PnG.png")
        var ImmagineUIImageData : UIImage?
        for (key , element) in Image{
            if key == currentViewValue {
                ImmagineUIImageData = element
            }
        }
        if ImmagineUIImageData != nil{
            return ImmagineUIImageData!
        }else{
                return ErroUIImage!
                print("Error: UIImage-returning-nil")
            }
    }
    func PaginaDataFunction(PaginaBundleStrings Page : [Int:String])->String{
        /// search through dictionary as seen above with te uiimage dictionary
        var PaginaArrayForUse = Page
        var errorString = "Error-in-grabbing-String-Data"
        var PaginaStringData : String?
        for (key , element) in PaginaArrayForUse{
            if key == currentViewValue{
                PaginaStringData = element
            }
        }
        if PaginaStringData != nil{
            return PaginaStringData!
        }else{
            return errorString
        }
    }
    
    func ArtistaDataFunction(ThisArtista ArtistaStringDictionary : [Int : String])->String{
        var ArtistaString : String?
        var ErrorArtistaString = "ERROR-PULLING-THE-ARTISTA-STRING"
        for (key, element) in ArtistaStringDictionary{
            if key == currentViewValue{
                ArtistaString = element
            }
        }
        if ArtistaString != nil{
            return ArtistaString!
        }else{
            return ErrorArtistaString
        }
        
    }
    
    func MainFunction(MainFunctionString MainFunctionString: [Int : String])->String{
        var mainString : String?
        var ErrorString = "ERROR-RETURNING-MAIN-STRING-FOR-VIEW-4"
        for(key, element) in MainFunctionString{
            if key == currentViewValue {
                mainString = element
            }
        }
        if mainString != nil{
            return mainString!
        }else{
            return ErrorString
        }
        
    }
    
    func StyleTwoBackImmagine (BackgroundImmagine BackgroundImmagine: [Int:UIImage])->UIImage{
        var Immagine : UIImage?
        var ErrorImmagine = UIImage(named: "errorImage-vector-image-PnG.png")
        for (key , element) in BackgroundImmagine{
            if key == currentViewValue{
                Immagine = element
            }
        }
        if Immagine != nil {
            return Immagine!
        }else{
            return ErrorImmagine!
        }
    }
    
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    /// AV AUDIO SECTION LOGIC AV AUDIO SECTION LOGIC AVAUDIO SESSION LOGIC
    // AV Audio Session Logic
    
    // AV AUDIO IS 1:1 with every all views... given that there aren't anyviews that exist to which a session wouldn't be included
    var SpeakEasyCheckForNewSpeechValue : Int = 0
    func AutoAudioDecider()->[Int:String?]{
    switch WhichValue{
    case 0:
        return ElemAudStringsDictionary()
    break
    case 1:
        return ColAudStringsDictionary()
    break
    case 2:
        return ShapeAudStringsDictionary()
    break
    case 3:
        return PerspectAudStringsDictionary()
    break
    case 4:
        return ExpressionAudStringsDictionary()
    break
    case 5:
        return PracAudStringsDictionary()
    break
    default:
        return [0:"ERROR STRING"]
    break
    
    }
    }
    var SpeakEasy = AVAudioPlayer()      /// lol From 1984 Jame Orwell... Varible from which audio will be played
    
    func SpeakEasyArray()->[String?]{
        var AudSpeakEasy : [Int: String?] = AutoAudioDecider()
        var Aud = [String?]()
    
        for (num, bundle) in AudSpeakEasy{
            Aud.append(bundle)
        }
        //var BundleTemplate = Bundle.main.path(forResource: "", ofType:"", inDirectory: "")
        // Aud.append(BundleTemplate)
        // LOGIC for adding and returning th array bundle of needed audio
        return Aud
    }
    
    func ReturnPropereSpeakEasy()->String?{
        var AudSpeakEasy : [Int:String?] = AutoAudioDecider()
        var AudAudio : String? =  Bundle.main.path(forResource: "", ofType: "", inDirectory: "")// silent string goes here be sure to set it when ready to use this functionality
        for (key, bundle) in AudSpeakEasy{
            if key == currentViewValue{
                AudAudio = bundle
            }
        }
        return AudAudio/// this has it's own built in saftey measures by placing a silent string and will allow the moments that don't require a SpeakEasy to be added there
    }
    
    
    func SpeakEasyString()->String?{
        var CurrentArray = SpeakEasyArray()
        /// loose logic to the AV Audio session
        
        return CurrentArray[currentViewValue]
    }
    
    
    func SpeakEasyGrabAndStore(){
        // basic logic for audio session
        do{
            SpeakEasy = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:ReturnPropereSpeakEasy()!))
            
            SpeakEasy.prepareToPlay()// preparing the audio session... but mainly crucial to the view did load
            
            let AudioSession = AVAudioSession.sharedInstance()
            do{
                
                let sessionEr = try AudioSession.setCategory(AVAudioSession.Category.playback)
            }catch let sessionErr{print("session error")/*for catching any optional errors durinf the playing proccess*/}
        }catch let songErr{print("Aurio Error")}
    }
    func SpeakEasyPauseNChecker(){
        SpeakEasy.pause()
        SpeakEasyCheckForNewSpeechValue = currentViewValue
    }
    func SpeakEasyPlayNChecker(){
        SpeakEasy.play()
        SpeakEasyCheckForNewSpeechValue = currentViewValue/// for setting a value such that when paused and played again the values stay the same when played again and when the values/ the current view value moves the then it starts from the begining
    }
    func SpeakEasyPlayPauseFuntionality(){
        /*/// this isn't quite ready yet for any high level functionality
        if SpeakEasyCheckForNewSpeechValue == currentViewValue {
            if SpeakEasy.isPlaying == true{
                SpeakEasy.pause()
                        }else{
                SpeakEasy.play()
                                            }
        }else{
            if SpeakEasy.isPlaying == true{
                SpeakEasy.pause()// just regular pause function
                        }else{
                ReturnPropereSpeakEasy()// calling the string at it's current view value
                SpeakEasyGrabAndStore()// making sure that the current string value is passed
                SpeakEasy.play()
                        }
        }
        
        */
    }// end of function brackets
    
    func SpeakEasyReplay(){
        //nothing to play yet needs some work... last bit of logic will likely be this
        /*
        SpeakEasy.pause()
        SpeakEasy.currentTime = 0.0
        SpeakEasy.play()
        */
    }
    
    func NextViewAndAud(){
        
        
    }
// LOGICAL SWITCH BOARD ON CALLING DATA-- CALLED TO BE PLACED IN THE PARAMETER OF UIVIEW STYLES
// LOGICAL SWITCH BOARD ON CALLING DATA-- CALLED TO BE PLACED IN THE PARAMETER OF UIVIEW STYLES
// LOGICAL SWITCH BOARD ON CALLING DATA-- CALLED TO BE PLACED IN THE PARAMETER OF UIVIEW STYLES
// LOGICAL SWITCH BOARD ON CALLING DATA-- CALLED TO BE PLACED IN THE PARAMETER OF UIVIEW STYLES
// LOGICAL SWITCH BOARD ON CALLING DATA-- CALLED TO BE PLACED IN THE PARAMETER OF UIVIEW STYLES
// LOGICAL SWITCH BOARD ON CALLING DATA-- CALLED TO BE PLACED IN THE PARAMETER OF UIVIEW STYLES
// LOGICAL SWITCH BOARD ON CALLING DATA-- CALLED TO BE PLACED IN THE PARAMETER OF UIVIEW STYLES
// LOGICAL SWITCH BOARD ON CALLING DATA-- CALLED TO BE PLACED IN THE PARAMETER OF UIVIEW STYLES
    func displayTitlo()->String{
        switch WhichValue{
        case 0:
            //ele
            return TitoloDataFunction(TitoloStrings: ElemTitoloData())
            break
        case 1:
            // col
            return TitoloDataFunction(TitoloStrings: ColTitoloData())
            break
        case 2:
            //shape
            return TitoloDataFunction(TitoloStrings: ShapeTitoloData())
            break
        case 3:
            return TitoloDataFunction(TitoloStrings: PerspectTitoloData())
            break
        case 4:
            return TitoloDataFunction(TitoloStrings: ExpressionTitoloData())
            break
        case 5:
            return TitoloDataFunction(TitoloStrings: PracTitoloData())
            break
        default:
            print("Error: Titolo-data-nil at viewValue:\(currentViewValue)")
            return "Error: Titolo-data-nil at viewValue:\(currentViewValue)"
            break
        }
        
    }
    func displayImmagine()->UIImage?{
        var WhichImage : UIImage?
        switch WhichValue{
        case 0:
            WhichImage = ImmagineDataFunction(UIImageGrab: ElemUIImageDictionaryFunc())
            return WhichImage
            break
        case 1:
            WhichImage = ImmagineDataFunction(UIImageGrab: ColUIImageDictionaryFunc())
            return WhichImage
            break
        case 2:
            WhichImage = ImmagineDataFunction(UIImageGrab: ShapeUIImageDictionaryFunc())
            return WhichImage
            break
        case 3:
           WhichImage = ImmagineDataFunction(UIImageGrab: PerspectUIImageDictionaryFunc())
            return WhichImage
            break
        case 4:
            WhichImage = ImmagineDataFunction(UIImageGrab: ExpressionUIImageDictionaryFunc())
            return WhichImage
            break
        case 5:
            WhichImage = ImmagineDataFunction(UIImageGrab: PracUIImageDictionaryFunc())
            return WhichImage
            break
        default:
            
            print("Not-passing-Image-Data-at-ViewValue:\(currentViewValue)")
            WhichImage = UIImage(named: "errorImage-vector-image-PnG.png")
            return WhichImage
            break
        }
        
    }
    func displayPagina()->String?{
        ///CreaterMedia!   
    var WhichPagina = Bundle.main.path(forResource: "", ofType:"", inDirectory: "")
        switch WhichValue{
        case 0:
           
            return PaginaDataFunction(PaginaBundleStrings: ElemUrlPaginaFunc())
            break
        case 1:
            return PaginaDataFunction(PaginaBundleStrings: ColUrlPaginaFunc())
            break
        case 2:
            return PaginaDataFunction(PaginaBundleStrings: ShapeUrlPaginaFunc())
            break
        case 3:
            return PaginaDataFunction(PaginaBundleStrings: PerspectUrlPaginaFunc())
            break
        case 4:
            return PaginaDataFunction(PaginaBundleStrings: ExpressionUrlPaginaFunc())
            break
        case 5:
            return PaginaDataFunction(PaginaBundleStrings: PracUrlPaginaFunc())
            break
        default:
            print("Not-passingData-at-for-Page-ViewValue:\(currentViewValue)")
            return "Not-passingData-at-for-Page-ViewValue:\(currentViewValue)"
            break
        }
        
        
    }
    func displayTesto()->String{
        switch WhichValue{
        case 0:
            
            return TestoDataFunction(TestoDictionArray: ElemStringData())
            break
        case 1:
            
            return TestoDataFunction(TestoDictionArray: ColStringData())
            break
        case 2:
            
            return TestoDataFunction(TestoDictionArray: ShapeStringData())
            break
        case 3:
            
            return TestoDataFunction(TestoDictionArray: PerspectStringData())
            break
        case 4:
            
            return TestoDataFunction(TestoDictionArray: ExpressStringData())
            break
        case 5:
            
            return TestoDataFunction(TestoDictionArray: PracStringData())
            break
            
        default:
            return "Testo-Data-Return_ERROR: Return Nil at ViewValue:\(currentViewValue)"
        }
        
    }
    
    
    
    func displayAud(){
        ///for pulling data from the aud auto
    }
    
    
    func displayArtistaString()->String{
        ///CreaterMedia!
        switch WhichValue{
        case 0:
            
            return ArtistaDataFunction(ThisArtista: ElemArtistaStringDictionary())
            break
        case 1:
            return ArtistaDataFunction(ThisArtista: ColArtistaStringDictionary())
            break
        case 2:
            return ArtistaDataFunction(ThisArtista: ShapeArtistaStringDictionary())
            break
        case 3:
            return ArtistaDataFunction(ThisArtista: PerspectArtistaStringDictionary())
            break
        case 4:
            return ArtistaDataFunction(ThisArtista: ExpressionArtistaStringDictionary())
            break
        case 5:
            return ArtistaDataFunction(ThisArtista: PracArtistaStringDictionary())
            break
        default:
            print("Not-passingData-at-for-Page-ViewValue-For-Artista-Dictionary:\(currentViewValue)")
            return "Not-passingData-at-for-Page-ViewValue-For-Artista-Dictionary:\(currentViewValue)"
            break
        }
        
        
    }
    
    func displayMainFunctionString()->String{
        ///CreaterMedia!
        switch WhichValue{
        case 0:
            
            return MainFunction(MainFunctionString: ElemStyleTwoMainDictionary())
            break
        case 1:
            return MainFunction(MainFunctionString: ColStyleTwoMainDictionary())
            break
        case 2:
            return MainFunction(MainFunctionString: ShapeStyleTwoMainDictionary())
            break
        case 3:
            return MainFunction(MainFunctionString: PerspectStyleTwoMainDictionary())
            break
        case 4:
            return MainFunction(MainFunctionString: ExpressionStyleTwoMainDictionary())
            break
        case 5:
            return MainFunction(MainFunctionString: PracStyleTwoMainDictionary())
            break
        default:
            print("Not-passingData-at-for-Page-ViewValue-For-Main-Fucntion-Dictionary:\(currentViewValue)")
            return "Not-passingData-at-for-Page-ViewValue-For-Main-Fucntion-Dictionary:\(currentViewValue)"
            break
        }
        
        
    }
    
    
    
    //////uiimage here
    
    func displayStyleTwoImmagine()->UIImage{
        let ErrorImage = UIImage(named: "errorImage-vector-image-PnG.png")
        switch WhichValue{
        case 0:
            
            return StyleTwoBackImmagine(BackgroundImmagine: ElemStyleTwoImageDictionary())
            break
        case 1:
            return StyleTwoBackImmagine(BackgroundImmagine: ColStyleTwoImageDictionary())
            break
        case 2:
            return StyleTwoBackImmagine(BackgroundImmagine: ShapeStyleTwoImageDictionary())
            break
        case 3:
            return StyleTwoBackImmagine(BackgroundImmagine: PerspectStyleTwoImageDictionary())
            break
        case 4:
            return StyleTwoBackImmagine(BackgroundImmagine: ExpressionStyleTwoImageDictionary())
            break
        case 5:
            return StyleTwoBackImmagine(BackgroundImmagine: PracStyleTwoImageDictionary())
            break
        default:
            print("Not-passingData-at-for-Page-ViewValue-For-Main-Fucntion-Dictionary:\(currentViewValue)")
            return  ErrorImage!
            break
        }
        
        
    }
    /////the array list to be returned so that they can be used alot more freeely
    func ViewControllerArays()->[UIViewController]{
        var v0 : UIViewController = ViewStyleZero()
        var v1 : UIViewController = ViewStyleOne(Titolo: displayTitlo(), Immagine: displayImmagine()!, Pagina: displayPagina()!, Testo: displayTesto())
        var v2 : UIViewController = ViewStyleTwo(Titolo: displayTitlo(), Testo: displayTesto())
        var v3 : UIViewController = ViewStyleThree(Titolo: displayTitlo(), Immagine: displayImmagine()!, Pagina: displayPagina()!, Testo: displayTesto())
        var v4 : UIViewController = ViewStyleFour(MainText: displayMainFunctionString(), Titolo: displayTitlo(), OptionalBackImmagine: displayStyleTwoImmagine())
        var v5 : UIViewController = ViewStyleFive(Titolo: displayTitlo(), Immagine: displayImmagine()!, Pagina: displayPagina()!, Artista: displayArtistaString())
        
       var ViewArray : [UIViewController] = [v0, v1, v2, v3, v4, v5]
        return ViewArray
        
    }
    
    
    
    
    
    
    func CaseArrayOfDataInOrder()->[UIViewController]{
        
        if StateFavsSingletonClass.share.FavoritesActive == false{
        var OrderedContentViews : [UIViewController] = ViewControllerArays()
        switch WhichValue{
            
            
            
            
            
            
            
        case 0 :
            var ElemArray = [UIViewController]()
            ///appending Views in propper order here from 0-n using OrderedContentViews.append
            
            ///appending Views in proper order here from 0-n using OrderedContentViews.append
            ElemArray.append(OrderedContentViews[4])
            ElemArray.append(OrderedContentViews[1])
         
            return ElemArray
            break
            
            
            
            
            
            
            
            
            
            
            
        case 1:
            var ColArray = [UIViewController]()
            ///appending Views in propper order here from 0-n using OrderedContentViews.append
            ColArray.append(OrderedContentViews[4])
            ColArray.append(OrderedContentViews[4])
            ///appending Views in proper order here from 0-n using OrderedContentViews.append
            OrderedContentViews = ColArray
            return OrderedContentViews
            break
            
            
            
            
            
            
            
            
            
            
            
            
        case 2:
            var ShapeArray = [UIViewController]()
            ///appending Views in propper order here from 0-n using OrderedContentViews.append
            ShapeArray.append(OrderedContentViews[4])
            ShapeArray.append(OrderedContentViews[4])
            
            ///appending Views in proper order here from 0-n using OrderedContentViews.append
            return ShapeArray
            break
            
            
            
            
            
            
            
            
            
            
            
            
        case 3:
            var PerspectArray = [UIViewController]()
            ///appending Views in propper order here from 0-n using OrderedContentViews.append
            ///Place the interger number it will be found in the array right next to evert added value to keep an easy track of what data is being added:
            PerspectArray.append(OrderedContentViews[4])//0
            PerspectArray.append(OrderedContentViews[2])//1
            PerspectArray.append(OrderedContentViews[1])//2
            PerspectArray.append(OrderedContentViews[3])//3
            PerspectArray.append(OrderedContentViews[4])//4
            PerspectArray.append(OrderedContentViews[5])//5
            
            ///appending Views in proper order here from 0-n using OrderedContentViews.append
            return PerspectArray

            break
            
            
            
            
            
            
            
            
            
            
            
            
        case 4:
            var ExpressionArray = [UIViewController]()
            ///appending Views in propper order here from 0-n using OrderedContentViews.append
            ExpressionArray.append(OrderedContentViews[4])
            ExpressionArray.append(OrderedContentViews[4])
            
            ///appending Views in proper order here from 0-n using OrderedContentViews.append
            return ExpressionArray
            break
            
            
            
            
            
            
            
            
            
            
            
            
        case 5:
            var PracArray = [UIViewController]()
            ///appending Views in propper order here from 0-n using OrderedContentViews.append
            
            PracArray.append(OrderedContentViews[4])
            PracArray.append(OrderedContentViews[4])
            ///appending Views in proper order here from 0-n using OrderedContentViews.append
            return PracArray
            break
            
            
            
            
            
            
            
            
            
            
            
            
        default:
            let ErrorStoryBoard : UIStoryboard = UIStoryboard(name: "ErrorViewController", bundle: nil)
            let ErrorView : UIViewController = ErrorStoryBoard.instantiateViewController(withIdentifier: "ErrorView")as! ErrorClassView
            var errorArray = [ErrorView]
            return errorArray
            print("retruned error for this class of arraays so cannot load childview")
            break
        }
        }else{
            //// where you append the logic for displaying all the views for FavsFunctionality...
            let errorView = [ViewStyleZero()]//has to return an array of error objects
            return errorView // this is the errorView for now but it should return all the values in the state favs
        }
    }/////// end of switch case arrays
    
    
    
    
    
}////// end of class brackets

/*
///////// Switch Case logic

 switch WhichValue{
 case 0:
 return "el"
 break
 case 1:
 return "c"
 break
 case 2:
 return "s"
 break
 case 3:
 return "pe"
 break
 case 4:
 return "ex"
 break
 case 5:
 return "pr"
 break
 default:
 print("Not passingData")
 return "Not passing Data"
 break
 }
 
 
 */








/*
 
 
 //var whichSection : String?
 // var whichSection =  SectionPicker()
 

 
 
 func whichValue()->String{
 var instanceOfViewControllerClass = ViewController()
 instanceOfViewControllerClass.PickerDelegate = self
 
 var returnString = ""
 
 return ""
 }
 
 
 */
