//
//  UIFavsDesignClass.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 10/30/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class UIDesignFavsClass : FavsMVC, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource{
    /// inherits the UIViewController from the its MVC Class and all of it's display logic will also comre from there
    
    ///Outlet Variables :
    @IBOutlet weak var DismissButton: UIButton!
    
    @IBOutlet weak var LogoUIImage: UIImageView!
    
    @IBOutlet weak var NotteModeButton: UIButton!
    
    @IBOutlet weak var PlaPaButton: UIButton!
    
    @IBOutlet weak var DisplayButton: UIButton!
    
    @IBOutlet weak var MuseTitoloLable: UILabel!
    
    @IBOutlet weak var MuseArtistaLable: UILabel!
    
    @IBOutlet weak var MuseTimeLable: UILabel!
    
    @IBOutlet weak var FavsCollection: UICollectionView!
    
    @IBOutlet weak var FavsTableView: UITableView!
    
    @IBOutlet weak var ShowAllFavsButton: UIButton!
    
    @IBOutlet weak var MuseProgressBar: UIProgressView!
    
     @IBOutlet weak var MuseBackGroundView: UIView!// for frosted window
    
    @IBOutlet weak var FavsContentView: UIView!
    
    @IBOutlet weak var EmptyFavsVIew: UILabel!
    
    @IBOutlet weak var EmptyFavsViewImage : UIImageView!
    
    @IBOutlet weak var MuseControlVIew : UIView!
    
    @IBOutlet weak var MuseViewBackGroundImage: UIImageView!
    
    var InstanceOfModleMVC = MainModelFunctionality()/// instance of the main model for the sake of calling and orgainizing data.... and using it a for comparison of the pre-existing data that was saved at a particular location...
    
    let TableID : String = "Table"
    var DataStorageForImageCollection = [[Int:UIImage]]()
    var DataStorageForStringCollection = [[Int:String]]()
    let collectionCellIdentifier : String = "FavCollectionCell"
    
    override func viewWillAppear(_ animated: Bool) {
        /// calling this class to run the logic to get the ball rolling on the favs data:
        ShowAllFavsButton.setBackgroundImage(#imageLiteral(resourceName: "MarkMaryPaginaDismissUI"), for: .normal)
        MuseControlVIew.layer.cornerRadius = 20.0
        MuseControlVIew.clipsToBounds = true
        MuseControlVIew.isHidden = true
        
        LogoUIImage.image = #imageLiteral(resourceName: "MarkMaryLogoControlTopContent") /// setting logo for view
        DismissButton.isHidden = true///hiding the dismiss button such that there isn't any confustion and to disallow any bugs from an action that can't be performed
        
        
        if ImageSingleton.share.ImageString[StateFavsSingletonClass.share.ImaggineNumber] != nil{
            
        MuseViewBackGroundImage.image = StateFavsSingletonClass.share.ResizeAllImageWithImage(UIImage(contentsOfFile: ImageSingleton.share.ImageString[StateFavsSingletonClass.share.ImaggineNumber]!), MuseViewBackGroundImage)
            
        }
        
        StateFavsSingletonClass.share.LoopFavValues()// runs the code to place the data into the arrays needed to run the logic proeperly
        DisplayInitalDisplay()
    
        SortImage()
        TestoPlaceData()
        CollectionViewSort()
        
        print("FavCollecitonData \(StateFavsSingletonClass.share.FavCollectionViewData)")
        print("FavTableData \(StateFavsSingletonClass.share.FavTableViewData)")
      if StateFavsSingletonClass.share.FavCollectionViewData.isEmpty == true &&
        StateFavsSingletonClass.share.FavTableViewData.isEmpty == true{
        EmptyFavsVIew.text = "Sorry at the moment you don't have any content saved..."
        EmptyFavsViewImage.image = #imageLiteral(resourceName: "MarkMaryIconSadFace")
        ShowAllFavsButton.isHidden = true
        
        
      }else{
        EmptyFavsVIew.isHidden = true
        EmptyFavsViewImage.isHidden = true
        
        }
    }
    //ViewDidLoad Function :
    override func viewDidLoad() {
        super.viewDidLoad()
        FavsContentView.layer.cornerRadius = 12.5
        FavsContentView.clipsToBounds = true
        
        MuseTimer()

        //Three line code logic for frosted window visual effect on the musebar below
     
        self.FavsCollection.delegate = self
        self.FavsCollection.dataSource = self
   // self.FavsCollection.register(FavsCustomTableCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
        DismissButton.setBackgroundImage(#imageLiteral(resourceName: "MarkMaryBackArrowUpdate"), for: .normal)
        
        var Frosted : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
             MuseBackGroundView.addSubview(Frosted)
             Frosted.frame = MuseBackGroundView.bounds
        
    
    }
    
    
    
    
    //Tradional Logic Functions:
    func NightModeFunctionality(){
        // no use a longer used method/function

    }// end of night modeFunctionality bracket
    
    func MuseTimer(){
        let MuseTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(DisplayMuseContent), userInfo: nil, repeats: true)
    }
    @objc func DisplayMuseContent(){
        MuseTitoloLable.text = MuseSingleton.share.DisplayTitolo()
        MuseArtistaLable.text = MuseSingleton.share.DisplayArtista()
        MuseTimeLable.text = MuseSingleton.share.NewTimeFunction()
        
        var MuseCurr = MuseSingleton.share.song.currentTime
        var MuseDurr = MuseSingleton.share.song.duration
        var MuseRatio = Float(MuseCurr / MuseDurr)
        MuseProgressBar.progress = MuseRatio
        MuseProgressBar.setProgress(MuseProgressBar.progress, animated: true)
    }
    
    
    
    
    //////// both table and collection view arrays stored here
    //////// both table and collection view arrays stored here
    //////// both table and collection view arrays stored here
    //////// both table and collection view arrays stored here:
 
    var TableWhichValue = [Int]()
    var TableViewValue = [Int]()
    var TableViewStrings = [String]()
    
    func CallForSort(){
        // no use a longer used method/function
    }
    //////// ENDED both table and collection view arrays stored here
    //////// ENDED both table and collection view arrays stored here
    //////// ENDED both table and collection view arrays stored here
    //////// ENDED both table and collection view arrays stored here:
    
    
    var CollectionWhichValue = [Int]()
    var CollectionCurrentValue = [Int]()
    var CollectionViewImmagine = [UIImage]()
    var TesterArray = [String]()
    
    func TesterFuncCall()->[String]{
        TesterArray.append("i")
        TesterArray.append("i")
        TesterArray.append("i")
        TesterArray.append("i")
        TesterArray.append("i")
        TesterArray.append("i")
        TesterArray.append("i")
        return TesterArray
    }
    
    func CollectionViewSort(){
        if StateFavsSingletonClass.share.FavCollectionViewData.isEmpty == false{
        for x in 0...StateFavsSingletonClass.share.FavCollectionViewData.count - 1{
            for(which , collectionDictionary) in StateFavsSingletonClass.share.FavCollectionViewData[x]{
                CollectionWhichValue.append(which)
                for(Current, ImmagineData) in collectionDictionary{
                        CollectionCurrentValue.append(Current)
                        CollectionViewImmagine.append(ImmagineData)
                    }//end of dictionary brackets for collection dictionary for loop
                }//end of for loop fo which, collections dictionary loop
            }// end of for loop for StateFavs FavsCollectionViewData
        }//end of checking if the FavCollectionViewData array is empty
    }//end of COllectionsViewSort data method... this is responsible for organizing data

    ////// CollectionViewControll Center:
    ////// CollectionViewControll Center:
    ////// CollectionViewControll Center:
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return TableViewTesto.count - 1// the addition of the amount of data/// which creates padding in the event that one equals zero
    }
    
    
    
    var ImmagineWhichArray = [Int]()// Stores the which location to be clicked on when the user needs to select that location
    var ImmagineCurrentArray = [Int]()// Stores the current location to be clicked on
    var ImmagineImageData = [UIImage]()// an array for storing the list of images to be displayed for this class
    var LocationDataAndInt = [[Int:[Int : Int]]]()
    var ImmagineDataAndInt = [[Int : UIImage]]()
    var IntForCollectionToComapare = [Int]()
    var EvenInt = 0
    var CounterForDisplayingImmagine = 0
    func SortImage(){
        if StateFavsSingletonClass.share.FavCollectionViewData.isEmpty == false{
        for x in 0...StateFavsSingletonClass.share.FavCollectionViewData.count - 1{
            for (which, ImageDictionary) in StateFavsSingletonClass.share.FavCollectionViewData[x]{
                ImmagineWhichArray.append(which)// adds which data to array to be clicked  on
                for (current, Immagine) in ImageDictionary{
                    ImmagineCurrentArray.append(current)// adds current data to array to in order to be clicked on
                    ImmagineImageData.append(Immagine)// adds the image data to the array in order to be displayed
                    ImmagineDataAndInt.append([ EvenInt : Immagine])// appends integer data and immagine such that it can be displayed along the index path that best matches its data for selection
                    LocationDataAndInt.append([EvenInt:[which : current]])// has both data for location and data for index path for selection method
                    IntForCollectionToComapare.append(EvenInt)// appends the values of that set of integers
                    EvenInt = EvenInt + 2// so it's 0,2,4,6,8,10
                }// end of for loop checking for Storing current values
            }// end of for loop checking for storing the which values
        }// end of for loop... looping through the entire statefavs array
        
    }// end of if statement checking rather or not the immage array is empty in genera
    }//end of sortImage method brackets
    
    func SettingItemsOrganization(){
    var FlowLayout = UICollectionViewFlowLayout()
        
        if StateFavsSingletonClass.share.FavsWidth != nil {
        FlowLayout.itemSize = CGSize(width: StateFavsSingletonClass.share.FavsWidth!, height: StateFavsSingletonClass.share.FavsWidth!)
        }// end of if statement to insure that the width object isn't set to nil
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath)as! FavCustomCollectionCell
        
        if StateFavsSingletonClass.share.FavsWidth != nil {
        CollectionCell.bounds.size = CGSize(width: StateFavsSingletonClass.share.FavsWidth!, height: StateFavsSingletonClass.share.FavsWidth!)
        CollectionCell.frame.size = CGSize(width: StateFavsSingletonClass.share.FavsWidth!, height: StateFavsSingletonClass.share.FavsWidth!)
            CollectionCell.insetsLayoutMarginsFromSafeArea = true
        }

        
        CollectionCell.layer.cornerRadius = 12.5
        CollectionCell.clipsToBounds = true
        if TableViewTesto.isEmpty == false || CollectionViewImmagine.isEmpty == false{

        
            if EvenIntHelperCheck(indexPath.row) == true{
            for(IndexValue, immagine) in ImmagineDataAndInt[indexPath.row]{
                CollectionCell.ImmagineVar.image = immagine
//                CollectionCell.ImmagineVar.image = ImmagineImageData[CounterForDisplayingImmagine]
//
//                if CounterForDisplayingImmagine < ImmagineImageData.count{
//                CounterForDisplayingImmagine = CounterForDisplayingImmagine + 1
//                }
                }
            }
        if indexPath.section == 1{
//                print("This is the number of availible values in the TableViewTesto Array: \(TableViewTesto)")
//                CollectionCell.TestoLabel.textColor = .white
//                CollectionCell.TestoLabel.text = TableViewTesto[indexPath.row]
//               // CollectionCell.backgroundColor = StateFavsSingletonClass.share.MainBackgroundColor// this ideally should at least tell me if there is a view to load
//                var CollectionCellGradient = CAGradientLayer()
//                CollectionCellGradient.colors = [UIColor.clear.cgColor , UIColor.clear.cgColor]
//                CollectionCell.GradientView.layer.addSublayer(CollectionCellGradient)
//                CollectionCell.BackGroundImage.image = #imageLiteral(resourceName: "A31834-1")
//                CollectionCell.layer.cornerRadius = 15.0
//                CollectionCell.clipsToBounds = true
                    
                }//End if statement brackets for the condition that the table view is in indexPath.section == 1
        }// end of collection view if statement to prevent from crashing, under the condition that there is infact no data

        return CollectionCell
    }
    func EvenIntHelperCheck(_ intToCheck: Int)->Bool{
        var ThisIsTheRightLocation : Bool = false
        // logic for returning the proper boolean value
        for x in 0...IntForCollectionToComapare.count - 1{
            if intToCheck == IntForCollectionToComapare[x]{
                ThisIsTheRightLocation = true
            }
        }
        
        return ThisIsTheRightLocation
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Did Select for CollectionView Is active")
        
        var CollectionViewDataPass : Int = 0
        var CollectionWhichValueDataPass : Int = 0
        let ThisViewSB : UIStoryboard = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let ThisViewVC = ThisViewSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
            if LocationDataAndInt.isEmpty == false{
            for x in 0...LocationDataAndInt.count - 1 {
                for(indexPathValue, LocationValues)in LocationDataAndInt[x]{
                    if indexPathValue == indexPath.row{
                        for(which, current)in LocationValues{
                        ThisViewVC.WhichValue = which// selects the appropriate which values and displays the countent in that view other wise it defaults to 0
                        ThisViewVC.currentViewValue = current// this selects the appropriate path for the object in the current view value and display it
                        ThisViewVC.FavsBoolean = true
                        ThisViewVC.modalTransitionStyle = .crossDissolve            /// animation to have it grow from the location tapped at like when you load an appliction
                        self.present(ThisViewVC, animated: true, completion: nil)
                        }//end of for loop to get the which and current values to display data
                    }// if statement to check and make sure that the data being displayed is from that indexpath
                }//for getting the first set of dictionary values
            }/// Bracket 4: end  of for loop brackets looping through the entire set of the array values for the location data along with it's index path
            }//Bracket 4: End if statement checking rather the locationDataAndInt is empty
        }
    }
    
    ////// TableViewControll Center:
    ////// TableViewControll Center:
    ////// TableViewControll Center:
    var TableViewTesto : [String] = [String]()// Stores actual data to be retrieved from the Testo favs data saved in the StateFavsSingletonClass
    var TableViewCurrent : [Int] = [Int]()// Stores the actual current values for presentation of the current values stored to be selected and presented in the table vie(did Select method) it should present it on click of that index row path
    var TableViewWhich : [Int] = [Int]()//Stores the actual which values for presentatio of the tabelview(Did select method) should on click present those values
    var TableLocationDataAndInt = [[Int:[Int : Int]]]()
    var TestoDataAndInt = [[Int : String]]()
    var TestoIntForCollectionToComapare = [Int]()
    var OddInt : Int = 1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StateFavsSingletonClass.share.FavTableViewData.count// the number of rows are equal to the data stored in that class
    }

    
    func TestoPlaceData(){
        if TableViewCurrent.isEmpty == true && TableViewWhich.isEmpty == true{/// only prints data if this is empty to prevent the data from appending it's self twice
            if StateFavsSingletonClass.share.FavTableViewData.isEmpty == false{
        for x in 0...StateFavsSingletonClass.share.FavTableViewData.count - 1{
            for(Which, CurrentData) in StateFavsSingletonClass.share.FavTableViewData[x]{
                TableViewWhich.append(Which)
                for(Current, Testo) in CurrentData{
                    TableViewTesto.append(Testo)
                    TableViewCurrent.append(Current)
                    TableLocationDataAndInt.append([ OddInt: [ Which : Current ]])
                    TestoDataAndInt.append([OddInt : Testo])
                    TestoIntForCollectionToComapare.append(OddInt)
                    OddInt = OddInt + 1//updates it to for odd values
                }// end of 2nd for loop dictionary check bracket
            }// end of for loop dictinary check bracket
         }//end of for loop bracket
        }// end of if statement to make sure the array with the data isn't empty
        }
        print("Cell called again")
        print("Table ViewDataLocation Loading Is: Current Value: \(TableViewCurrent) Which Value:\(TableViewWhich)")
    }// end of testo place data function brackets
    
    let ShouldCustomCells : Bool = true
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        
        if ShouldCustomCells , let CellName = cell as? FavsCustomTableCell{
            ///add any extra logic that may be neccsary for appropriate display
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableCell = tableView.dequeueReusableCell(withIdentifier: "Table", for: indexPath) as! FavsCustomTableCell/// this is to connecti it with the cell itself
        // this is where all the table view content functionality is added:
       // if TableViewWhich.isEmpty == true || TableViewCurrent.isEmpty == true{///set's perameters to disallow new data to be saved
        if StateFavsSingletonClass.share.tableDataAddedCounter < StateFavsSingletonClass.share.FavTableViewData.count{
//        PlaceData()/// called to place all organize data into a useable array
        print("Cell added now")
        
            // TableCell.BackGroundImage?.image = #imageLiteral(resourceName: "9")// doesn't need to set an image for this sort of data for memory deallocation
        TableCell.Testo?.text = self.TableViewTesto[indexPath.row]
        
            
            
       // TableCell?.textLabel?.text = self.TableViewTesto[indexPath.row]/// places all of the data into the tableview cell
             //CallForSort()///vestige of old logic
            StateFavsSingletonClass.share.tableDataAddedCounter = StateFavsSingletonClass.share.tableDataAddedCounter + 1 ////this value exists to stop the table view from exceeding it's quanity and repeting data
        }
        
        return TableCell/// should return the data
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //for Loop for Did select values To be in 1:1 Coridination        let ThisViewSB : UIStoryboard = UIStoryboard(name: "ViewPicker", bundle: nil)
        var currentSelect = TableViewCurrent[indexPath.row]
        var whichSelect  = TableViewWhich[indexPath.row]


        let SelectedViewSB : UIStoryboard = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let SelectedViewVC = SelectedViewSB.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
            SelectedViewVC.WhichValue = whichSelect
            SelectedViewVC.currentViewValue = currentSelect
            SelectedViewVC.LoadingFavText = "Favorites:"


            /// animation to have it grow from the location tapped at like when you load an appliction
            self.present(SelectedViewVC, animated: true, completion: nil)
        }

        
        
        
         print("")
         print("")
         print("")
         print("Table Debug in UIFavsDesignClass:")
         print("Table Debug in UIFavsDesignClass:")
         print("Table Debug in UIFavsDesignClass:")
        print("Index path value: \(indexPath.row)")
         print("Table ViewDataLocation Loading Is: Current Value: \(currentSelect) Which Value:\(whichSelect)")/// prints the current values
        print("Table ViewDataLocation Loading Is: Current Value: \(TableViewCurrent) Which Value:\(TableViewWhich)")///prints the entire set of values in the array
        let StoredArrayData: String = StateFavsSingletonClass.share.ReturnArrayValuesForDebugging()
        print("\(StoredArrayData)")//prints array data for debugging
        
        print("Fav Table Array Data before distributed to table:  \(StateFavsSingletonClass.share.FavTableViewData)")
         print("")
         print("")
         print("")
         ////I'm checking the ViewValues at these locations at the moment rather than clicking the actual presenting the view controllers to gain and understanding of what the code is grabbing
        
    }
    
    
    @IBOutlet weak var DisplayView: UIView!
    @IBOutlet weak var LogoDisplayView : UIImageView!
    @IBOutlet weak var DiplayTitolo : UILabel!
    
    func DisplayInitalDisplay(){
        LogoDisplayView.image = #imageLiteral(resourceName: "MarkMaryLogoOfficial")//UIImage Logo
        DiplayTitolo.textColor = .white
        DiplayTitolo.text = "Your Favorites"
        TimerRemoveDisplay()
    }
    func TimerRemoveDisplay(){
        var RemoverDisplaytimer = Timer.scheduledTimer(timeInterval: 2.5 , target: self, selector: #selector(removeTrigger), userInfo: nil, repeats: false)
    }
    @objc func removeTrigger(){
        DisplayView.isHidden = true
        DiplayTitolo.isHidden = true
        LogoDisplayView.isHidden = true
    }
    /// this entire class is postponed until.... I can decide on core data or user defaults... then postponed until that is set up... effectively a dead class
    
    //func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    //}
    
   // func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
   // }
    ///Outlet Functions :
    //dismiss
    
    @IBAction func ShowAllFavsFuncition(_ sender: Any  ) {
        
        /// logic for showing all favs function here:
    }
    
    @IBAction func DismissFunciton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
            TableViewWhich.removeAll()////this is to stop the table view from repeating values and to insure it updates the the new values in the array
            TableViewCurrent.removeAll()///this is to stop the table view from repeating values and to insure it updates the the new values in the array
        
    }
    //night
    @IBAction func NightModeFunction(_ sender: Any) {
        NightModeFunctionality()
    }
    //plaPa
    @IBAction func PlaPaFunction(_ sender: Any) {
        MuseSingleton.share.singletonPlyPause()
    }
    //display
    @IBAction func DisplayFunction(_ sender: Any) {
        let MuseViewSb : UIStoryboard = UIStoryboard(name: "MuuseView", bundle: nil)
        if let MuseViewVC = MuseViewSb.instantiateViewController(withIdentifier: "MuseMVCIdentifier")as? MuseMVC{
            self.present(MuseViewVC, animated: true, completion: nil)
        }
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    //FAVSLOGIC:
    //FAVSLOGIC:

    
    

    
}/// end of class bracket





/*
 /// in the event that I actually need this logic... shown below... I doubt it.
 override func viewDidLoad() {
 super.viewDidLoad()
 
 // CheckAllForAllDuplicates()/// calling sorting out similarities
 
 FavsContentView.layer.cornerRadius = 12.5
 FavsContentView.clipsToBounds = true
 
 MuseTimer()
 
 FavsTableView.delegate = self
 FavsTableView.dataSource = self
 self.FavsTableView.register(FavsCustomTableCell.self, forCellReuseIdentifier: TableID)
 //FavsTableView.register(FavTableCell.self, forCellReuseIdentifier: "Table")//table Id and class for implimentation is here.. lets see if this works... if it doesn't it may require a self added to the bottom
 // self.FavsTableView.register(UINib(nibName: "FavsCustomTableCell", bundle: nil), forCellReuseIdentifier: TableID)
 
 // OrgainzeAndSortSavedData()
 
 //Three line code logic for frosted window visual effect on the musebar below
 var Frosted : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
 MuseBackGroundView.addSubview(Frosted)
 Frosted.frame = MuseBackGroundView.bounds
 
 
 
 }
 
 */
