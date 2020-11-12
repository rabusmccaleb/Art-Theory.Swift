//
//  ViewPickerClass.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 10/10/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class UIViewPickerClass : MainModelFunctionality {
    
    
    ///Loading View:
    @IBOutlet weak var LoadingView: UIView!
    @IBOutlet weak var LoadingImage: UIImageView!
    @IBOutlet weak var LoadingTitoloLable: UILabel!
    var LoadingFavText = ""
    @IBOutlet weak var LoadingFavTitolo: UILabel!

    var LoadTimer : Timer?
    
    
    ///Loading View Logic END
    
    @IBOutlet var ViewPickerView: UIView!
    @IBOutlet var FrostedMainView: UIView!
    @IBOutlet var ColorConsitentView: UIView!
    @IBOutlet weak var ViewPickerContainer: UIView!
    @IBOutlet weak var MuseViewBackGroundView: UIView!
    
    @IBOutlet weak var NextView: UIView!
    @IBOutlet weak var BackView: UIView!
    
    @IBOutlet weak var TitoloFrostedView: UIView!
    

    
    @IBOutlet weak var ContainerViewForSubs: UIView!
    @IBOutlet weak var TitoloLable: UILabel!/// titolo lable here
    @IBOutlet weak var BlurrBackGroundImage: UIImageView!///will be in the back ground
    ///////////////logic For Progress LOL:
    @IBOutlet weak var Progresso: UIProgressView!
    lazy var ProgressCounter : Float = Float(currentViewValue)/// initalized at zero but should be lazy wrapped to insure that when that the value isn't set until the class itself loads
    lazy var ProgressoMaxValue : Float = Float(subviewArray.count - 1)///Intialized into a float value for aritmetic puporses
    lazy var ProgressoRatio : Float = Float(ProgressCounter / ProgressoMaxValue)/// value to be used in the updating progress
    /////// End of Logic For Progress LOL
    
    // ALL UI BUTTON VARS
    @IBOutlet weak var BackButtonVar: UIButton!/// back to tableOC
    @IBOutlet weak var NextButtonVar: UIButton!/// NextView
    @IBOutlet weak var PreviousButtonVar: UIButton!/// PreviousView
    @IBOutlet weak var NightModeButtonVar: UIButton!/// NightModeButton
    @IBOutlet weak var AutoPlayPauseButtonVar: UIButton!///AutoPlayPause Button
    @IBOutlet weak var AutoReplayButtonVar: UIButton!///AutoReplay Button
    @IBOutlet weak var LogoButtonVar: UIImageView!///Logo for Top display
    @IBOutlet weak var TitoloLogoButtonVar: UIImageView!///LogoTitolo
    @IBOutlet weak var FavsBotton: UIButton!/// FavsBotton
    @IBOutlet weak var FavsButtonImmage: UIImageView!
    
    //AutoPlayUnderButtonValues
    @IBOutlet weak var AutoPlayPauseImage: UIImageView!
    @IBOutlet weak var AutoReplayImage: UIImageView!
    @IBOutlet weak var MuseVisibilityDown: UIImageView!
    @IBOutlet weak var MuseVisibilityUp: UIImageView!
    
    // END OF BUTTON VARS
    
    
    
    @IBOutlet weak var MusePlaPaOutlet: UIButton!
    @IBOutlet weak var MuseDisplayMuseOutlet: UIButton!
    @IBOutlet weak var MuseProgresso: UIProgressView!
    @IBOutlet weak var MuseTimeLable: UILabel!
    @IBOutlet weak var MuseArtistaLable: UILabel!
    @IBOutlet weak var MuseTitoloLable: UILabel!
    @IBOutlet weak var MuseBackgroundImmagie: UIImageView!
    
    @IBOutlet weak var ViewPickerControlResetView : UIView!/// set up to reset the control buttons in the ViewPicker view
    @IBOutlet weak var MuseResetConstraintView : UIView!/// Set up to to reset the MuseViewButtons in the ViewPicker view
    
    lazy var subviewArray = CaseArrayOfDataInOrder()
    
    
    var Frosted : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    var FavsViewValue : Int = 0
    
    var ViewControlToAdd : UIViewController?
  
    //// override and adding and removing children from the parent view
     
    override func viewDidLoad() {
        super.viewDidLoad()
        AutoPlayUIFunction()
        MuseVisibilityDown.image = #imageLiteral(resourceName: "MuseVisibilityUp")
        MuseVisibilityUp.image = #imageLiteral(resourceName: "MuseVisibilityDown")
        HiddenDisplayTable.setBackgroundImage(#imageLiteral(resourceName: "MarkMaryTableOCDisplay"), for: .normal)
        MuseVisibilityUp.isHidden = true
        LoadingFavTitolo.text = LoadingFavText
        
        ContainerViewForSubs.addGestureRecognizer(DimissMuse)
        
        self.ViewPickerView.layer.cornerRadius = 12.5
        self.ViewPickerView.clipsToBounds = true
        HeartChecker()/// should check if true of false such that the view shows that data on inital load

        
    // PreviousButtonVar.bottomAnchor.constraint(equalTo: MuseResetConstraintView.bottomAnchor).isActive = true
    //ViewPickerContainer.isHidden = CollapseViewBoolean
        
        
        
        /// titolo control layer
        let titoloFrosted : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        TitoloFrostedView.addSubview(titoloFrosted)
        titoloFrosted.frame = TitoloFrostedView.bounds
        TitoloFrostedView.layer.cornerRadius = 15.0
        TitoloFrostedView.clipsToBounds = true
        TitoloLable.text = displayTitlo()
        LoadingTitoloLable.text = displayTitlo()
        
        
        let frostedNight : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        
        //ConstraintsToSubView()
        //addingChild(subviewArray[currentViewValue])
       
        //pushingChildToSuper(subviewArray[currentViewValue])
        NightModeFunctionality()
        //ViewDiDAppearForChild()///callled for resizing
           //ConstraintsToSubView()//////////NEW!
        MuseContentDisplayTimer()
        
        // ideally the subview all the code for adding the frost:
        // museViewfunctionalty:
        // museViewfunctionalty:
        // museViewfunctionalty:
       // ViewPickerContainer.layer.cornerRadius = 10.0
       // ViewPickerContainer.clipsToBounds = true
        MuseViewBackGroundView.addSubview(Frosted)
        Frosted.frame = MuseViewBackGroundView.bounds/// effectively frosting
        
        let FrostedView : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        FrostedMainView.addSubview(FrostedView)
        FrostedView.frame = FrostedMainView.bounds//. creating this really beautiful display for function

        
        ///...... color background inital set and function call:
        let ColorArray : [UIColor] = StateFavsSingletonClass.share.MainReturnPalete()
        
        ViewPickerView.backgroundColor = ColorArray[ColorInitalValue]
        
        NightClubModeTimer()
        /// heartChecker here code to be called when the view has loaded... but it will also update when the view the subviews change
 
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        IntialViewLoad()
        ViewDiDAppearForChild()
        LoadProgressFunctionTriggered()
        LoadViewTimer()
         

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        MuseVisibiltyBoolean = !MuseVisibiltyBoolean// possibly to help the view reset it self to it's intial status... such that it keeps its current status
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ContainerViewForSubs.addGestureRecognizer(DoubleTapFav)/// allows for double tap favs
        NightModeFunctionality()
        MuseVisibiltiyFunc()// called to determine the views that are hidden or aren't
        //ReloadRecentViewValues()// loads recent values if there is any to load
        HiddenAndRegularProgressoFunc()//Updates the progresso and the hidden progresso to reflect the number of views
        DisplayStyleForHiddenControl()///displays the progressos appropriately
        print(currentViewValue)
        ViewControlToAdd = subviewArray[currentViewValue]
        StateFavsSingletonClass.share.TransitionStyleChecker = .crossDissolve// in order to stop the view from transioning backwards from a flip the change is disgusting
        let ImageValue : Int = 43
        
        if ImageSingleton.share.ImageString[ImageValue] != nil {
            MuseBackgroundImmagie.image = StateFavsSingletonClass.share.ResizeAllImageWithBundle(ImageSingleton.share.ImageString[StateFavsSingletonClass.share.ImaggineNumber] , MuseBackgroundImmagie)
        }
        
        ViewPickerContainer.layer.cornerRadius = 0.0
        ViewPickerContainer.clipsToBounds = true
        MuseProgresso.trackTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2960222271)
        MuseProgresso.progressTintColor = .white
        
    }
    
    // Store Recent Value Functionality:
    // Store Recent Value Functionality:
    let LocationDefaults = UserDefaults.standard
    let locationKey : String = "RecentLoacationKey"
    var FavsBoolean : Bool = false
    //for storing values to be keep track of the most recent viewValue
    var Storage0key = "elem"
    var Storage1key = "Col"
    var Storage2key = "Sha"
    var Storage3key = "Per"
    var Storage4key = "Ex"
    var Storage5key = "Pr"
    var StorageCase0 = 0
    var StorageCase1 = 0
    var StorageCase2 = 0
    var StorageCase3 = 0
    var StorageCase4 = 0
    var StorageCase5 = 0
    
    func ReloadRecentViewValues(){
        if FavsBoolean == false {// to insure that it doesn't override the view to load that is meant to present the view passed from the favs
        switch WhichValue{
            case 0:
                if LocationDefaults.object(forKey: Storage0key)as? Int != nil{
                    currentViewValue = LocationDefaults.object(forKey: Storage0key)as! Int
                }else{LocationDefaults.set(StorageCase0, forKey: Storage0key)}
            break
            case 1:
                if LocationDefaults.object(forKey: Storage1key)as? Int != nil{
                    currentViewValue = LocationDefaults.object(forKey: Storage1key)as! Int
                }else{LocationDefaults.set(StorageCase1, forKey: Storage1key)}
            break
            case 2:
                if LocationDefaults.object(forKey: Storage2key)as? Int != nil{
                    currentViewValue = LocationDefaults.object(forKey: Storage2key)as! Int
                }else{LocationDefaults.set(StorageCase2, forKey: Storage2key)}
            break
            case 3:
                if LocationDefaults.object(forKey: Storage3key)as? Int != nil{
                    currentViewValue = LocationDefaults.object(forKey: Storage3key)as! Int
                }else{LocationDefaults.set(StorageCase3, forKey: Storage3key)}
            break
            case 4:
                if LocationDefaults.object(forKey: Storage4key)as? Int != nil{
                    currentViewValue = LocationDefaults.object(forKey: Storage4key)as! Int
                }else{LocationDefaults.set(StorageCase4, forKey: Storage4key)}
            break
            case 5:
                if LocationDefaults.object(forKey: Storage5key)as? Int != nil{
                    currentViewValue = LocationDefaults.object(forKey: Storage5key)as! Int
                }else{LocationDefaults.set(StorageCase5, forKey: Storage5key)}
            break
            default:
                "Case-For-ReloadRecentViewValues()-Doesn't_MATCH_FORMAT "
            break
            }
        }//
    }
    
    func storeRecentInUserDefaults(){
        if FavsBoolean == false {// to insure that if a favs location is the reason for the view it's location won't be saved
        switch WhichValue{
        case 0:
            LocationDefaults.set(currentViewValue, forKey: Storage0key)as? Int
            break
        case 1:
            LocationDefaults.set(currentViewValue, forKey: Storage0key)as? Int
            break
        case 2:
            LocationDefaults.set(currentViewValue, forKey: Storage0key)as? Int
            break
        case 3:
            LocationDefaults.set(currentViewValue, forKey: Storage0key)as? Int
            break
        case 4:
            LocationDefaults.set(currentViewValue, forKey: Storage0key)as? Int
            break
        case 5:
            LocationDefaults.set(currentViewValue, forKey: Storage0key)as? Int
            break
        default:
            "Case-For-ReloadRecentViewValues()-Doesn't_MATCH_FORMAT "
            break
            }
        }
    }

    
    /// timer to invalidate the Loading View
    func LoadViewTimer(){
        LoadTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(LoadProgressFunctionTriggered), userInfo: nil, repeats: false)
    }
    @objc func LoadProgressFunctionTriggered(){
        LoadingView.isHidden = true
    }
    func loadViewTitlo()->String{
        switch WhichValue {
        case 0:
            return "Elements"
            break
        case 1:
            return "Color"
            break
        case 2:
            return "Shape"
            break
        case 3:
            return "Perspective"
            break
        case 4:
            return "Expression"
            break
        case 5:
            return "Art Philosophy"
            break
        default:
            return "ERORR"
        }
    }
// 2 vestage methods below... that do nothing
    //// progress bar logic forward and back logic
    func ProgressBarUpDaterFunction(){
   // empty call
    }

    func ProgressBarDownDaterFunction(){
        //Empty call
    }
    /// END of progress bar forward and back logic
    
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
            ViewPickerView.backgroundColor = ColorArray[ColorInitalValue]
        }else{
            ColorArray.shuffle()
            ColorInitalValue = 0
            ViewPickerView.backgroundColor = ColorArray[ColorInitalValue]
        }
    }

    
    /// for displaying muse content lables
    /// for displaying muse content lables
    func MuseContentDisplayTimer(){
        var MainMuseTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(DisplayMuseContent), userInfo: nil, repeats: true)
    }
    
   @objc func DisplayMuseContent(){
        MuseTimeLable.text = MuseSingleton.share.NewTimeFunction()
        MuseArtistaLable.text = MuseSingleton.share.DisplayArtista()
        MuseTitoloLable.text = MuseSingleton.share.DisplayTitolo()
        var MuseCurr = MuseSingleton.share.song.currentTime
        var MuseDurr = MuseSingleton.share.song.duration
        var MuseRatio = Float(MuseCurr / MuseDurr)
        MuseProgresso.progress = MuseRatio
        MuseProgresso.setProgress(MuseProgresso.progress, animated: true)
        // museViewfunctionalty:// museViewfunctionalty:// museViewfunctionalty:
        // MuseProgresso.layer.cornerRadius = 7.0
        // MuseProgresso.clipsToBounds = true
        MuseProgresso.progressTintColor = StateFavsSingletonClass.share.MuseProgressoProgress
    
    }
    

    /// for displaying muse content lable
    /// for displaying muse content lable
 /// adding and removing views logic for MARK MARY REEL:
    
    
    func ViewCounterUpDater(){
        if currentViewValue < subviewArray.count {
        currentViewValue = currentViewValue + 1
        subviewArray = CaseArrayOfDataInOrder()/// this is used again to update the viewcontrollers that are pre-initiaized in the sub views.
           HeartChecker()
            print(currentViewValue)
        } else {
            currentViewValue = subviewArray.count - 1
              HeartChecker()
            print("MaxValueMet")
        }
       // if StateFavsSingletonClass.share.currentViewValue >= (subviewArray.count)-1{
            //StateFavsSingletonClass.share.currentViewValue = ((subviewArray.count)-1)
            // This is and will stop the view from going beyond the arrays vales by stopping it at the max reel display value
        //}
    }
    func ViewCounterDownDater(){
        currentViewValue = currentViewValue - 1
        HeartChecker()
        if currentViewValue <= 0{
            currentViewValue = 0
            HeartChecker()
            
        }//// this will stop the view from going back beyond it's value by stopping it from going beyond it's minumum view value
    }
    func addingChild(_ childController: UIViewController) {
     
        if ViewControlToAdd != nil{
        ContainerViewForSubs.addSubview(ViewControlToAdd!.view)
        ViewControlToAdd!.view.willMove(toSuperview: ContainerViewForSubs)
       // ConstraintsToSubView()///calling constraints here such that any logic used to add will come with extra functionallity of constraintTitoloLable.text = subviewArray
        StateFavsSingletonClass.share.WhichValueTracker = WhichValue
        StateFavsSingletonClass.share.CurrentViewTracker = currentViewValue// this is the single point by which all of mark mary's subviews opperate from..... this function.. so it's fitting to update it when it is called
        print("MainFunctionalityClass for MVC in CaseArrayDataInOrder func ___-- WHich Valeu :\(StateFavsSingletonClass.share.WhichValueTracker!), CurrentViewValue : \(StateFavsSingletonClass.share.CurrentViewTracker!)")//// I'm using this to track the values are indeed changing
        
          FavsBotton.isHidden = !StateFavsSingletonClass.share.FavsHeartVisibilityBoolean//determines if the favs button is visible based on which view is up... inverted because I inverted the logic in th modelMVC Class which means that the not is just negation
        }
    }
    
    func removeChild(_ childController: UIViewController){
        
        if ViewControlToAdd?.view != nil{
            ViewControlToAdd!.willMove(toParent: nil)
            ViewControlToAdd!.view.removeFromSuperview()
            ViewControlToAdd!.removeFromParent()
        }
        
    }
    
    func ConstraintsToSubView(){
        /// will place contraints here for view to adjust
        //NSLayoutConstraint()
        subviewArray[currentViewValue].view.widthAnchor.constraint(equalTo: ContainerViewForSubs.widthAnchor)//width
        subviewArray[currentViewValue].view.heightAnchor.constraint(equalTo: ContainerViewForSubs.heightAnchor)// height
        subviewArray[currentViewValue].view.leadingAnchor.constraint(equalTo: ContainerViewForSubs.leadingAnchor)//leading
        subviewArray[currentViewValue].view.trailingAnchor.constraint(equalTo: ContainerViewForSubs.trailingAnchor)// tralling all equal to the container
        subviewArray[currentViewValue].view.bottomAnchor.constraint(equalTo: ContainerViewForSubs.bottomAnchor)// bottom
        subviewArray[currentViewValue].view.topAnchor.constraint(equalTo: ContainerViewForSubs.topAnchor)//top
        subviewArray[currentViewValue].view.centerXAnchor.constraint(equalTo: ContainerViewForSubs.centerXAnchor)//x-centra
        subviewArray[currentViewValue].view.centerYAnchor.constraint(equalTo: ContainerViewForSubs.centerYAnchor)//y-centra
    }
    //// kept in a seperate methods in the event that the code needs to be used over again as seeen in the muse mvc... the logic needed to be seperate from the functional click... same will go here
    
    func FavsViewValueUpdater(){
        FavsViewValue = FavsViewValue + 1// to be called to update view value for the sub views as ussual...
    }
    func FavsViewValeuDownDater(){
        FavsViewValue = FavsViewValue - 1
    }

    
    
    
    
    func IntialViewLoad(){
        subviewArray = CaseArrayOfDataInOrder()
        ConstraintsToSubView()
        addingChild(subviewArray[currentViewValue])
        
    }
    
    func HeartChecker(){
        StateFavsSingletonClass.share.FavCompareContrast(Which: WhichValue, Current: currentViewValue)
        if StateFavsSingletonClass.share.HeartBoolean == true{
            FavsBotton.setImage(#imageLiteral(resourceName: "MarkMaryFullHeart") , for: .normal)/// image literal full heart heart here bro
            //FavsButtonImmage.image = #imageLiteral(resourceName: "MarkMaryFullHeart")
        }else{
            FavsBotton.setImage(#imageLiteral(resourceName: "MarkMaryEmptyHeart"), for: .normal)///image literal empty heart here bro
            //FavsButtonImmage.image = #imageLiteral(resourceName: "MarkMaryEmptyHeart")
        }
        
    }
    
    
    func nextLogic(){
        if StateFavsSingletonClass.share.FavsBoolean == false{
        if currentViewValue < subviewArray.count-1{
        removeChild(subviewArray[currentViewValue])// not removing the same one added need to make an instance of the value that is to be added
        ViewCounterUpDater()
        ViewControlToAdd = subviewArray[currentViewValue]
        subviewArray = CaseArrayOfDataInOrder()
        /// To stop the logic from going out of the index
        var LeavingSubViewCount = currentViewValue - 1// removing values to views back
        addingChild(subviewArray[currentViewValue])/// logic of adding current
        ConstraintsToSubView()
        ProgressBarUpDaterFunction()/// updates the progress bar on click mother fucka
        HiddenProgressBarUpDaterFunction()
        //////For heart Boolean check
            ///self explainitory, checking to see if the heart is checked... for this subviews

            //pushingChildToSuper(subviewArray[currentViewValue])// logic of displaying current
//        if LeavingSubViewCount >= 0{
//        removeChild(subviewArray[LeavingSubViewCount])// removes the previous subview and adds\ the new one in
//        }
        }else{
            /// logic for prompting a pop up telling the view of  the end
        }
        ///calling these value here such that if favs functionalty is used then it can store the proper view value that is passed into the singlton class
    
        /// end of first if statement
        }else{
            FavsViewValueUpdater()
       
            addingChild(subviewArray[currentViewValue])//this should obviously work because in order to like something in the firest placa there exist a requirement for that data to also exist... abd because the which value and current view value are determiners in the view that gets displayed in the first place then this should keep certainty
             ConstraintsToSubView()
            

        }
        
        storeRecentInUserDefaults()// stores recent view values such that it can go directly to where the user left off
        HiddenAndRegularProgressoFunc()//Updates the progresso and the hidden progresso to reflect the number of views
    }
    

    //}
    func backLogic(){
        if StateFavsSingletonClass.share.FavsBoolean == false{
        if currentViewValue >= 0{
            removeChild(subviewArray[currentViewValue])
        ViewCounterDownDater()
        var IncomingSubViewCount = currentViewValue + 1
        subviewArray = CaseArrayOfDataInOrder()
            ViewControlToAdd = subviewArray[currentViewValue]
        addingChild(subviewArray[currentViewValue])// logic of adding current view
        ConstraintsToSubView()// will use this to re adjust the view controller
        //pushingChildToSuper(subviewArray[currentViewValue])//logic of displaying current view
        ProgressBarDownDaterFunction()/// updates the progress bar on click mother fucka
        HiddenProgressBarDownDaterFunction()/// downdates the hidden progress bar
        ///self explainitory, checking to see if the heart is checked... for this subviews
     
        
        }else{
            //// space for prompting the user that this is the furthest back you can go
        }
        ///calling these value here such that if favs functionalty is used then it can store the proper view value that is passed into the singlton class

    
        }else{
            
        }
        storeRecentInUserDefaults()
        HiddenAndRegularProgressoFunc()//Updates the progresso and the hidden progresso to reflect the number of views

    }
    @IBAction func NextButton(_ sender: Any) {
        nextLogic() ///animations for forwad here
        ConstraintsToSubView()
        PaginaSingleton.share.PaginaURL = displayPagina()!
        HeartChecker()/// should check it on click

    }
    
    @IBAction func BackButton(_ sender: Any) {
        backLogic() /// animations for back here
        PaginaSingleton.share.PaginaURL = displayPagina()!
        HeartChecker()/// should check it on click

    }
    //////////// ALL the non view container functionality
    @IBAction func BackToTableOCButton(_ sender: Any) {
        StateFavsSingletonClass.share.StoreRecentWhich = WhichValue
        StateFavsSingletonClass.share.StoreRecentCUrrent = currentViewValue
        StateFavsSingletonClass.share.RecentLocationCurrentFunction(RecentWhich: WhichValue, RecentCurrent: currentViewValue)//stores most recent location here to be used
        
        
        dismiss(animated: true, completion: nil)/// animation closure will be added here
    }
    
    func ViewDiDAppearForChild(){
        /// made up method for reloading the child view for Night and Day Mode Functionality
        subviewArray = CaseArrayOfDataInOrder()
        //removeChild(subviewArray[currentViewValue])
        addingChild(subviewArray[currentViewValue])
       // pushingChildToSuper(subviewArray[currentViewValue])
    }
    
   
    
    func NightModeFunctionality(){
//        if NightModeSingletonClass.share.NightModeBoolean == true{
            self.ColorConsitentView.backgroundColor = #colorLiteral(red: 0.1637933552, green: 0.1756276488, blue: 0.2069563866, alpha: 1)  //StateFavsSingletonClass.share.NightModeBackgroundColor
            TitoloLable.textColor = .white
            BackButtonVar.setTitleColor(.white, for: .normal)
            NextButtonVar.setTitleColor(.white, for: .normal)
            PreviousButtonVar.setTitleColor(.white, for: .normal)
            ConstraintsToSubView()
            var frostedBack : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
            BackView.addSubview(frostedBack)
            frostedBack.frame = BackView.bounds
            
            BackView.layer.cornerRadius = 10.0
            BackView.clipsToBounds = true
            
            
            var frostedNext : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
            NextView.addSubview(frostedNext)
            frostedNext.frame = NextView.bounds
            
            NextView.layer.cornerRadius = 10.0
            NextView.clipsToBounds = true
          
           
//        }else{
//            ColorConsitentView.backgroundColor = .white
//            BackButtonVar.setTitleColor(.black, for: .normal)
//            NextButtonVar.setTitleColor(.black, for: .normal)
//            PreviousButtonVar.setTitleColor(.black, for: .normal)
//            TitoloLable.textColor = .black
//            ConstraintsToSubView()
//             //viewDidAppear(true)
//            var frostedBack : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
//            BackView.addSubview(frostedBack)
//            frostedBack.frame = BackView.bounds
//
//            BackView.layer.cornerRadius = 10.0
//            BackView.clipsToBounds = true
//
//
//            var frostedNext : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
//            NextView.addSubview(frostedNext)
//            frostedNext.frame = NextView.bounds
//
//            NextView.layer.cornerRadius = 10.0
//            NextView.clipsToBounds = true
//
//        }
    }
    
    
    func CallForRuleReset(){
           PreviousButtonVar.bottomAnchor.constraint(equalTo: MuseArtistaLable.bottomAnchor ).isActive = false
        PreviousButtonVar.bottomAnchor.constraint(equalTo: ViewPickerControlResetView.bottomAnchor).isActive = false// six upward
        ViewPickerContainer.bottomAnchor.constraint(equalTo: MuseResetConstraintView.bottomAnchor).isActive = false
        ViewPickerContainer.topAnchor.constraint(equalTo: MuseResetConstraintView.topAnchor).isActive = false
        ViewPickerContainer.leadingAnchor.constraint(equalTo: MuseResetConstraintView.leadingAnchor).isActive = false
        ViewPickerContainer.trailingAnchor.constraint(equalTo: MuseResetConstraintView.trailingAnchor).isActive = false
        ViewPickerContainer.heightAnchor.constraint(equalTo: MuseResetConstraintView.heightAnchor).isActive = false
        ViewPickerContainer.widthAnchor.constraint(equalTo: MuseResetConstraintView.widthAnchor).isActive = false
    }
    
    
    var CollapseViewBoolean = false
    var previousBottomConstraint : NSLayoutConstraint?/// set to optional to be set to a value if need be
    
    @IBOutlet weak var HiddenNextView: UIView!
    @IBOutlet weak var HiddenBackView: UIView!
    @IBOutlet weak var HiddenNextButtonVar: UIButton!/// NextView
    @IBOutlet weak var HiddenPreviousButtonVar: UIButton!/// PreviousView
    @IBOutlet weak var HiddenProgresso: UIProgressView!
    
    func DisplayStyleForHiddenControl(){
        /// hidden back style:
        var frostedBack : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        HiddenBackView.addSubview(frostedBack)
        frostedBack.frame = HiddenBackView.bounds
        
        HiddenBackView.layer.cornerRadius = 10.0
        HiddenBackView.clipsToBounds = true
        /// hidden next style:
        var frostedNext : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        HiddenNextView.addSubview(frostedNext)
        frostedNext.frame = HiddenNextView.bounds
        
        HiddenNextView.layer.cornerRadius = 10.0
        HiddenNextView.clipsToBounds = true
        /// Hidden Progress Display style:
        /// for transfomring and rounding out the view progress view:
        HiddenProgresso.trackTintColor = StateFavsSingletonClass.share.ProgressoUnfilledSection
        HiddenProgresso.progressTintColor = StateFavsSingletonClass.share.ProgressoProgressColor
        HiddenProgresso.tintColor = StateFavsSingletonClass.share.progressoProgressFillsection
        HiddenProgresso.transform = HiddenProgresso.transform.scaledBy(x: 1.0 , y: 1.0)
        HiddenProgresso.layer.cornerRadius = 10.0/// rounding out the corner of the animation layer's radius
        HiddenProgresso.clipsToBounds = true
        HiddenProgresso.layer.sublayers![1].cornerRadius = 10.0
        HiddenProgresso.subviews[1].clipsToBounds = true
        
        
        //regular progresso Layout stuff:
        Progresso.trackTintColor = StateFavsSingletonClass.share.ProgressoUnfilledSection
        Progresso.progressTintColor = StateFavsSingletonClass.share.ProgressoProgressColor
        Progresso.tintColor = StateFavsSingletonClass.share.progressoProgressFillsection
        Progresso.transform = Progresso.transform.scaledBy(x: 1.0 , y: 1.0)
        Progresso.layer.cornerRadius = 10.0/// rounding out the corner of the animation layer's radius
        Progresso.clipsToBounds = true
        Progresso.layer.sublayers![1].cornerRadius = 10.0
        Progresso.subviews[1].clipsToBounds = true
        
    }
    func HiddenAndRegularProgressoFunc(){
        var ProgressRatio = Float( currentViewValue / subviewArray.count )// this ratio should be less than or equal to one
//        HiddenProgresso.progress = ProgressRatio
//        Progresso.progress = ProgressRatio
        HiddenProgresso.setProgress(ProgressRatio, animated: true)
        Progresso.setProgress(ProgressRatio, animated: true)
        // this function opperates to update the view on the current progress of it's display making the ratio one to one based current view value divided by the number of view
    }
    
    //// progress bar logic forward and back logic
    func HiddenProgressBarUpDaterFunction(){
        // logic
        ///Vestage method
    }
    func HiddenProgressBarDownDaterFunction(){
        //logic
        // VESTIGE METHOD!
    }
    /// END of progress bar forward and back logic
    
    @IBAction func HiddenBackFunction(_ sender: Any) {
        backLogic() /// animations for back here
        PaginaSingleton.share.PaginaURL = displayPagina()!
        HeartChecker()/// should check it on click
    }
    @IBAction func HiddenNexFunction(_ sender: Any) {
        nextLogic() ///animations for forwad here
        ConstraintsToSubView()
        PaginaSingleton.share.PaginaURL = displayPagina()!
        HeartChecker()/// should check it on click
    }
    
    var MuseVisibiltyBoolean : Bool =  true/// default to false which means anything added here to false must be attributable to the view:
    func MuseVisibiltiyFunc(){
    MuseVisibiltyBoolean = !MuseVisibiltyBoolean
    var OppositeBoolean = !MuseVisibiltyBoolean
            //three objects to be visible on intial load... where museVisibility is down:
            MuseVisibilityDown.isHidden = MuseVisibiltyBoolean
            CollapseMuseButton.isHidden = MuseVisibiltyBoolean
            Progresso.isHidden = MuseVisibiltyBoolean
            NextButtonVar.isHidden = MuseVisibiltyBoolean
            PreviousButtonVar.isHidden = MuseVisibiltyBoolean
            NextView.isHidden = MuseVisibiltyBoolean
            BackView.isHidden = MuseVisibiltyBoolean
            //the whole set of Objects to be visible when the muse bar is called to be displayed:
            ViewPickerContainer.isHidden = OppositeBoolean
            CollapseMuseButton.isHidden = OppositeBoolean
            HiddenNextView.isHidden = OppositeBoolean
            HiddenBackView.isHidden = OppositeBoolean
            HiddenNextButtonVar.isHidden = OppositeBoolean
            HiddenPreviousButtonVar.isHidden = OppositeBoolean
            HiddenProgresso.isHidden = OppositeBoolean
            MuseVisibilityUp.isHidden = OppositeBoolean
            HiddenDisplayTable.isHidden = OppositeBoolean
 
    }
    
    
    
    //Animation Functions:
    
    func AnimateViewPicker(){
        
        self.HiddenBackView.translatesAutoresizingMaskIntoConstraints = false
        self.HiddenNextView.translatesAutoresizingMaskIntoConstraints = false
        self.HiddenNextButtonVar.translatesAutoresizingMaskIntoConstraints = false
        self.HiddenPreviousButtonVar.translatesAutoresizingMaskIntoConstraints = false
        self.ViewPickerView.translatesAutoresizingMaskIntoConstraints = false
        self.HiddenDisplayTable.translatesAutoresizingMaskIntoConstraints = false
        self.CollapseMuseButton.translatesAutoresizingMaskIntoConstraints = false
        self.MuseVisibilityUp.translatesAutoresizingMaskIntoConstraints = false
        self.HiddenProgresso.translatesAutoresizingMaskIntoConstraints = false
        
        
         
         self.ViewPickerContainer.transform = CGAffineTransform(translationX: 0 , y: 85)
        
         self.HiddenDisplayTable.transform = CGAffineTransform(translationX: -30, y: 0)
         self.HiddenNextView.transform = CGAffineTransform(translationX: 0, y: 100)
         self.HiddenBackView.transform = CGAffineTransform(translationX: 0, y: 100)
         self.HiddenPreviousButtonVar.transform = CGAffineTransform(translationX: 0, y: 100)
         self.HiddenNextButtonVar.transform = CGAffineTransform(translationX: 0 , y: 100)
        
        self.CollapseMuseButton.transform = CGAffineTransform(translationX: 0, y: 100)
        self.MuseVisibilityUp.transform = CGAffineTransform(translationX: 0, y: 100)
        self.HiddenProgresso.transform = CGAffineTransform(translationX: 0, y: 100)
        
        UIView.animate(withDuration: 1.0, delay: 0.0 , usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseIn , animations:{ ()-> Void in
            //animation section for view
        self.MuseVisibiltiyFunc()
            

            
            UIView.animate(withDuration: 3.0, delay: 0.0 , usingSpringWithDamping: 1.0, initialSpringVelocity: 0.2, options: .curveEaseIn , animations:{ ()-> Void in
                
                self.ViewPickerView.translatesAutoresizingMaskIntoConstraints = true
                self.HiddenDisplayTable.translatesAutoresizingMaskIntoConstraints = true
                self.animateNextPreviousDimiss()

            }, completion: nil)
            
        }, completion: nil)
        
        
    }
    
    func animateNextPreviousDimiss(){
        
        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveEaseIn, animations: { ()->Void in
        
        self.ViewPickerContainer.transform = CGAffineTransform(translationX: 0 , y: 0)
        self.HiddenDisplayTable.transform = CGAffineTransform(translationX: 0, y: 0)
        self.HiddenNextView.transform = CGAffineTransform(translationX: 0, y: 0)
        self.HiddenBackView.transform = CGAffineTransform(translationX: 0, y: 0)
        self.HiddenPreviousButtonVar.transform = CGAffineTransform(translationX: 0, y: 0)
        self.HiddenNextButtonVar.transform = CGAffineTransform(translationX: 0 , y: 0)
            
        self.CollapseMuseButton.transform = CGAffineTransform(translationX: 0, y: 0)
        self.MuseVisibilityUp.transform = CGAffineTransform(translationX: 0, y: 0)
        self.HiddenProgresso.transform = CGAffineTransform(translationX: 0, y: 0)
        
        self.CollapseMuseButton.translatesAutoresizingMaskIntoConstraints = true
        self.MuseVisibilityUp.translatesAutoresizingMaskIntoConstraints = true
        self.HiddenProgresso.translatesAutoresizingMaskIntoConstraints = true
        self.HiddenBackView.translatesAutoresizingMaskIntoConstraints = true
        self.HiddenNextView.translatesAutoresizingMaskIntoConstraints = true
        self.HiddenNextButtonVar.translatesAutoresizingMaskIntoConstraints = true
        self.HiddenPreviousButtonVar.translatesAutoresizingMaskIntoConstraints = true
        }, completion: nil)
    }
    
    func PrepareHiddenValuesForAnimation(_ BoolPass: Bool){
           ViewPickerContainer.transform = CGAffineTransform(translationX: 0 , y: 0)
           HiddenDisplayTable.transform = CGAffineTransform(translationX: 0, y: 0)
           HiddenNextView.transform = CGAffineTransform(translationX: 0, y: 0)
           HiddenBackView.transform = CGAffineTransform(translationX: 0, y: 0)
           HiddenPreviousButtonVar.transform = CGAffineTransform(translationX: 0, y: 0)
           HiddenNextButtonVar.transform = CGAffineTransform(translationX: 0 , y: 0)
               
           CollapseMuseButton.transform = CGAffineTransform(translationX: 0, y: 0)
           MuseVisibilityUp.transform = CGAffineTransform(translationX: 0, y: 0)
           HiddenProgresso.transform = CGAffineTransform(translationX: 0, y: 0)
           
           CollapseMuseButton.translatesAutoresizingMaskIntoConstraints = BoolPass
           MuseVisibilityUp.translatesAutoresizingMaskIntoConstraints = BoolPass
           HiddenProgresso.translatesAutoresizingMaskIntoConstraints = BoolPass
           HiddenBackView.translatesAutoresizingMaskIntoConstraints = BoolPass
           HiddenNextView.translatesAutoresizingMaskIntoConstraints = BoolPass
           HiddenNextButtonVar.translatesAutoresizingMaskIntoConstraints = BoolPass
           HiddenPreviousButtonVar.translatesAutoresizingMaskIntoConstraints = BoolPass
    }
    
    func PrepareDefaultViewPageContol(_ BoolPass : Bool){
        MuseVisibilityDown.translatesAutoresizingMaskIntoConstraints = BoolPass
        CollapseMuseButton.translatesAutoresizingMaskIntoConstraints = BoolPass
        Progresso.translatesAutoresizingMaskIntoConstraints = BoolPass
        NextButtonVar.translatesAutoresizingMaskIntoConstraints = BoolPass
        PreviousButtonVar.translatesAutoresizingMaskIntoConstraints = BoolPass
        NextView.translatesAutoresizingMaskIntoConstraints = BoolPass
        BackView.translatesAutoresizingMaskIntoConstraints = BoolPass
    }
    
    func ActuallyDissmissingMuseControl(){
        
        MuseVisibilityDown.translatesAutoresizingMaskIntoConstraints = false
        CollapseMuseButton.translatesAutoresizingMaskIntoConstraints = false
        Progresso.translatesAutoresizingMaskIntoConstraints = false
        NextButtonVar.translatesAutoresizingMaskIntoConstraints = false
        PreviousButtonVar.translatesAutoresizingMaskIntoConstraints = false
        NextView.translatesAutoresizingMaskIntoConstraints = false
        BackView.translatesAutoresizingMaskIntoConstraints = false
        
        MuseVisibilityDown.transform = CGAffineTransform(translationX: 0, y: 100)
        CollapseMuseButton.transform = CGAffineTransform(translationX: 0, y: 100)
        Progresso.transform = CGAffineTransform(translationX: 0, y: 100)
        NextButtonVar.transform = CGAffineTransform(translationX: 0, y: 100)
        PreviousButtonVar.transform = CGAffineTransform(translationX: 0, y: 100)
        NextView.transform = CGAffineTransform(translationX: 0, y: 100)
        BackView.transform = CGAffineTransform(translationX: 0, y: 100)
        
        PrepareHiddenValuesForAnimation(false)// I need to call this before the animation
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {()->Void in
            //setting animation controls
            self.ViewPickerContainer.transform = CGAffineTransform(translationX: 500 , y: 0)
            self.HiddenDisplayTable.transform = CGAffineTransform(translationX: -50, y: 0)
            self.HiddenNextView.transform = CGAffineTransform(translationX: 500, y: 0)
            self.HiddenBackView.transform = CGAffineTransform(translationX: 500, y: 0)
            self.HiddenPreviousButtonVar.transform = CGAffineTransform(translationX: 500, y: 0)
            self.HiddenNextButtonVar.transform = CGAffineTransform(translationX: 500 , y: 0)
                
            self.CollapseMuseButton.transform = CGAffineTransform(translationX: 500, y: 0)
            self.MuseVisibilityUp.transform = CGAffineTransform(translationX: 500, y: 0)
            self.HiddenProgresso.transform = CGAffineTransform(translationX: 500, y: 0)

        }, completion: {(_ Boolean : Bool)-> Void in
            //inside of the completion handler such that it begins under the circumstance that the animation befor it is completed
            self.MuseVisibiltiyFunc()
            self.SecondHalfOfDismissingMuseControl()
        })
    }
    
    func SecondHalfOfDismissingMuseControl(){
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: .curveEaseIn, animations: {()-> Void in
            // logic for setting up the animation controls
            self.MuseVisibilityDown.transform = CGAffineTransform(translationX: 0, y: 0)
            self.CollapseMuseButton.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Progresso.transform = CGAffineTransform(translationX: 0, y: 0)
            self.NextButtonVar.transform = CGAffineTransform(translationX: 0, y: 0)
            self.PreviousButtonVar.transform = CGAffineTransform(translationX: 0, y: 0)
            self.NextView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.BackView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.PrepareDefaultViewPageContol(true)
            
        }, completion: nil)
        
        PrepareHiddenValuesForAnimation(true)//May Need To Go in the next function
    }
    
    
    
    
    
    
    
    
    
    //All the button Calls:
    //All the button Calls:
    @IBOutlet weak var CollapseMuseButton : UIButton!
    @IBAction func CollapseMusButtonFunction(_ sender: Any){
        //MuseVisibiltiyFunc()
        ActuallyDissmissingMuseControl()//calling this function to present the lack of muse control with an animation
    }
    @IBAction func NightModeButtonFuncitonality(_ sender: Any) {
        //MuseVisibiltiyFunc()
        AnimateViewPicker()
    }
    
    
    /// GestureFunctions() Here:
    @IBAction func SwipeRightFunction(_ sender: Any) {
        backLogic()
        HeartChecker()/// should check it on click

    }
    
    @IBAction func SwipeLeftFunction(_ sender: Any) {
        nextLogic()
        ConstraintsToSubView()
        HeartChecker()/// should check it on click

    }
    /////AutoPlay And Replay Logic Below
    func AutoPlayUIFunction(){
        if StateFavsSingletonClass.share.MainAutoPlayBoolean == true{
           // AutoPlayPauseButtonVar.setImage(#imageLiteral(resourceName: "MarkMaryAutoPlayIndicatorUIButton") , for: .normal)//set the value to indicate object is active
           //  AutoReplayButtonVar.setImage( imageLiteral(resourceName: "MarkMaryControlMainContentReplay"), for: .normal)
            
            AutoPlayPauseImage.image = #imageLiteral(resourceName: "MarkMaryAutoPlayIndicatorUIButton")/// SetImage: Image Literal
            AutoReplayImage.image = #imageLiteral(resourceName: "MarkMaryControlMainContentReplay")/// Set replay image
           
        }else{
           // AutoPlayPauseButtonVar.setImage(#imageLiteral(resourceName: "MarkMaryControlMainContentPausePlay"), for: .normal)//set the value to indicate object is inactive
           // AutoReplayButtonVar.setImage(#imageLiteral(resourceName: "MarkMaryControlMainContentReplay"), for: .normal)
            
            
            AutoPlayPauseImage.image = #imageLiteral(resourceName: "MarkMaryControlMainContentPausePlay")/// SetImage: Image Literal
            AutoReplayImage.image = #imageLiteral(resourceName: "MarkMaryControlMainContentReplay")/// Set replay image
            

        }
    }
    /// GestureFunctions() ENds/
    @IBAction func StartAndStopAutoPlay(_ sender: Any) {
        StateFavsSingletonClass.share.MainAutoPlayBoolean = !StateFavsSingletonClass.share.MainAutoPlayBoolean// alteraing the boolean to be false/// may in the future connect it too the status of th audio playing
        StateFavsSingletonClass.share.SetAutoPlayStatus()
       SpeakEasyPlayPauseFuntionality()// with contingencies
        StateFavsSingletonClass.share.ResetStoreAutoPlayStatus()
        AutoPlayUIFunction()
    }
    
    @IBAction func ReplayThisAutoPlaySection(_ sender: Any) {
        SpeakEasyReplay()
    }
    
    
    
    
 
        
     lazy var DimissMuse : UITapGestureRecognizer = {
        let BottomTwo = UITapGestureRecognizer(target: self, action: #selector(TapDismissMuser))
        BottomTwo.numberOfTapsRequired = 2
        
        return BottomTwo
    }()
        
    //ContainerViewForSubs.addGestureRecognizer(DimissMuse)
    
    
   @objc func TapDismissMuser() {
        if ViewPickerContainer.isHidden == true{
            ViewPickerContainer.isHidden == false
            ViewPickerContainer.bottomAnchor.constraint(equalTo: ViewPickerView.bottomAnchor)
        }else{
            ViewPickerContainer.isHidden == true
            ViewPickerContainer.topAnchor.constraint(equalTo: ViewPickerView.bottomAnchor)
        }
    }
    

    /////////////////////////////
//// muse bottom bar functionality
    @IBAction func MusePlayPauseButton(_ sender: Any) {
        MuseSingleton.share.singletonPlyPause()

        if MuseSingleton.share.song.isPlaying != true {
            //UIIMage here pause UI Image here
        }else{
            //UIIMage here pause UIIMage here
        }
    }
    
    @IBAction func DisplayMuseViewButton(_ sender: Any) {
        /// displaying muse view controller on click here:
        let MuseStoryBoard : UIStoryboard = UIStoryboard(name: "MuseView", bundle: nil)
        if let MuseViewController = MuseStoryBoard.instantiateViewController(withIdentifier: "MuseMVCIdentifier")as? MuseMVC{
            self.present(MuseViewController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func DragDisplayMuse(_ sender: Any) {
        let MuseStoryBoard : UIStoryboard = UIStoryboard(name: "MuseView", bundle: nil)
        if let MuseViewController = MuseStoryBoard.instantiateViewController(withIdentifier: "MuseMVCIdentifier")as? MuseMVC{
            self.present(MuseViewController, animated: true, completion: nil)
        }
        
    }
    
    @IBOutlet weak var HiddenDisplayTable: UIButton!
    @IBAction func DisplayTableOC(_ sender : Any){
        let TableOCSB : UIStoryboard = UIStoryboard(name: "TableOC", bundle: nil )
        if let TableOCVC = TableOCSB.instantiateViewController(withIdentifier: "TableOC")as? TableOcClass{
            TableOCVC.WhichValuePass = WhichValue
                self.present(TableOCVC, animated: true, completion: nil)
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////////
    //FAVSLOGIC:
    //FAVSLOGIC:
   lazy var DoubleTapFav : UITapGestureRecognizer = {
        let DoubleTap = UITapGestureRecognizer(target: self, action: #selector(DoubleTapTrigger))
        DoubleTap.numberOfTapsRequired = 2
        return DoubleTap
    }()
    
    @objc func DoubleTapTrigger(){
        
        if StateFavsSingletonClass.share.HeartBoolean == true{
            
            StateOfFavsBooleanHasBeenAltered = true/// checks it true such that the next if statement can run code without an issue
            
            StateFavsSingletonClass.share.HeartBoolean = false// changes the state of the boolean
            HeartChecker()/// alteres the visual state of the object
            //Remove data logic:
            currentViewValue = currentViewValue + 0
            WhichValue = WhichValue + 0
            StateFavsSingletonClass.share.ResetAndStoreValue()
            StateFavsSingletonClass.share.OnLoadRestorePreviousData()
            StateFavsSingletonClass.share.RemoveFavData(WhichValue, currentViewValue)//removes data at its view value and saves after data has been removed
            StateFavsSingletonClass.share.ResetAndStoreValue()/// stores the new updated data after the array has been altered
            StateFavsSingletonClass.share.OnLoadRestorePreviousData()////sets the new data up to be altered
            print(StateFavsSingletonClass.share.PerspectFavArray)
        }
        if StateFavsSingletonClass.share.HeartBoolean == false && StateOfFavsBooleanHasBeenAltered == false {
            StateFavsSingletonClass.share.HeartBoolean = true
            StateFavsSingletonClass.share.takeFavsSessionData()/// this class remember takes data and passes it to be stored in another function... it also should print out the data appended/// to which it does check mfka
            
            currentViewValue = currentViewValue + 0
            // check for redundancies
            StateFavsSingletonClass.share.AppendFavData(Which: WhichValue, Current: currentViewValue)
            // stores data in there
            currentViewValue = currentViewValue + 0/// this is to remind the machine of the current view value before running the method
            HeartChecker()//updates the data after the value when data in the current is updated
            /// removal logic before which values go here:
            
            StateFavsSingletonClass.share.AppendWhichArrayValue(Which: WhichValue)
            print(" Number Of which values ideally added equals :\(numberOfWhichValuesAdded)")
            numberOfWhichValuesAdded = numberOfWhichValuesAdded + 1
            print(StateFavsSingletonClass.share.WhichArrayStorage)//
            /// delete data if it preexists.... all that is required is to compare view values in that class based on rather or not the true or false boolean exists
            
            /// Search For Redundancies... before adding
            StateFavsSingletonClass.share.ResetAndStoreValue()/// this should store the values when as soon as data is added.. this also works very well for deleting data also... because any data that is added that is unwanted is can just as easily be deleted and saved just as quick, so long as it exists above this statement
        }
        StateOfFavsBooleanHasBeenAltered = false// changed back to it's original state after use
        print(StateFavsSingletonClass.share.PerspectFavArray)
    }
    

    var numberOfWhichValuesAdded = 1
    
    var StateOfFavsBooleanHasBeenAltered = false
    
    @IBAction func FavsButtonPressed(_ Sender: Any){
        
        
        if StateFavsSingletonClass.share.HeartBoolean == true{
            
            StateOfFavsBooleanHasBeenAltered = true/// checks it true such that the next if statement can run code without an issue
            
            StateFavsSingletonClass.share.HeartBoolean = false// changes the state of the boolean
            HeartChecker()/// alteres the visual state of the object
            //Remove data logic:
            currentViewValue = currentViewValue + 0
            WhichValue = WhichValue + 0
            StateFavsSingletonClass.share.ResetAndStoreValue()
            StateFavsSingletonClass.share.OnLoadRestorePreviousData()
            StateFavsSingletonClass.share.RemoveFavData(WhichValue, currentViewValue)//removes data at its view value and saves after data has been removed
            StateFavsSingletonClass.share.ResetAndStoreValue()/// stores the new updated data after the array has been altered
            StateFavsSingletonClass.share.OnLoadRestorePreviousData()////sets the new data up to be altered
            print(StateFavsSingletonClass.share.PerspectFavArray)
        }
        if StateFavsSingletonClass.share.HeartBoolean == false && StateOfFavsBooleanHasBeenAltered == false {
        StateFavsSingletonClass.share.HeartBoolean = true
        StateFavsSingletonClass.share.takeFavsSessionData()/// this class remember takes data and passes it to be stored in another function... it also should print out the data appended/// to which it does check mfka
        
        currentViewValue = currentViewValue + 0
            // check for redundancies
        StateFavsSingletonClass.share.AppendFavData(Which: WhichValue, Current: currentViewValue)
        // stores data in there
        currentViewValue = currentViewValue + 0/// this is to remind the machine of the current view value before running the method
        HeartChecker()//updates the data after the value when data in the current is updated
        /// removal logic before which values go here:
        
        StateFavsSingletonClass.share.AppendWhichArrayValue(Which: WhichValue)
        print(" Number Of which values ideally added equals :\(numberOfWhichValuesAdded)")
        numberOfWhichValuesAdded = numberOfWhichValuesAdded + 1
        print(StateFavsSingletonClass.share.WhichArrayStorage)//
        /// delete data if it preexists.... all that is required is to compare view values in that class based on rather or not the true or false boolean exists
        
            /// Search For Redundancies... before adding
        StateFavsSingletonClass.share.ResetAndStoreValue()/// this should store the values when as soon as data is added.. this also works very well for deleting data also... because any data that is added that is unwanted is can just as easily be deleted and saved just as quick, so long as it exists above this statement
        }
        StateOfFavsBooleanHasBeenAltered = false// changed back to it's original state after use
        print(StateFavsSingletonClass.share.PerspectFavArray)
        /*
        //maybe important but will need later than sooner
        if StateFavsSingletonClass.share.HeartBoolean == true {
            StateFavsSingletonClass.share.HeartBoolean = false
            HeartChecker()// updates the view to what was just checked
            /// if the heart is checked true then it should be unstored if it is clicked again
        }else{
            StateFavsSingletonClass.share.HeartBoolean = true/// should always be set to true
            HeartChecker()// updates the view to what was just checked
            /// if the heart is not checked true then it should be checked true and the data should be stored
        }
 */
        
    }//end of method bracket
 
        
        
    @IBAction func DoubleTapFavsButtonPressed(_ Sender: Any){
        
        
        if StateFavsSingletonClass.share.HeartBoolean == true{
            
            StateOfFavsBooleanHasBeenAltered = true/// checks it true such that the next if statement can run code without an issue
            
            StateFavsSingletonClass.share.HeartBoolean = false// changes the state of the boolean
            HeartChecker()/// alteres the visual state of the object
            //Remove data logic:
            currentViewValue = currentViewValue + 0
            WhichValue = WhichValue + 0
            StateFavsSingletonClass.share.ResetAndStoreValue()
            StateFavsSingletonClass.share.OnLoadRestorePreviousData()
            StateFavsSingletonClass.share.RemoveFavData(WhichValue, currentViewValue)//removes data at its view value and saves after data has been removed
            StateFavsSingletonClass.share.ResetAndStoreValue()/// stores the new updated data after the array has been altered
            StateFavsSingletonClass.share.OnLoadRestorePreviousData()////sets the new data up to be altered
            print(StateFavsSingletonClass.share.PerspectFavArray)
        }
        if StateFavsSingletonClass.share.HeartBoolean == false && StateOfFavsBooleanHasBeenAltered == false {
            StateFavsSingletonClass.share.HeartBoolean = true
            StateFavsSingletonClass.share.takeFavsSessionData()/// this class remember takes data and passes it to be stored in another function... it also should print out the data appended/// to which it does check mfka
            
            currentViewValue = currentViewValue + 0
            // check for redundancies
            StateFavsSingletonClass.share.AppendFavData(Which: WhichValue, Current: currentViewValue)
            // stores data in there
            currentViewValue = currentViewValue + 0/// this is to remind the machine of the current view value before running the method
            HeartChecker()//updates the data after the value when data in the current is updated
            /// removal logic before which values go here:
            
            StateFavsSingletonClass.share.AppendWhichArrayValue(Which: WhichValue)
            print(" Number Of which values ideally added equals :\(numberOfWhichValuesAdded)")
            numberOfWhichValuesAdded = numberOfWhichValuesAdded + 1
            print(StateFavsSingletonClass.share.WhichArrayStorage)//
            /// delete data if it preexists.... all that is required is to compare view values in that class based on rather or not the true or false boolean exists
            
            /// Search For Redundancies... before adding
            StateFavsSingletonClass.share.ResetAndStoreValue()/// this should store the values when as soon as data is added.. this also works very well for deleting data also... because any data that is added that is unwanted is can just as easily be deleted and saved just as quick, so long as it exists above this statement
        }
        StateOfFavsBooleanHasBeenAltered = false// changed back to it's original state after use
        print(StateFavsSingletonClass.share.PerspectFavArray)
        
    }//end of method bracket
    
    
    
    
    

    
    
 
}//// end of class



/*
 
 //PreviousButtonVar.bottomAnchor.constraint(equalTo: ViewPickerControlResetView.bottomAnchor).isActive = !CollapseViewBoolean
 
 /*-------------------------------------------
 if CollapseViewBoolean == true{
 CallForRuleReset()/// reseting all values and booleans
 MuseProgresso.isHidden = true
 MuseTimeLable.isHidden = true
 MusePlaPaOutlet.isHidden = true
 MuseDisplayMuseOutlet.isHidden = true
 MuseTitoloLable.isHidden = true
 MuseArtistaLable.isHidden = true
 MuseViewBackGroundView.isHidden = true
 PreviousButtonVar.bottomAnchor.constraint(equalTo: MuseArtistaLable.bottomAnchor ).isActive = true
 }else {
 CallForRuleReset()// reseting all values and booleans
 MuseProgresso.isHidden = false
 MuseTimeLable.isHidden = false
 MusePlaPaOutlet.isHidden = false
 MuseDisplayMuseOutlet.isHidden = false
 MuseTitoloLable.isHidden = false
 MuseArtistaLable.isHidden = false
 ViewPickerContainer.isHidden = false
 PreviousButtonVar.bottomAnchor.constraint(equalTo: ViewPickerControlResetView.bottomAnchor).isActive = true// six upward
 ViewPickerContainer.bottomAnchor.constraint(equalTo: MuseResetConstraintView.bottomAnchor).isActive = true
 ViewPickerContainer.topAnchor.constraint(equalTo: MuseResetConstraintView.topAnchor).isActive = true
 ViewPickerContainer.leadingAnchor.constraint(equalTo: MuseResetConstraintView.leadingAnchor).isActive = true
 ViewPickerContainer.trailingAnchor.constraint(equalTo: MuseResetConstraintView.trailingAnchor).isActive = true
 ViewPickerContainer.heightAnchor.constraint(equalTo: MuseResetConstraintView.heightAnchor).isActive = true
 ViewPickerContainer.widthAnchor.constraint(equalTo: MuseResetConstraintView.widthAnchor).isActive = true
 
 //should cause the frosted view to reappear when clicked
 var Frosted : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
 MuseViewBackGroundView.addSubview(Frosted)
 Frosted.frame = MuseViewBackGroundView.bounds/// effectively frosting
 }
 *///-------------------------------------------
 
 /*
 if ViewPickerContainer.isHidden != true{
 ViewPickerContainer.isHidden = true
 ViewPickerContainer.topAnchor.constraint(equalTo: ViewPickerView.bottomAnchor).isActive = true
 }else{
 ViewPickerContainer.isHidden = false
 ViewPickerContainer.bottomAnchor.constraint(equalTo: ViewPickerView.bottomAnchor).isActive = true
 ViewPickerContainer.heightAnchor.constraint(equalToConstant: 85.0 ).isActive = true
 }
 */
 
 /*
 
 NightModeSingletonClass.share.NightModeBoolean = !NightModeSingletonClass.share.NightModeBoolean/// there's only one important item in there which is the "!" to turn the night mode boolean on and off on click of this button here
 NightModeFunctionality()
 */
 // viewDidAppear(true)// placed here to reload view rather than in the logic method above
 
 collapse method:
 
 ViewPickerContainer.isHidden = true
 CollapseMuseButton.isHidden = true
 HiddenNextView.isHidden = true
 HiddenBackView.isHidden = true
 HiddenNextButtonVar.isHidden = true
 HiddenPreviousButtonVar.isHidden = true
 HiddenProgresso.isHidden = true
 MuseVisibilityUp.isHidden = true
 // this view and it's visibility is deterined here
 MuseVisibilityDown.isHidden = false
 
 CollapseViewBoolean = false
 Progresso.isHidden = false
 // progresso view needs to fit the actual values
 
 
 
 
 
 
 
 nightmode method:
 CollapseViewBoolean = false
 ViewPickerContainer.isHidden = CollapseViewBoolean
 CollapseMuseButton.isHidden = CollapseViewBoolean
 HiddenNextView.isHidden = CollapseViewBoolean
 HiddenBackView.isHidden = CollapseViewBoolean
 HiddenNextButtonVar.isHidden = CollapseViewBoolean
 HiddenPreviousButtonVar.isHidden = CollapseViewBoolean
 HiddenProgresso.isHidden = CollapseViewBoolean
 // this view and it's visibility is deterined here
 MuseVisibilityDown.isHidden = !CollapseViewBoolean
 MuseVisibilityUp.isHidden = CollapseViewBoolean
 
 Progresso.isHidden = !CollapseViewBoolean
 
 
 // reset the constraint ideally


 */
