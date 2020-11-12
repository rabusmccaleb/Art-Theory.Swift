//
//  TableOcCode.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 9/30/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation

class TableOcClass: TableOcData, UITableViewDelegate, UITableViewDataSource {
    ////UI Lables Place all here for ripe picking lol
    @IBOutlet weak var TitoloHeaderImageView: UIImageView!
    @IBOutlet weak var TableImageView: UIImageView!
    @IBOutlet weak var ViewTitolo: UILabel!
    @IBOutlet weak var SectionTitolo: UILabel!
    @IBOutlet weak var LogoTitolo: UIImageView!
    @IBOutlet weak var WordedLogoTitolo: UIImageView!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var AutoStartNStopButton: UIButton!
    @IBOutlet weak var AutoDirectButton: UIButton!
    @IBOutlet weak var MuseProgresso: UIProgressView!
    @IBOutlet weak var MuseControlBackgroundView: UIView!
    @IBOutlet weak var TableOCMainView: UIView!
    @IBOutlet weak var GradientVIew: UIView!
    @IBOutlet weak var FrostedHeaderVIew: UIView!
    @IBOutlet weak var MuseControl: UIView!
    @IBOutlet weak var BackGroundMuseImage : UIImageView!
    
    ///UITable Declarations:
    @IBOutlet weak var TableOCTable: UITableView!
    let tableIdentifier1 = "SectionType"
    let tableIdentifier2 = "ContentType"
    
    /// muse control here begins--> The functional system should be the same the vars are here to alter a the image view behind it an give animations
    @IBOutlet weak var MuseViewControl: UIView!
    @IBOutlet weak var MusePLPaButton: UIButton!
    @IBOutlet weak var MuseTitolo: UILabel!
    @IBOutlet weak var MuseTime: UILabel!
    @IBOutlet weak var MuseArtista: UILabel!
    @IBOutlet weak var DisplayMuseView: UIButton!
        //// view didload function
        //// view didload function
    
    override func viewWillAppear(_ animated: Bool) {
         AutoDirectionButtonText()
        let RadiusDouble : CGFloat = 0.0
        let ImageNumberName : Int = 35
        MuseControl.layer.cornerRadius = RadiusDouble
        MuseControl.clipsToBounds = true
        if ImageSingleton.share.ImageString[StateFavsSingletonClass.share.ImaggineNumber] != nil{
            BackGroundMuseImage.image = StateFavsSingletonClass.share.ResizeAllImageWithImage(UIImage(contentsOfFile: ImageSingleton.share.ImageString[StateFavsSingletonClass.share.ImaggineNumber]!), BackGroundMuseImage)
        }
        
        ShowPlayFunction()
        DisplayMuseView.setBackgroundImage(#imageLiteral(resourceName: "MuseDisplayUI"), for: .normal)
        MuseProgresso.trackTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) //went for transparent
        MuseProgresso.progressTintColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TableOCMainView.layer.cornerRadius = 12.5
        self.TableOCMainView.clipsToBounds = true
        
        //MuseControlVisuals Displayed here:
        LogoTitolo.image = #imageLiteral(resourceName: "MarkMaryLogoControlTopContent")
        BackButton.setImage(#imageLiteral(resourceName: "ArrowUpdate"), for: .normal)// set the back button to back arrow... the data color ideal should not be altered
        MuseTitolos()

        NightModeDisplayFunctionality()
        /// setting gradient view background color and setting the view backgroundimage period
        
        var Gradient = CAGradientLayer()
        Gradient.colors = [StateFavsSingletonClass.share.BottomGradientBackgroundValue.cgColor , StateFavsSingletonClass.share.TopGradientBackgrounfValue.cgColor]// this is only here to check if the gradient is working
        Gradient.locations = [0.0, 0.7]// setting the gradient to about half the height
            //[StateFavsSingletonClass.share.TopGradientBackgrounfValue.cgColor, StateFavsSingletonClass.share.BottomGradientBackgroundValue.cgColor]
        Gradient.frame = GradientVIew.bounds/// will allign... bro coding needs emojis
        GradientVIew.layer.insertSublayer(Gradient, at: 0)/// inserting the gradient layer at the layer height zero
        ///TableUIDesign:
        TableImageView.image = #imageLiteral(resourceName: "MarkMarySoftTransParency") //setting the UIImageView background here
        TitoloHeaderImageView.image = TableImageView.image//
        ///Visual Display Information:
        AutoDirectButton.titleLabel?.textColor = .white
        AutoDirectButton.backgroundColor = StateFavsSingletonClass.share.TableOCViewButtonBackgroundColor
        AutoDirectButton.layer.cornerRadius = 25.0
        AutoDirectButton.clipsToBounds = true
        AutoDirectionButtonText()
       // AutoDirectButton.layer.sublayers![1]// under the condition that I do need it here we are
        ///Visual Display Infromation End:
        ViewTitolo.text = ReturnViewTitloString()
        SectionTitolo.text = "Table Of Contents"
        
        TableSort()
        TableOCTable.backgroundView?.backgroundColor = .clear
        TableOCTable.backgroundColor? = .clear
        
         var FrostedHead : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))// is light now but will be altered back to dark once I'm certain that it is functioning properly
        FrostedHeaderVIew.addSubview(FrostedHead)
        FrostedHead.frame = FrostedHeaderVIew.bounds
       
        //Three line code logic for frosted window visual effect on the musebar below
        var Frosted : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        MuseControlBackgroundView.addSubview(Frosted)
        Frosted.frame = MuseControlBackgroundView.bounds
        
        /// All calls for setting up UITableOCData:
        self.TableOCTable.register(UITableViewCell.self, forCellReuseIdentifier: tableIdentifier1)
        TableOCTable.delegate = self
        TableOCTable.dataSource = self
        
        
        
        
    }
    
    
    
    
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    
    //// TableContentVarsAndArrays:
    var GlobalArray = [String]()
    var GlobalArrayKeys = [Int]()///for storing the key values to be clicked on in the did select method
    var GlobalSectionCount = [Int]()/// for display indexing style
    var GlobalContentCount = [Int]()/// for display indexing style
    var SectionArrayValues = [String]()/// for strings to be displayed
    var SectionArrayKeys = [Int]()/// for keeping track of key for current viewvalue
    var ContentArrayValues = [String]()/// for strings to be displayed
    var ContentArrayKeys = [Int]()/// for keeping track of key for current viewvalues
    ////instance of main data class
    let Model = mainDataClass()// instance of main data class to pull the dictinary values
    
    var WhichValuePass : Int = 0
    var CurrentViewFromTableOC : Int = 0
    var StringFromModel : String?
    
    
    func UIDisplayLableFunction(){
        ViewTitolo.textColor = StateFavsSingletonClass.share.FontBlue
        SectionTitolo.textColor = StateFavsSingletonClass.share.FontDarkBlue
    }
    
    
    func AutoDirectionButtonText(){
        // setting up the data to display based on if content in this view has already been previously added
           // AutoDirectButton.titleLabel?.text = StateFavsSingletonClass.share.ContinueLable
    }
    
    func ReturnViewTitloString()->String{
        switch WhichValuePass {
        case 0:
            let elem = "Elements:"
            return elem
            break
        case 1:
            let col = "Color:"
            return col
            break
        case 2:
            let shape = "Shape:"
            return shape
            break
        case 3 :
            let perspect = "Perspective:"
            return perspect
            break
        case 4 :
            let expression = "Expression:"
            return expression
            break
        case 5:
            let prac = "Art Philosphy:"
            return prac
            break
        default:
            let defaultVar = "Error-LoadingTABLEData"
            return defaultVar
        }
    }
    
    func ReturningModelDictionarySection()->[[Int:String]]{
        switch WhichValuePass {
        case 0:
            var elem = ElemTableOcSection()
            return elem
            break
        case 1:
            var col = ColTableOcSection()
            return col
            break
        case 2:
            var shape = ShapeTableOcSection()
            return shape
            break
        case 3 :
            var perspect = PerspectTableOcSection()
            return perspect
            break
        case 4 :
            var expression = ExpressionTableOcSection()
            return expression
            break
        case 5:
            var prac = PracTableOcSection()
            return prac
            break
        default:
            var defaultVar = [[0: ""],[1:"ERROR"]]
            return defaultVar
        }
    }
    
    
    
    func ReturningModelDictionaryContent()->[[Int:String]]{
        switch WhichValuePass {
        case 0:
            var elem = ElemTableOcContent()
            return elem
            break
        case 1:
            var col = ColTableOcContent()
            return col
            break
        case 2:
            var shape = ShapeTableOcContent()
            return shape
            break
        case 3 :
            var perspect = PerspectTableOcContent()
            return perspect
            break
        case 4 :
            var expression = ExpressionTableOcContent()
            return expression
            break
        case 5:
            var prac = PracTableOcContent()
            return prac
            break
        default:
            var defaultVar = [[0: ""],[1:"ERROR"]]
            return defaultVar
        }
    }
    
    func TableDisplayLogic(){
        var TableSection : [[Int:String]] = ReturningModelDictionarySection()
        var TableContent : [[Int:String]] = ReturningModelDictionaryContent()
        var CellCount : Int = TableSection.count + TableContent.count// for even number of cells
        
        
    }
    
    
    /// placed up here as a flexable function to display view... can be called from the tableview to pass in valeus
    func DisplayViewFromStart(CurrentViewValue CurrentViewValue: Int){// made this function flexable
        
        let ViewPickSB : UIStoryboard = UIStoryboard(name: "ViewPicker", bundle: nil )
        
        if let ViewPickVC = ViewPickSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
            ViewPickVC.WhichValue  = WhichValuePass//Insuring that the user follows the proper section/// defaulted to what ever section we are in 
            ViewPickVC.currentViewValue = CurrentViewValue// instinating the user to initial view
            
            self.present(ViewPickVC, animated: true, completion: nil)
        }
        
    }
    
    /*                                      notes for me know for memory recall
     
     var GlobalArray = [String]()//// global array to store all strings
     
     CONDITIONAL:
     var GlobalSectionCount = [Int]()/// for display indexing style
     var GlobalContentCount = [Int]()/// for display indexing style
     
     CONDITIONAL:
     var SectionArrayKeys = [Int]()/// for keeping track of key for current viewvalue
     var ContentArrayKeys = [Int]()/// for keeping track of key for current viewvalues
    */
    func IterpretAndDisplay(TableValue Value : Int){
        /// Okay sooo functionality Notes:
        /*
         passing in a integer on click from the table..... this then triggeres a search for the value using a for loop that triggers a comparison between the value passed and the array of stored index values. Due to the nature of globalsectioncount and SectionArrayKeys being being a one to one relation, if an index value is found in one place then an index value would also be found there. which means you can pass the key from that location into the current view value
         */
        var CurrentViewValueSetter = 0
        for x in 0...GlobalSectionCount.count - 1{
            if GlobalSectionCount[x] == Value{
                CurrentViewValueSetter = SectionArrayKeys[x]
            }
        }
        for x in 0...GlobalContentCount.count-1{
            if GlobalContentCount[x] == Value{
                CurrentViewValueSetter = ContentArrayKeys[x]
            }
        }
        let TabeleSelectedSB : UIStoryboard = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let TableSelectedVC = TabeleSelectedSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? MainModelFunctionality{
            TableSelectedVC.currentViewValue = CurrentViewValueSetter
            self.present(TableSelectedVC, animated: true, completion: nil)
        
        }
    }
    
    
    func TableSort(){
        // making an instance of the arrays to be added to the table
        var TableSection : [[Int: String]] = ReturningModelDictionarySection()
        var TableContent : [[Int:String]] = ReturningModelDictionaryContent()
        // Max and Min Valuse MaxMinUpdater
        var MaxMinUpdater = 0
        var min = 0 + MaxMinUpdater
        var max = 1 + MaxMinUpdater// min serves as a good pointer value
        // counters and pointers
        var ElementCounter = 0// for keeping track of the number of elements in the counter
        var ContentPointer = 0
        
        var sectionContentArray = [Int]()
        for j in 0...TableSection.count - 1 {
            for (key, element) in TableSection[j]{
                sectionContentArray.append(key)
            }
        }
        var minArrayIndexKey : Int = sectionContentArray[min]
        //Keeps the max value from going beyond the bound of the index
        var maxArrayIndexKey : Int = 0
        if max < TableSection.count{
        maxArrayIndexKey = sectionContentArray[max]
            }
        
        
        
        while max < TableSection.count{
            // appending min value
            for (key, element) in TableSection[min]{
            GlobalArray.append(element)
            SectionArrayKeys.append(key)
            GlobalSectionCount.append(ElementCounter)
            GlobalArrayKeys.append(key)
                //place for adding other values
                ElementCounter = ElementCounter + 1
            }
            // appending min value  END END END END
            for x in 0...TableContent.count - 1{
                for (key, element) in TableContent[x]{
                    if key > minArrayIndexKey && key < maxArrayIndexKey{
                        GlobalArray.append(element)
                        ContentArrayKeys.append(key)
                        GlobalContentCount.append(ElementCounter)
                        GlobalArrayKeys.append(key)
                        ElementCounter = ElementCounter + 1
                        ContentPointer = ContentPointer + 1// for keeping track of Content array location
            
                    }
                }
            }
            if max == TableSection.count - 1{
                for (key, element) in TableSection[max]{
                    GlobalArray.append(element)
                    SectionArrayKeys.append(key)
                    GlobalSectionCount.append(ElementCounter)
                    GlobalArrayKeys.append(key)
                    ElementCounter = ElementCounter + 1
                }
            }
            
            /// slider
            min = min + 1// updates these values
            max = max + 1
            // sliding the value over one
            
        }
        // conter value stops updating at this point because it is a chug and dump
        for i in ContentPointer...TableContent.count - 1{
            for(key, element) in TableContent[i]{
                GlobalArray.append(element)
                ContentArrayKeys.append(key)
                GlobalContentCount.append(ElementCounter)
                GlobalArrayKeys.append(key)
                ElementCounter = ElementCounter + 1
            }
        }
            
        print(GlobalArray)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let TableCell = tableView.dequeueReusableCell(withIdentifier: tableIdentifier1)as UITableViewCell?
       
        
        
        TableCell?.textLabel?.text = self.GlobalArray[indexPath.row]
        
        if GlobalSectionCount.count > 1{
           print(GlobalSectionCount)
        for j in 0...GlobalSectionCount.count - 1{
            if indexPath.row == GlobalSectionCount[j]{
                TableCell?.textLabel?.textColor = StateFavsSingletonClass.share.tableFontColor
                TableCell?.textLabel?.font = StateFavsSingletonClass.share.NormalTitleFont
                TableCell?.imageView?.frame = CGRect(x: 2.0, y: 2.0, width: 5.0, height: 5.0)
               // TableCell?.imageView?.image = #imageLiteral(resourceName: "TableYellowIndicator")
                TableCell?.backgroundView?.backgroundColor = .clear
                TableCell?.backgroundColor = .clear

            }
        }
        }else{
            print(GlobalSectionCount)
            
            if indexPath.row == GlobalSectionCount[0]{
                TableCell?.textLabel?.textColor = StateFavsSingletonClass.share.tableFontColor
                TableCell?.textLabel?.font = StateFavsSingletonClass.share.NormalTitleFont
                TableCell?.imageView?.frame = CGRect(x: 2.0, y: 2.0, width: 5.0, height: 5.0)
                // TableCell?.imageView?.image = #imageLiteral(resourceName: "TableYellowIndicator")
                TableCell?.backgroundView?.backgroundColor = .clear
                TableCell?.backgroundColor = .clear
                
            }
        }
        
        for x in 0...GlobalContentCount.count - 1{
            if indexPath.row == GlobalContentCount[x]{
                TableCell?.textLabel?.text = "      \(self.GlobalArray[indexPath.row])"
                TableCell?.textLabel?.textColor = .white
                TableCell?.textLabel?.font = StateFavsSingletonClass.share.RegularSmallTitleFont
                TableCell?.backgroundView?.backgroundColor = .clear
                TableCell?.backgroundColor = .clear
        }
            if indexPath.row == GlobalContentCount.count - 1{
                /// max value in the index path always
                TableCell?.separatorInset.bottom = 10.0// saying that when it reaches the last value set an inset/ the question of repeating values comes from the table view not having a set list
                TableCell?.backgroundView?.backgroundColor = .clear
                TableCell?.backgroundColor = .clear
            }
        }
        
        /* for addin display logic
        for x in 0...GlobalArray.count - 1 {
            for i in 0...GlobalSectionCount.count - 1{
            if indexPath.row == GlobalSectionCount[x]{
                TableCell?.textLabel?.textColor = StateFavsSingletonClass.share.FontBlue
                }
            }
        }
        */
      
        
        return TableCell!
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // will be used to travel to new view controller
        /// place for placing value value what happens on click of any index row
        var ViewValue = 0// worst case scenerio it starts you off at the initial view
        
        for x in 0...GlobalArrayKeys.count - 1{
            if indexPath.row == x {// compares values in the loop to the index path that was selected...
                ViewValue = GlobalArrayKeys[x]
            }
        }
            
        let ViewPickedSB : UIStoryboard = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let ViewPickedVC = ViewPickedSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
            ViewPickedVC.WhichValue = WhichValuePass
            ViewPickedVC.currentViewValue = ViewValue
            ViewPickedVC.modalTransitionStyle = .flipHorizontal
            
            self.present(ViewPickedVC, animated: true, completion: nil)
        }
        
    }
    
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
    /// TableViewFunctionality
//ENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDend
//ENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDendENDend
    

    func NightModeDisplayFunctionality(){
        // no use a longer used method/function

        
    }
    @IBAction func NIgthModeEnable(){
        
        NightModeDisplayFunctionality()
        viewDidAppear(true)
        /// for reloding view with new night mode display style
    }
    
    
    func displayViewAtValue(ViewValueSelected CurrentViewValuePass:Int){
        let viewPickerSB : UIStoryboard = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let ViewPickerVC = viewPickerSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
                ViewPickerVC.WhichValue = WhichValuePass
            ViewPickerVC.currentViewValue = CurrentViewValuePass
            self.present(ViewPickerVC, animated: true, completion: nil)/// for now the animation si just true soon there will be a closure with instructions to follow
        }
        
    }
    
    
    
    /// basic ibAction function calls
    @IBAction func AutoDirectButtonFunction(_ sender: Any) {
    DisplayViewFromStart(CurrentViewValue: 0)
        
    }
  
    
    
    @IBAction func DismissFunction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AutoStartNStopFunction(_ sender: Any) {
        /// haven't quite built yet
    }
    
    func ShowPlayFunction(){
        if MuseSingleton.share.song.isPlaying == true{
            MusePLPaButton.setBackgroundImage(#imageLiteral(resourceName: "MainMuseControlPauseUI"), for: .normal)
        }else{
            MusePLPaButton.setBackgroundImage(#imageLiteral(resourceName: "MainMuseControlPlayUI"), for: .normal)
        }
    }
    /// muse action functions:
    /// muse action functions:
    
    @IBAction func MusePaPLFunction(_ sender: Any) {
        MuseSingleton.share.singletonPlyPause()
        
        ShowPlayFunction()
    }
    
    func MuseTitolos(){
        var MuseDisplayTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(displayMuseTitolos), userInfo: nil, repeats: true)
    }
    
    @objc func displayMuseTitolos(){
        MuseTitolo.text = MuseSingleton.share.MuseTitoloGrab()
        MuseTime.text = MuseSingleton.share.NewTimeFunction()
        MuseArtista.text = MuseSingleton.share.DisplayArtista()
        
        var ProgressCurr = MuseSingleton.share.song.currentTime
        var ProgressDurr = MuseSingleton.share.song.duration
        var MuseRatio = Float(ProgressCurr / ProgressDurr)
        MuseProgresso.progress = MuseRatio
        MuseProgresso.setProgress(MuseRatio, animated: true)
        ShowPlayFunction()
        
    }
    @IBAction func DisplayMuseViewFunction(_ sender: Any) {
        let MuseStoryBoard : UIStoryboard = UIStoryboard(name: "MuseView", bundle: nil)
        if let MuseViewController = MuseStoryBoard.instantiateViewController(withIdentifier: "MuseMVCIdentifier")as? MuseMVC{
            self.present(MuseViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func DragMuseViewDisplay(_ sender: Any) {
        let MuseStoryBoard : UIStoryboard = UIStoryboard(name: "MuseView", bundle: nil)
        if let MuseViewController = MuseStoryBoard.instantiateViewController(withIdentifier: "MuseMVCIdentifier")as? MuseMVC{
            self.present(MuseViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func DraggDismissView(_ sender: Any ){
        dismiss(animated: true, completion: nil)
    }

    
    
    
}/// end of class brackets

