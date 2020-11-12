
//
//  StateFavsSingleton.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 10/19/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit

import AVFoundation

class StateFavsSingletonClass{
    private init(){
        
    }
    static var share = StateFavsSingletonClass()
    lazy var UIColorArray : [UIColor] = MuseReturnPalete()
    
    var ArrayVideoValue = 0
    lazy var MuseVidArrayForUse = VideoArrayFunction()
    lazy var VideoArraySize = MuseVidArrayForUse.count
    var ImaggineNumber = 0
    
    var HeartBoolean : Bool = false
    var FavoritesActive : Bool = false
    
    /// Gallery Favs Logic And Data Saver:
    /// Gallery Favs Logic And Data Saver:
    /// Gallery Favs Logic And Data Saver:
    
    var GalleryHeartCheckerBoolean = false
    var GalleryImageCounter = 0
    var GalleryLocationStorage = [Int]()
    var GalleryStorageDefaults = UserDefaults.standard
    var GalleryKey : String = "Gallery"
    
    
    func OnLoadGalleryStoredData(){
        if let GalleryArray = GalleryStorageDefaults.object(forKey: GalleryKey)as? [Int]{
            if GalleryArray.isEmpty == false{
                GalleryLocationStorage = GalleryArray
            }
        }
    }
    func AddGallaeryFavs(Location CurrentGalleryLocation: Int){
        if GalleryLocationStorage.isEmpty == true{
        GalleryLocationStorage.append(CurrentGalleryLocation)
        GalleryStorageDefaults.set(GalleryLocationStorage, forKey: GalleryKey)
        }else{
            GalleryLocationStorage.append(CurrentGalleryLocation)
            SaveDataForStorage()
        }
        
        
    }
    
    func DeleteStoredData(Location CurrentGalleryLocation: Int){
        for x in 0...GalleryLocationStorage.count - 1{
            if GalleryLocationStorage[x] == CurrentGalleryLocation{
                GalleryLocationStorage.remove(at: x)
                SaveDataForStorage()
            }
        }
    }
    func SaveDataForStorage(){
        GalleryStorageDefaults.object(forKey: GalleryKey)as? [Int]
        GalleryStorageDefaults.set(GalleryLocationStorage, forKey: GalleryKey)
    }
    var ValueFound : Bool = false
    func FavChecker(Current Current: Int){
        if GalleryLocationStorage.isEmpty == false{
        for x in 0...GalleryLocationStorage.count - 1{
            if Current == GalleryLocationStorage[x] && ValueFound == false{
                GalleryHeartCheckerBoolean = true
                ValueFound = true
            }
            if ValueFound == false{
                GalleryHeartCheckerBoolean = false
            }
        }
            ValueFound = false
            
        }
    }
    
    
    
    
    
    ///MainContentAutoplayVariblesAndSoftLogic:
    var MainAutoPlayDefaults = UserDefaults.standard
    var MainAutoPlayBoolean : Bool = false
    var MainReplayBoolean : Bool = false
    var MainAutoPlayKey = "Auto"
    //favs
    var FavsGradientColor1 : UIColor = .clear
    var FavsGradientColor2 : UIColor = #colorLiteral(red: 0.1076507482, green: 0.1148544784, blue: 0.12, alpha: 1)// there exists a color literal here that is hard to see
    var FavsWidth : CGFloat?// is to be set by the favsDesignClass// but is actually set in the view controller class
    
    func ResetStoreAutoPlayStatus(){
        if let MainAuto = MainAutoPlayDefaults.object(forKey: MainAutoPlayKey)as? Bool{
        //MainAutoPlayBoolean = !MainAutoPlayBoolean///what ever the intial value is it is now it's negation.
        MainAutoPlayDefaults.object(forKey: MainAutoPlayKey)as? Bool ///type casted it then saved it's data
        MainAutoPlayDefaults.set(MainAutoPlayBoolean, forKey: MainAutoPlayKey)// now that the data is type casts it can now be stored...
        AutoPlayOnloadStatus()
        }
    }
    func AutoPlayOnloadStatus(){
        if let MainAuto = MainAutoPlayDefaults.object(forKey: MainAutoPlayKey)as? Bool{
            MainAutoPlayBoolean = MainAutoPlayDefaults.object(forKey: MainAutoPlayKey)as! Bool
        }/// if this object actuallly exists then set it to varible
    }
    func SetAutoPlayStatus(){
        MainAutoPlayDefaults.set(MainAutoPlayBoolean, forKey: MainAutoPlayKey)/// key is set
    }
    ////StoringDataForRetrievial:
    ////StoringDataForRetrievial:
    ////StoringDataForRetrievial:
    var ApplicationDidLoad = false/// will be checked true if uppon the load of the initail storyboard... that way the logic an proceed according to proper understanding that application has ran already
    var CurrentKey : String = "Current"
    var WhichKey : String = "Which"
    var CurrentDefaults = UserDefaults.standard// current defaults stores all current values in an array that holds arrays... data is retrieved and  placed back into the appropriate array for UIviewing.
    var WhichDefaults = UserDefaults.standard//setting defaults for the which values to be storeed and used again upon need
    lazy var CurrentStorageContainer = [ElemFavArray , ColFavArray, ShapeFavArray, PerspectFavArray, ExpressFavArray, PracFavArray]
    lazy var WhichStorageContainer = WhichArrayStorage/// will be used to load data into and to remove from after done
    
    func DeleteAllStoredData(){
        ElemFavArray = [Int]() ; ColFavArray = [Int](); ShapeFavArray = [Int](); PerspectFavArray = [Int]();
        ExpressFavArray = [Int](); PracFavArray = [Int]()//sets values to an empty array for storage... and deletion of data in array
        WhichArrayStorage = [Int]()
        var AllCurrentArrays = [ElemFavArray , ColFavArray, ShapeFavArray, PerspectFavArray, ExpressFavArray, PracFavArray]
        CurrentDefaults.set( AllCurrentArrays, forKey: CurrentKey)
        
        WhichDefaults.set( WhichArrayStorage, forKey: WhichKey)/// set Array After all values
        if let CurrentArrayChecker = CurrentDefaults.array(forKey: CurrentKey) as? [[Int]]{//checks if this is a nil value before applying it all willy nill this insures that valyes aren't exactly you know fucked
            var currentArraySavedData : [[Int]] = CurrentDefaults.array(forKey: CurrentKey) as! [[Int]]
            ElemFavArray = currentArraySavedData[0]
            ColFavArray = currentArraySavedData[1]
            ShapeFavArray = currentArraySavedData[2]
            PerspectFavArray = currentArraySavedData[3]
            ExpressFavArray = currentArraySavedData[4]
            PracFavArray = currentArraySavedData[5]
            print(currentArraySavedData)// printing to check if there is any data here
        }
        if let WhhichArrayChecker = WhichDefaults.array(forKey: WhichKey) as? [Int]{
            WhichArrayStorage = WhichDefaults.array(forKey: WhichKey) as! [Int]
            print(WhichArrayStorage)// printing to check if there is any data here
        }
    }
    func OnLoadRestorePreviousData(){

        if let CurrentArrayChecker = CurrentDefaults.array(forKey: CurrentKey) as? [[Int]]{//checks if this is a nil value before applying it all willy nill this insures that valyes aren't exactly you know fucked
            var currentArraySavedData : [[Int]] = CurrentDefaults.array(forKey: CurrentKey) as! [[Int]]
            ElemFavArray = currentArraySavedData[0]
            ColFavArray = currentArraySavedData[1]
            ShapeFavArray = currentArraySavedData[2]
            PerspectFavArray = currentArraySavedData[3]
            ExpressFavArray = currentArraySavedData[4]
            PracFavArray = currentArraySavedData[5]
            print(currentArraySavedData)// printing to check if there is any data here
        }
        if let WhhichArrayChecker = WhichDefaults.array(forKey: WhichKey) as? [Int]{
            WhichArrayStorage = WhichDefaults.array(forKey: WhichKey) as! [Int]
            print(WhichArrayStorage)// printing to check if there is any data here
        }
    }
    func ResetAndStoreValue(){
        CurrentDefaults.object(forKey: CurrentKey) as? [[Int]]
        WhichDefaults.object(forKey: WhichKey) as? [Int]//type casted this data and the object to insure that I can reset the values
        SetDefaults()
 
    }
    func SetDefaults(){

        var AllCurrentArrays = [ElemFavArray , ColFavArray, ShapeFavArray, PerspectFavArray, ExpressFavArray, PracFavArray]
        CurrentDefaults.set( AllCurrentArrays, forKey: CurrentKey)
        
        WhichDefaults.set( WhichArrayStorage, forKey: WhichKey)/// set Array After all values

    }


    ///CHECK FAVS LOGIC:
    ///CHECK FAVS LOGIC:
    ///Favs Arrays For Which Values:
    var TransitionStyleChecker : UIModalTransitionStyle = .flipHorizontal
    var ElemFavArray = [Int]()
    var ColFavArray = [Int]()
    var ShapeFavArray = [Int]()
    var PerspectFavArray = [Int]()
    var ExpressFavArray = [Int]()
    var PracFavArray = [Int]()
    var DoubleBoolean : Bool = false/// default to not checking the heart to be false
    var DoubleIntChecker : Int?
    var DoubleWhichChecker : Int?

    func AppendFavData(Which WhichValue : Int, Current CurrentViewValue : Int){//method will be used to append data from all classes that need to access this data
        switch WhichValue{
        case 0:
            ElemFavArray.append(CurrentViewValue)
            print("ElemFavArray in StateFavsSingleton class arrayData:\(ElemFavArray)")
            break
        case 1:
            ColFavArray.append(CurrentViewValue)
            print("ColFavArray in StateFavSingletonClass arrayData:\(ColFavArray)")
            break
        case 2:
            ShapeFavArray.append(CurrentViewValue)
            print("ShapeFavArry in StateFavSingletonClass arrayData:\(ShapeFavArray)")
            break
        case 3:
            PerspectFavArray.append(CurrentViewValue)
            print("PerspectArray in StateFavSingletonClass arrayData:\(PerspectFavArray)")
            break
        case 4:
            ExpressFavArray.append(CurrentViewValue)
            print("ExpressFavArray in StateFavSingletonClass arrayData:\(ExpressFavArray)")
            break
        case 5:
            PracFavArray.append(CurrentViewValue)
            print("PracFavArray in StateFavSingltonClass arrayData:\(PracFavArray)")
            break
        default:
            print("Error_APPENDING-DATA-TO-FAVS-DATA-STORAGE:CLASS:STATEFAVS:METHOD:APPENDFAVSDATA")
            break
        }
      
        if ApplicationDidLoad == false || CurrentDefaults.array(forKey: CurrentKey)as? [[Int]] == nil{
            /// checking if the value is nil at this location... in some sense it opperates a boolean
            SetDefaults()/// so if there is no data here or if the application did not load then set the defaults
        }
        if ApplicationDidLoad == true{
            ResetAndStoreValue()
        }
        
    }
    
    func ReturnFavData(_ WhichValue : Int)->[Int]{
        switch WhichValue{
        case 0:
            return ElemFavArray
            break
        case 1:
            return ColFavArray
            break
        case 2:
            return ShapeFavArray
            break
        case 3:
            return PerspectFavArray
            break
        case 4:
            return ExpressFavArray
            break
        case 5:
            return PracFavArray
            break
        default:
           var ErrorArray = [Int]()
            return ErrorArray
            break
        }
    }
    
    func FavCompareContrast(Which WhichValue : Int, Current CurrentViewValue : Int){
        /*
         This class oppertes to determine rather the state of the heart boolean. It turns the value of the FavsDataStorage singkton Heart bookean true if there is a matching value for the currnent view location in the saved data array in the class. Doesn't have any functinality of adding or removing data. It is simply a serching algorithm to determine the state of a value.
        */
        var ArrayToCompare = ReturnFavData(WhichValue)/// returns the data from the array value
        if  ArrayToCompare.isEmpty != true{/// checking if the array is empty befor running code
        for x in 0...ArrayToCompare.count - 1{///when building the favs data collection and table views... this line of code should be removed while the rest stays but in a different function to allow the loop to compare and all the values... and add the proper ones
            print("StateFavsSingleton class() ---- Ran loop : \(x)'s")
            if DoubleBoolean == false || CurrentViewValue != DoubleIntChecker || WhichValue != DoubleWhichChecker{// add a which checker
                if CurrentViewValue == ArrayToCompare[x]{
                    HeartBoolean = true
                    DoubleBoolean = true
                    DoubleIntChecker = CurrentViewValue
                    DoubleWhichChecker = WhichValue
                    if HeartBoolean == true{
                        print("StateFavsSingleton class()==== True at \(CurrentViewValue) = \(ArrayToCompare[x])")
                    }
                }else{
                    HeartBoolean = false
                    DoubleBoolean = false
                    if HeartBoolean == false{/// check that the boolean is actually updating
                        print("StateFavsSingleton class()==== false at \(CurrentViewValue) = \(ArrayToCompare[x])")
                        
                        }
                    }
                }
            }
        }else{
            HeartBoolean = false//// basically stating if this array is empty then the status is false
        }
    }
    
    
    func RemoveFavData(_ which : Int , _ current : Int ){
        /*
         This is the acutual method to remove data once it is found in the array. This method is called below and it takes two perameters the which value and the current view value. And it uses a public class variable "LocationOfCurrent" to know which value is to be deleted in the array
        */
        switch which{
        case 0 :
            var ValueToBeDeleted : Int?
            if ElemFavArray.isEmpty != true{
            for x in 0...ElemFavArray.count - 1 {
                if current == ElemFavArray[x]{
                    ValueToBeDeleted = x
                }
                print(ElemFavArray)
                print(x)
            }
            LocationOfCurrent = ValueToBeDeleted
            ElemFavArray.remove(at: ValueToBeDeleted!)
            StoreLocationOfWhichArrayValues(which)
            }
            break
        case 1 :
            var ValueToBeDeleted : Int?
            if ColFavArray.isEmpty != true{
            for x in 0...ColFavArray.count - 1 {
                if current == ColFavArray[x]{
                    ValueToBeDeleted = x
                }
                print(ColFavArray)
                print(x)
            }
            LocationOfCurrent = ValueToBeDeleted
            ColFavArray.remove(at: ValueToBeDeleted!)
            StoreLocationOfWhichArrayValues(which)

            }
            break
        case 2 :
            var ValueToBeDeleted : Int?
            if ShapeFavArray.isEmpty != true{// should run to make sure the array being worked with isn't empty
            for x in 0...ShapeFavArray.count - 1 {
                if current == ShapeFavArray[x]{
                    ValueToBeDeleted = x
                }
                print(ShapeFavArray)
                print(x)
            }
            LocationOfCurrent = ValueToBeDeleted
            ShapeFavArray.remove(at: ValueToBeDeleted!)
            StoreLocationOfWhichArrayValues(which)
            }
            break
        case 3 :
            var ValueToBeDeleted : Int?
            
            if PerspectFavArray.isEmpty != true{
                
            for x in 0...PerspectFavArray.count - 1 {
                if current == PerspectFavArray[x]{
                    ValueToBeDeleted = x
                }
                print(PerspectFavArray)
                print(x)
            }
            LocationOfCurrent = ValueToBeDeleted
            PerspectFavArray.remove(at: ValueToBeDeleted!)
            StoreLocationOfWhichArrayValues(which)

        }
            break
        case 4 :
            var ValueToBeDeleted : Int?
            
            if ExpressFavArray.isEmpty != true{
            for x in 0...ExpressFavArray.count - 1 {
                if current == ExpressFavArray[x]{
                    ValueToBeDeleted = x
                }
                print(ExpressFavArray)
                print(x)
            }
            LocationOfCurrent = ValueToBeDeleted
            ExpressFavArray.remove(at: ValueToBeDeleted!)
            StoreLocationOfWhichArrayValues(which)
            }
            break
        case 5 :
            var ValueToBeDeleted : Int?
            
            if PracFavArray.isEmpty != true{
            for x in 0...PracFavArray.count - 1 {
                if current == PracFavArray[x]{
                    ValueToBeDeleted = x
                }
                print(PracFavArray)
                print(x)
            }
            LocationOfCurrent = ValueToBeDeleted
            PracFavArray.remove(at: ValueToBeDeleted!)
            StoreLocationOfWhichArrayValues(which)
            }
            break
        default :
            print("REMOVAL-OF-FAV_DATA_WAS-NOT_EXECUTED:FAVSSTATESINGLETON_CLASSE: RemoveFavData()")
        }
    }

    ///Removal Array Logic:
    ///Removal Array Logic:
    ///Removal Array Logic:
    var WhichRemovalArray = [Int]()//// array to place values that have the same set of values
    var LocationOfCurrent : Int?/// Used to store the location of values to remove data from WhichDataStorageArray
    var LocationToRemove : Int?
    
    func StoreLocationOfWhichArrayValues(_ which: Int){
        for x in 0...WhichArrayStorage.count - 1{
            if WhichArrayStorage[x] == which{
                WhichRemovalArray.append(x)
            }/// end of if statement to which appeends location values of an array data into the removal array
        }/// end of for loop bracket that parse through the entire set of values in the WhichDataStorageArray to append the locatio of those values in an array
        if let local = LocationOfCurrent{
            RemoveWhichValues(whichValues: which, LocationInCurrentArray: LocationOfCurrent!)
        }/// optionally binded this to insure no crashes/// whihc will suck for debugging but works better overall for the application
    }
    func RemoveWhichValues(whichValues which: Int, LocationInCurrentArray Location: Int){
        if WhichRemovalArray.isEmpty == false {
            for x in 0...WhichRemovalArray.count-1{
                if x == Location{
                    LocationToRemove = WhichRemovalArray[x]
                    }/// End of if statement to remove data from the Location
                }/// end of for loop that parses through the values to remove the data from the whichdataStorageArray
            if let Local = LocationToRemove{
                WhichArrayStorage.remove(at: LocationToRemove!)
            }//optionally binding to make sure there is actuall data to be unwrapped from this value
        }//Checking if the array is not empty before running logic to remove data that isn't there
            
    }
    
    
    
    
    /// END OF REMOVAL LOGIC //// END OF REMOVAL LOGIC //// END OF REMOVAL LOGIC /// END OF REMOVAL LOGIC
    
    ///// PULL DATA FROM FAVS TO BE DISPLAYED IN THE FAVS STORYBOARD:
    ///// PULL DATA FROM FAVS TO BE DISPLAYED IN THE FAVS STORYBOARD:
    ///// PULL DATA FROM FAVS TO BE DISPLAYED IN THE FAVS STORYBOARD:
    ///// PULL DATA FROM FAVS TO BE DISPLAYED IN THE FAVS STORYBOARD:
    var ImagePresent : Bool = false// default to false
    var TestoPresent : Bool = false// default to false
    var ImageLoopStopper : Bool = false
    var TestoLoopStopper : Bool = false
    var WhichArrayStorage = [Int]()
    var ElemCounter = 0
    var ColCounter = 0
    var ShapeCounter = 0
    var PerspectCounter = 0
    var ExpressionCounter = 0
    var PracCounter = 0
    var Data = mainDataClass()/// instance of the class that holds all the data for interetation
    
    var Testo : String = "ERROR-DATA-REQUEST-RETURNED_NIL: STATEFAVSSINGLETONCLASS()"
    var Immagine : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG")// <- image literal sits here this is the value the collection view grabs
    var InstanceOfImmagine : UIImage?/// TheString/testo data to return from method below ReturnImmagine()
    var InstanceOfTesto : String?/// String/testo data to return from the method below ReturnTesto()
    //All data from the data class that needs to be added to insure proper display FavsStoryBoard is here Testo and Immagine:
            // Testo:
    lazy var TestoElem = [Int : String]()
    lazy var TestoCol = [Int : String]()
    lazy var TestoShape = [Int : String]()
    lazy var TestoPerspect = [Int : String]()
    lazy var TestoExpression = [Int : String]()
    lazy var TestoPrac = [Int : String]()
            // Immagine:
    lazy var ImmagineElem = [Int : UIImage?]()
    lazy var ImmagineCol = [Int : UIImage?]()
    lazy var ImmagineShape = [Int : UIImage?]()
    lazy var ImmaginePerspect = [Int : UIImage?]()
    lazy var ImmagineExpression = [Int : UIImage?]()
    lazy var ImmaginePrac = [Int : UIImage?]()
    
    func ReturnArrayValuesForDebugging()->String{
        return """
        ElemArray = \(ElemFavArray) ColArray = \(ColFavArray) ShapeArray = \(ShapeFavArray) PerspectArray = \(PerspectFavArray) Expression = \(ExpressFavArray) PracArray = \(PracFavArray)
        WhichValuesArray = \(WhichArrayStorage)
        
"""
    }
    
    var InstantCurrent : Int = 0
    var InstantWhich : Int = 0
    let BothCaseMinimum : Int = 350/// set to the minimum number of characters to be consider not predominantely image based section is 350// this value could change if it leans to heavily on one side as upposed to the other
    var tableDataAddedCounter = 0////this value exists to stop the table view from exceeding it's quanity and repeting data
    
    var FavCollectionViewData = [[Int: [Int : UIImage]]]()
    var FavTableViewData = [[Int:[Int : String]]]()
    func SortBothCase(_ TestoHere: String, _ ImaggineHere: UIImage){
        /// these methods aren't working
        /// will call one of these methods below to append data...where it sorts the data based on quantity of string data
        if Testo.count < BothCaseMinimum{// if less than the minimum requirement for testo content then just make the data part of the collection view
            appendImmagineForFavsCollection(InstantWhich, InstantCurrent, ImaggineHere)
        }else{// if testo data count meets the minimum requirement then make it part of the table view
            appendTestoForFavTable(InstantWhich, InstantCurrent, TestoHere)
        }
    }
    func appendImmagineForFavsCollection(_ which : Int, _ current: Int, _ ImmagineNow: UIImage){
        var FavImmagine = [which: [current : ImmagineNow]]
        FavCollectionViewData.append(FavImmagine)
    }
    func appendTestoForFavTable(_ which : Int, _ current: Int, _ TestoNow: String){
        var FavTesto = [which:[current : TestoNow]]
        FavTableViewData.append(FavTesto)
    }
    func AppendWhichArrayValue(Which WhichValues : Int){
        WhichArrayStorage.append(WhichValues)//function to add which values to whichArrays
    }
    func LoopFavValues(){
        if WhichArrayStorage.isEmpty != true{
            for x in 0...WhichArrayStorage.count - 1{
                SwitchMethodForCurrentViewValues(WhichArrayStorage[x])// returns the value from the location of that array... the important bit of data is to do something with the data given from the instance of Immagine and Instance of testo because they are volitle as they should be to conserve memory on device... Keep it simple stupid.
                if ImagePresent == true && TestoPresent == true{// these methods aren't working... which is problematic... it presents problems with displaying collection view approiately with apapropriate data
                    Testo  = InstanceOfTesto!
                    print(Testo)
                    Immagine = InstanceOfImmagine!
                    SortBothCase(Testo, Immagine)/// sorting logic for adding data
                }
                if ImagePresent == true && TestoPresent == false{
                    Immagine = InstanceOfImmagine!
                    appendImmagineForFavsCollection(InstantWhich, InstantCurrent, Immagine)/// appended to the location for the collection view to pick it up and display
                    print(Testo)

                    
                }
                if ImagePresent == false && TestoPresent == true{
                    Testo  = InstanceOfTesto!
                    appendTestoForFavTable(InstantWhich, InstantCurrent, Testo)/// appendd to the location for the table view to pick up and dispaly
                    print(Testo)
                }
            }//End Bracket for first for loop for itterating through WhichArrayValues
        }//End bracket for if Statement for checking rather the WhichArryValue array is empty
    }//End bracket for LoopFavValues method
    
    func SwitchMethodForCurrentViewValues(_ whichValues: Int){
        print("SwitchMethodForCurrentViewValues is working")
        switch whichValues{
            case 0:
                    var CurrentDataArray : [Int] = ReturnFavData(whichValues)// array from above that has all of the current view values
                    if ElemCounter < CurrentDataArray.count{
                        var CurrentData = CurrentDataArray[ElemCounter]
                        ReturnImmagine(whichValues , CurrentData)
                        ReturnTesto(whichValues, CurrentData)
                        ElemCounter = ElemCounter + 1
                    }else{
                        ElemCounter = 0/// reset elem counter to zero
                    }
                break
            case 1:
                    var CurrentDataArray : [Int] = ReturnFavData(whichValues)
                    if ColCounter < CurrentDataArray.count{
                        var CurrentData = CurrentDataArray[ColCounter]
                        ReturnImmagine(whichValues , CurrentData)
                        ReturnTesto(whichValues, CurrentData)
                        ColCounter = ColCounter + 1
                    }else{
                        ColCounter = 0/// reset elem counter to zero
                    }
                break
            case 2:
                    var CurrentDataArray : [Int] = ReturnFavData(whichValues)
                    if ShapeCounter < CurrentDataArray.count{
                        var CurrentData = CurrentDataArray[ShapeCounter]
                        ReturnImmagine(whichValues , CurrentData)
                        ReturnTesto(whichValues, CurrentData)
                        ShapeCounter = ShapeCounter + 1
                    }else{
                        ShapeCounter = 0/// reset elem counter to zero
                    }
                break
            case 3:
                    var CurrentDataArray : [Int] = ReturnFavData(whichValues)
                    if PerspectCounter < CurrentDataArray.count{
                        var CurrentData = CurrentDataArray[PerspectCounter]
                        ReturnImmagine(whichValues , CurrentData)
                        ReturnTesto(whichValues, CurrentData)
                        PerspectCounter = PerspectCounter + 1
                    }else{
                        PerspectCounter = 0/// reset elem counter to zero
                    }
                break
            case 4:
                    var CurrentDataArray : [Int] = ReturnFavData(whichValues)
                    if ExpressionCounter < CurrentDataArray.count{
                        var CurrentData = CurrentDataArray[ExpressionCounter]
                        ReturnImmagine(whichValues , CurrentData)
                        ReturnTesto(whichValues, CurrentData)
                        ExpressionCounter = ExpressionCounter + 1
                    }else{
                        ExpressionCounter = 0/// reset elem counter to zero
                    }
                break
            case 5:
                    var CurrentDataArray : [Int] = ReturnFavData(whichValues)
                    if PracCounter < CurrentDataArray.count{
                        var CurrentData = CurrentDataArray[PracCounter]
                        ReturnImmagine(whichValues , CurrentData)
                        ReturnTesto(whichValues, CurrentData)
                        PracCounter = PracCounter + 1
                    }else{
                        PracCounter = 0/// reset elem counter to zero
                    }
                break
            default:
                print("Error-PULLING-DATA-FOR-FAVSDISPLAY-FOUND-IN-STATEFAVSSINGLETON-CLASS-METHOD: SWITCHMETHODFORCURRENTVIEWVALUES()")
            break
            
        }///END OF SWITCH STATEMET BRACKETS
    }// END OF SWITCHFORCURRENTVIEWVALUES BRACKET
    
    func PlaceDataIntoArrays(){
        let ViewPickerStoryBoard : UIStoryboard = UIStoryboard(name: "ViewPicker", bundle: nil)
        if let ViewPickerClass = ViewPickerStoryBoard.instantiateViewController(withIdentifier: "ViewPickerDisplay")as? UIViewPickerClass{
            TestoElem = ViewPickerClass.ElemStringData()
            TestoCol = ViewPickerClass.ColStringData()
            TestoShape = ViewPickerClass.ShapeStringData()
            TestoPerspect = ViewPickerClass.PracStringData()
            TestoExpression = ViewPickerClass.ExpressStringData()
            TestoPrac = ViewPickerClass.PracStringData()
            // Immagine:
            ImmagineElem = ViewPickerClass.ElemUIImageDictionaryFunc()
            ImmagineCol = ViewPickerClass.ColUIImageDictionaryFunc()
            ImmagineShape = ViewPickerClass.ShapeUIImageDictionaryFunc()
            ImmaginePerspect = ViewPickerClass.PerspectUIImageDictionaryFunc()
            ImmagineExpression = ViewPickerClass.ExpressionUIImageDictionaryFunc()
            ImmaginePrac = ViewPickerClass.PracUIImageDictionaryFunc()
            
        }
    }
    
    func testoSwitch(_ whichValues: Int)->[Int: String]{// meant to be called by the favs view controller class to get data for display based on which values in succession
        switch whichValues{
        case 0:
            return TestoElem
            break
        case 1:
            return TestoCol
            break
        case 2:
            return TestoShape
            break
        case 3:
            return TestoPerspect
            break
        case 4:
            return TestoExpression
            break
        case 5:
            return TestoPrac
            break
        default:
            return [0 : "Error-return-testo-data"]
            print("Error-PULLING-DATA-FOR-FAVSDISPLAY-FOUND-IN-STATEFAVSSINGLETON-CLASS-METHOD: testoSwitch()")
            break
            
        }///END OF SWITCH STATEMET BRACKETS
    }
    func ImmagineSwitch(_ whichValues: Int)->[Int: UIImage?]{
        switch whichValues{
        case 0:
            return ImmagineElem
            break
        case 1:
            return ImmagineCol
            break
        case 2:
            return ImmagineShape
            break
        case 3:
            return ImmaginePerspect
            break
        case 4:
            return ImmagineExpression
            break
        case 5:
            return ImmaginePrac
            break
        default:
            return [0: #imageLiteral(resourceName: "errorImage-vector-image-PnG")]// error image is returned at value zero... here sits an image literal
            print("Error-PULLING-DATA-FOR-FAVSDISPLAY-FOUND-IN-STATEFAVSSINGLETON-CLASS-METHOD: ImmagineSwitch()")
            break
            
        }///END OF SWITCH STATEMET BRACKETS
    }
    
    func ReturnImmagine(_ which : Int , _ Current: Int){
       // PlaceDataIntoArrays()/// calling method to place data from the maindata class into an array to display it for use
        var ImmagineArray = ImmagineSwitch(which)
        
        var SameCurrent : Int = 900900///a number this large is absurd and is almost equivelent to not having a value there
        var SameWhich : Int = 900900/// a numbe this large is absurd and is almost equivelent to not having one, but setting it to a varible at all helps to insure that there won't be any issues nor requirements to unwrap it below
            for (key , Immagine) in ImmagineArray{
              //  if SameWhich != which || SameCurrent != Current || ImageLoopStopper == true{//removed for now it will be replaced with better logic as barriers as to what data gets sent to the collection view array.

                    // if the which and current values are currently still the same and equal
                    if key == Current && CheckImmagineAgainstImmagine(which, Current) == true{
                        InstanceOfImmagine = Immagine!
                        ImagePresent = true
                        ImageLoopStopper = true
                        FavCollectionViewData.append([which:[key:Immagine!]])// returning found image data here
                        
                        print("Calling to be sure that the data is actually being appendedStateFavsSingleton CollectionData: \(FavCollectionViewData)")
                        InstantWhich  = which
                        InstantCurrent = Current
                                        LoopFavValues()
                                        print("""

                        FavCollectionData: \(FavCollectionViewData)

                        FavTableData: \(FavTableViewData)




                        """)
                        
                    }else{
                        InstanceOfImmagine = nil///empties image there... so there is not a repeting cycle of the same image data
                        ImagePresent = false
                        ImageLoopStopper = false
                    }// End of if statement bracket
        //}
            }//End of for loop Brackets
        
    }//End of ReturnImmagine methodBrackets
    
    func ReturnTesto(_ WhichPass : Int, _ CurrentPass: Int){
       // PlaceDataIntoArrays()/// calling method to place data from the maindata class into an array to display it for use
        var TestoArray = testoSwitch(WhichPass)
        var SameCurrent : Int = WhichPass///a number this large is absurd and is almost equivelent to not having a value there
        var SameWhich : Int = CurrentPass/// a numbe this large is absurd and is almost equivelent to not having one, but setting it to a varible at all helps to insure that there won't be any issues nor requirements to unwrap it below
        for (key , TestoData) in TestoArray{
                if key == CurrentPass && CheckTestoAgainstTesto(WhichPass , CurrentPass) == true{//should pass data into instance of that data
                    
                    
                    FavTableViewData.append([WhichPass : [key: TestoData]])/// the key is being passed through here becaues the valu that holds the same current here is not storing the appropriate data
                    InstanceOfTesto = Testo
                    TestoPresent = true
                    TestoLoopStopper = true// this is to stop the loop from  running through the code and altering the boolean varible before the data is acutally useable
                    InstantWhich  = WhichPass
                    InstantCurrent = CurrentPass
                    
                    LoopFavValues()
                                    print("""

                    FavCollectionData: \(FavCollectionViewData)

                    FavTableData: \(FavTableViewData)




                    """)
                }
                if TestoPresent == false {
                    InstanceOfTesto = nil/// returns a nil value such that there isn't a repeating cycle of image values
                    TestoPresent = false
                    TestoLoopStopper = false
                }//End of if statement brackets
        }//End of for loop brackets
        TestoPresent = false
        TestoLoopStopper = false
    }// End of ReturnTesto method brackets
    
    
    
    func CheckTestoAgainstTesto(_ which : Int ,_ Current: Int)-> Bool{
        var NoMatch : Bool = true// default to true such that if the array is empty then just add the damn data
        //logic to  determine if there exists a value in the array
        if FavTableViewData.isEmpty == false{
        for x in 0...FavTableViewData.count - 1{
        for(whichLoaction, UnusedData) in FavTableViewData[x]{
            for(current, testo) in UnusedData{
                if which == whichLoaction && Current == current{
                    NoMatch = false
                    print("There is matching data")
                }// end of if statement checking the which and current entered and data in there'
                print("There isn't matching data")
            }// end for loop checking rather the second dictionary
        }// end of for loop for first dictionary value
    }// end ofc for loop for looping through values in table array's length
    }// end of if statement to check if the favtableviewdata array is empty
        return NoMatch
    }
    
    func CheckImmagineAgainstImmagine(_ which : Int, _ Current: Int)-> Bool{
        var NoImmagineMatch: Bool = true
        if FavCollectionViewData.isEmpty == false {
            for x in 0...FavCollectionViewData.count - 1{
                for(WhichValue, CurrentAndImmagine) in FavCollectionViewData[x]{
                    for(CurrentValue, Immagine) in CurrentAndImmagine{
                        if WhichValue == which && CurrentValue == Current{
                            NoImmagineMatch = false
                        }
                    }// end of for loop for currernt and immgaine
                }// end of for loop for which and data
            }// end of for loop for looping through the entire array
        }//end of if statement for comfirming that the favcollectionviewdata array isn't actually empty
        
        return NoImmagineMatch// defaulted to true such that content gets easily added
    }
    
    
    var FavsHeartVisibilityBoolean : Bool = true//// defualted to true but will be visible based on rather the view is 1,3,4,5... if it is view style 2 then it will be hidden. this way there exist consitency and it disables data from view stlye to from causing issues in favs mvc logic
    var FavsBoolean : Bool = false /// if checked true by the switch then the view will control the ViewPicker views to display data
    var FavsViewValueInt : Int = 0/// defaulted to zero but will be and should be updated when the favs table and collection view value is clicked... which should select the appropriate location in the view to display...
    var WhichValueTracker : Int?
    var CurrentViewTracker : Int?
    var CurrentFavsDataSessionArray  = [[Int:Int]]()// values are to be added here for current session.
    /// this array is to be used and picked up by another view later
    
    func takeFavsSessionData(){
        /// takes in the data and passes it to the take store Favs session data... so current data
        if let Which = WhichValueTracker{
            if let current = CurrentViewTracker{
                storeFavsSessionData(WhichValueTracker!, CurrentViewTracker!)
            }
        }
    }
    func storeFavsSessionData(_ which : Int , _ current : Int){
        /// stores the data
        var DictionaryToStoreFavsData = [which : current]
        CurrentFavsDataSessionArray.append(DictionaryToStoreFavsData)// when used appends data just added to the statefavsCurrentFavs SessionData
        /// we will also print it for the time being so that I can know what is and has been stored when I press the favs button inside of the view picker class
        print(CurrentFavsDataSessionArray)
        
    }
    
    //resize image call here :
    
    func ResizeAllImageWithBundle(_ ImageBundle : String?,_ UIImageViewForSize: UIImageView)-> UIImage{
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
    
    
    
    
    
    
    
    func ResizeAllImageWithImage(_ ImageBundle : UIImage?,_ UIImageViewForSize: UIImageView)-> UIImage{
        let ImageResize = max(UIImageViewForSize.bounds.size.width , UIImageViewForSize.bounds.size.height)/// max size of the image to be set is here such that the image placed in the image view is the same size as the image view
        var ImageSize : CGSize = CGSize(width: UIImageViewForSize.bounds.size.width, height: UIImageViewForSize.bounds.size.height)
        let _ = UIImageViewForSize.bounds.size
        // var ImmaggineName : String = SourceFile
        var ContainerImmage : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG") // image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        
        if let Imagefile = ImageBundle{
            guard let ImageView = ImageBundle else{
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
    
    
    
    ///PlayList TableViewColor Gradient Set:
    let TopGradientColor : UIColor = #colorLiteral(red: 0.09850902289, green: 0.09850902289, blue: 0.09850902289, alpha: 0.7460662412)
    let BottomGradientColor : UIColor  = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)// UIColor Literal right here just difficult to see beacause it is all dark
    /// End Of PlayList TableViewColor Gradient Set:
    
    let TranslucentMainContentBackGroundColor : UIColor =  #colorLiteral(red: 0.1605765451, green: 0.1605765451, blue: 0.1605765451, alpha: 0.7005666813)
    let GalleryMainContentBackGroundColor : UIColor =  #colorLiteral(red: 0.1605765451, green: 0.1605765451, blue: 0.1605765451, alpha: 0.75)// there exist a color literal here but due to the nature of its color it is hard to see
    
    let InitalMainContentBackGroundColor : UIColor = #colorLiteral(red: 0.1050912898, green: 0.09249837448, blue: 0.0927082564, alpha: 1)
    let MainContentBackGroundColor : UIColor = #colorLiteral(red: 0.1050912898, green: 0.09249837448, blue: 0.0927082564, alpha: 1)
        
        let originalMainBackgroundColor = #colorLiteral(red: 0.1605765451, green: 0.1605765451, blue: 0.1605765451, alpha: 1)// there exist a color literal here but due to the nature of its color it is hard to see
    
    let MainContentBackGroundColor65percent : UIColor =  #colorLiteral(red: 0.1605765451, green: 0.1605765451, blue: 0.1605765451, alpha: 0.349746919)// there exist a color literal here but due to  the nature of its color it is hard to see
     let MainContentBackGroundColor12percent : UIColor =  #colorLiteral(red: 0.1605765451, green: 0.1605765451, blue: 0.1605765451, alpha: 0.117325044)
    let MainContentBackGroundColor5percent : UIColor =  #colorLiteral(red: 0.1605765451, green: 0.1605765451, blue: 0.1605765451, alpha: 0.04792033451)
    
    
    
    // TableViewSetOfUIColors Made for even gradient:
    var BottomGradientBackgroundValue = #colorLiteral(red: 0.1459892165, green: 0.1459892165, blue: 0.1459892165, alpha: 0.8229995599)/// both set to 75%... such that the gradien flows  smoothly...needs to be variably different
    var TopGradientBackgrounfValue = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)/// both set to 80%... such that the gradient flows smoothly
    
    var MainBackgroundColor : UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7462037852)
    var NightModeBackgroundColor : UIColor = #colorLiteral(red: 0.1963457709, green: 0.1774183705, blue: 0.1834130973, alpha: 0.8535981514)
    //////// aesthetic of color to be used in any location of color needed rather that be font or background
    var PrimaryRed : UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var PrimaryBlue : UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var PrimaryYellow : UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    var ClearColor : UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
    
    var FontBlue : UIColor  = #colorLiteral(red: 0.2572472394, green: 0.6063866615, blue: 0.7499501109, alpha: 1)
    var FontDarkBlue : UIColor = #colorLiteral(red: 0.2108507156, green: 0.4195255637, blue: 0.5080775619, alpha: 1)
    var FontRed : UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    var TableOCViewButtonBackgroundColor : UIColor = #colorLiteral(red: 0.6496958137, green: 0.08494650573, blue: 0.195245266, alpha: 1)
    
    var ProgressoProgressColor : UIColor = #colorLiteral(red: 0.1999614877, green: 0.3249775347, blue: 0.5, alpha: 0.3526353433)
    var ProgressoUnfilledSection : UIColor = #colorLiteral(red: 0.2618795026, green: 0.2785800416, blue: 0.3019607961, alpha: 0.251953125)
    var progressoProgressFillsection : UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0)
    
    var MuseProgressoProgress : UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    

    
    /// POP-UP Color and control
    var PaginaPopUpFont : UIFont = UIFont(name: "AvenirNext-Medium", size: 16.0)!
    var PaginaPopUpFontCancel : UIFont = UIFont(name: "AvenirNext-Medium", size: 16.0)!
    var PopUpTextColor : UIColor = #colorLiteral(red: 0, green: 0.5856988316, blue: 0.9055382609, alpha: 1)
    var PopUpCancleTextColor : UIColor = #colorLiteral(red: 0.9043243838, green: 0.1464144229, blue: 0, alpha: 1)
    
    ////font section:
    var tableFontColor : UIColor = #colorLiteral(red: 0.9965139031, green: 0.9965139031, blue: 0.9965139031, alpha: 1)
    var MaxTitleFont : UIFont = UIFont(name: "Avenir Next", size: 30.0)!
    var MidTitleFont : UIFont = UIFont(name: "Avenir Next", size: 24.0)!
    var NormalTitleFont : UIFont = UIFont(name: "AvenirNext-Bold", size: 18.0)!
    var RegularSmallTitleFont : UIFont = UIFont(name: "AvenirNext-DemiBold", size: 13.0)!
    
    var MainRoundEdgeBackTransperncy : UIImage = UIImage(named: "MarkMarySoftTransParency")!
    
    
    ////////
    func MuseReturnPalete()->[UIColor]{
        var MuseArrayBackPallete = [UIColor]()
        let Color1 : UIColor = #colorLiteral(red: 0.3220589161, green: 0.7499501109, blue: 0.9195778966, alpha: 0.3467759683)
        let Color2 : UIColor = #colorLiteral(red: 0.9230852723, green: 0.8315538168, blue: 0.3220589161, alpha: 0.3526353433)
        let Color3 : UIColor = #colorLiteral(red: 0.9230852723, green: 0.3220589161, blue: 0.3785064816, alpha: 0.3548360475)
        let Color4 : UIColor = #colorLiteral(red: 0.3220589161, green: 0.4970731735, blue: 0.9230852723, alpha: 0.351837588)
        let Color5 : UIColor = #colorLiteral(red: 0.3672665358, green: 0.8703667521, blue: 0.714266479, alpha: 0.3528829225)
        let Color6 : UIColor = #colorLiteral(red: 0.806784153, green: 0.3296224177, blue: 0.3144833744, alpha: 0.3520576585)
        let Color7 : UIColor = #colorLiteral(red: 0.5227234364, green: 0.340945363, blue: 0.8386206627, alpha: 0.3541208187)
        let Color8 : UIColor = #colorLiteral(red: 0.9616008401, green: 0.9125601649, blue: 0.2379874587, alpha: 0.3538182218)
        let Color9 : UIColor = #colorLiteral(red: 0.9406071305, green: 0.5810187459, blue: 0.3371739388, alpha: 0.3503521127)
        let Color10 : UIColor = #colorLiteral(red: 0.1479336321, green: 0.7890565991, blue: 0.8774094582, alpha: 0.3496368838)
        let Color11 : UIColor = #colorLiteral(red: 0.8350878358, green: 0.2379874587, blue: 0.2186257243, alpha: 0.3496368838)
        let Color12 : UIColor = #colorLiteral(red: 0.8809292316, green: 0.6388890147, blue: 0.08494650573, alpha: 0.345428037)
        /////////////////////////////////////////////////////////
        //appending section
        /////////////////////////////////////////////////////////
        MuseArrayBackPallete.append(Color1)
        MuseArrayBackPallete.append(Color2)
        MuseArrayBackPallete.append(Color3)
        MuseArrayBackPallete.append(Color4)
        MuseArrayBackPallete.append(Color5)
        MuseArrayBackPallete.append(Color6)
        MuseArrayBackPallete.append(Color7)
        MuseArrayBackPallete.append(Color8)
        MuseArrayBackPallete.append(Color9)
        MuseArrayBackPallete.append(Color10)
        MuseArrayBackPallete.append(Color11)
        MuseArrayBackPallete.append(Color12)
        //// shuffling the array of colors for use later on... it can be reshuffled again like an annoying card dealer
        MuseArrayBackPallete.shuffle()
        //// section return here
        return MuseArrayBackPallete
    }
    
    ////////
    func MainReturnPalete()->[UIColor]{
        var MainArrayBackPallete = [UIColor]()
        let Color1 : UIColor = #colorLiteral(red: 0.3220589161, green: 0.7499501109, blue: 0.9195778966, alpha: 1)
        // let Color2 : UIColor = #colorLiteral(red: 0.9230852723, green: 0.8315538168, blue: 0.3220589161, alpha: 1)
        let Color3 : UIColor = #colorLiteral(red: 0.9230852723, green: 0.3220589161, blue: 0.3785064816, alpha: 1)
        let Color4 : UIColor = #colorLiteral(red: 0.3220589161, green: 0.4970731735, blue: 0.9230852723, alpha: 1)
        let Color5 : UIColor = #colorLiteral(red: 0.3672665358, green: 0.8703667521, blue: 0.714266479, alpha: 1)
        let Color6 : UIColor = #colorLiteral(red: 0.5227234364, green: 0.340945363, blue: 0.8386206627, alpha: 1)
        let Color7 : UIColor = #colorLiteral(red: 0.9616008401, green: 0.2379874587, blue: 0.6615473881, alpha: 1)
        //let Color8 : UIColor = #colorLiteral(red: 0.8816846391, green: 0.3176868534, blue: 0.1465917132, alpha: 1)
        let Color9 : UIColor = #colorLiteral(red: 0.1324193864, green: 0.8622084067, blue: 0.1942089758, alpha: 1)
        let Color10 : UIColor = #colorLiteral(red: 0.7223261444, green: 0, blue: 0.01203876907, alpha: 1)
        
        /////////////////////////////////////////////////////////
        //appending section
        /////////////////////////////////////////////////////////
        MainArrayBackPallete.append(Color1)
        //MainArrayBackPallete.append(Color2)
        MainArrayBackPallete.append(Color3)
        MainArrayBackPallete.append(Color4)
        MainArrayBackPallete.append(Color5)
        MainArrayBackPallete.append(Color6)
        MainArrayBackPallete.append(Color7)
        // MainArrayBackPallete.append(Color8)
        MainArrayBackPallete.append(Color9)
        MainArrayBackPallete.append(Color10)
        
        
        //// shuffling the array of colors for use later on... it can be reshuffled again like an annoying card dealer
        MainArrayBackPallete.shuffle()
        MainArrayBackPallete.shuffle()
        
        //// section return here
        return MainArrayBackPallete
    }
    
    
    func VideoArrayFunction()->[String?]{
        /// will place a bundle array in here to be returned
        return ["h"]
    }
    
    
    
    func shuffleColorPallete(){
        UIColorArray.shuffle()
    }
    
    /// logic for most recent view
    var StoreRecentWhich : Int = 0
    var StoreRecentCUrrent : Int = 0
    let StartLable = "START"
    let ContinueLable = "CONTINUE"
    /// Values to be used in current values:
    var Current0 = 0
    var Current1 = 0
    var Current2 = 0
    var Current3 = 0
    var Current4 = 0
    var Current5 = 0
    ///Value to be Used in Which valeus:
    var Which0 = 0
    var Which1 = 0
    var Which2 = 0
    var Which3 = 0
    var Which4 = 0
    var Which5 = 0
    
    
    func RecentLocationCurrentFunction(RecentWhich Which : Int , RecentCurrent Current: Int)-> Int{
        /// EXISTS FOR THE SAKE OF THE TABLE OC CONTINUE/START BIG BUTTON FUNCTIONALITY
        switch Which{
        case 0:
            Current0 = Current
            return Current0
            break
        case 1:
            Current1 = Current
            return Current1
            break
        case 2:
            Current2 = Current
            return Current2
            break
        case 3:
            Current3 = Current
            return Current3
            break
        case 4:
            Current4 = Current
            return Current4
            break
        case 5:
            Current5 = Current
            return Current5
            break
        default:
            return 0// worst case scenerio it returns the begining locatio
            break
        }
        
    }
    
    func StoringRecentLocationData(RecentWhich Which : Int , RecentCurrent Current: Int){
        switch Which {
        case 0:
            Current0 = Current
            Which0 = Which
            break
        case 1:
            Current1 = Current
            Which1 = Which
            break
        case 2:
            Current2 = Current
            Which2 = Which
            break
        case 3:
            Current3 = Current
            Which3 = Which
            break
        case 4:
            Current4 = Current
            Which4 = Which
            break
        case 5:
            Current5 = Current
            Which5 = Which
            break
        default:
            print("ERROR-ADDING-DATA-DUE-TO-WHICH")
            break
        }
        
    }
    
    
    
}
