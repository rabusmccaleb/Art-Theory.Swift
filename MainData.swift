//
//  MainData.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 9/29/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation



class mainDataClass: UIViewController{
    
    var MainClassObject = ViewController()
    
    var WhichValue = 0
    
    var currentViewValue = 0
    
    struct DayModeStyleConsistency {
        var DayModeColorOfButton : UIColor = .black
        var DayModeColorOfBackGround : UIColor = .white
        var DayModeColorOfText : UIColor = .black
    }
    struct DarkModeStyleConsistency {
        var NightModeColorOfButton : UIColor = .white
        var NightModeColorOfBackGround : UIColor = UIColor(displayP3Red: 51.00, green: 44.00, blue: 44.00, alpha: 1.00)
        var NigtModecolorOfText : UIColor = .white
    }
    
    ///variables for String Array optionals
    ///variables for String Array optionals
    var elemDataArray = [Int:String]()// Stringed array optionals
    var colDataArray = [Int:String]()// Stringed array Optionals
    var shapeDataArray = [Int:String]()// Stringed array Optionals
    var perspectDataArray = [Int:String]()// Stringed Array Optionals
    var expressionDataArray = [Int:String]()// Stringed array Optionals
    var pracDataArray = [Int:String]() //Stringed array optionals
    ///variables for String Array optionals
    ///variables for String Array optionals
    var elemTableOCArray = [String]()// Stringed array optionals
    var colTableOCArray = [String]()// Stringed array Optionals
    var shapeTableOCArray = [String]()// Stringed array Optionals
    var perspectTableOCArray = [String]()// Stringed Array Optionals
    var expressionTableOCArray = [String]()// Stringed array Optionals
    var pracTableOCArray = [String]() //Stringed array optionals
    /// variables for UIImages
    /// variables for UIImages
    var elemImageData : UIImage?// may not be availible hints the optinal value
    var colImageData : UIImage?// may not be availible hints the optinal value
    var shapeImageData : UIImage?// may not be availible hints the optinal value
    var perspectImageData : UIImage?// may not be availible hints the optinal value
    var expressionImageData : UIImage?// may not be availible hints the optinal value
    var pracImageData : UIImage?// may not be availible hints the optinal value
    //Var for UIImage Dictionaries
    var elemUIImageAndKeyDictionary = [Int:UIImage?]()// optional value if the UIimage isn't there
    var colUIImageAndKeyDictionary = [Int:UIImage?]()// optional value if the UIimage isn't there
    var shapeUIImageAndKeyDictionary = [Int:UIImage?]()// optional value if the UIimage isn't there
    var perspecUIImageAndKeyDictionary = [Int:UIImage?]()// optional value if the UIimage isn't there
    var expressionUIImageAndKeyDictionary = [Int:UIImage?]()// optional value if the image isn't there
    var pracUIImageAndKeyDictionary = [Int:UIImage?]()// optional value if the UIimage isn't there
    // Var for Audio Dictionaries
    var elemAudDictionary = [Int:String?]()
    var colAudDictionary = [Int:String?]()
    var shapeAudDictionary = [Int:String?]()
    var perspecAudDictionary = [Int:String?]()
    var expressionAudDictionary = [Int:String?]()
    var pracAudDictionary = [Int:String?]()
    
    /// Var for Arista inside of the ViewStlye 5 FIVE:
    
    var elemArtistaDictionary = [Int:String]()
    var colArtistaDictionary = [Int:String]()
    var shapeArtistaDictionary = [Int:String]()
    var perspecArtistaDictionary = [Int:String]()
    var expressionArtistaDictionary = [Int:String]()
    var pracArtistaDictionary = [Int:String]()
    
    /// VARS FOR MAIN TEXT and OPTIONAL UIIMAGE FOR VIEW STYLE 4 FOUR:
    var elemStyleTwoMainDictionary = [Int:String]()
    var colStyleTwoMainDictionary = [Int:String]()
    var shapeStyleTwoMainDictionary = [Int:String]()
    var perspecStyleTwoMainDictionary = [Int:String]()
    var expressionStyleTwoMainDictionary = [Int:String]()
    var pracStyleTwoMainDictionary = [Int:String]()
    
    var elemStyleTwoImageDictionary = [Int:UIImage]()
    var colStyleTwoImageDictionary = [Int:UIImage]()
    var shapeStyleTwoImageDictionary = [Int:UIImage]()
    var perspecStyleTwoImageDictionary = [Int:UIImage]()
    var expressionStyleTwoImageDictionary = [Int:UIImage]()
    var pracStyleTwoImageDictionary = [Int:UIImage]()
    
    func SendingDataToSingleton(){
        StateFavsSingletonClass.share.TestoElem = ElemStringData()
        StateFavsSingletonClass.share.TestoCol = ColStringData()
        StateFavsSingletonClass.share.TestoShape = ShapeStringData()
        StateFavsSingletonClass.share.TestoPerspect = PerspectStringData()
        StateFavsSingletonClass.share.TestoExpression = ExpressStringData()
        StateFavsSingletonClass.share.TestoPrac = PracStringData()
        // Immagine:
        StateFavsSingletonClass.share.ImmagineElem = ElemUIImageDictionaryFunc()
        StateFavsSingletonClass.share.ImmagineCol = ColUIImageDictionaryFunc()
        StateFavsSingletonClass.share.ImmagineShape = ShapeUIImageDictionaryFunc()
        StateFavsSingletonClass.share.ImmaginePerspect = PerspectUIImageDictionaryFunc()
        StateFavsSingletonClass.share.ImmagineExpression = ExpressionUIImageDictionaryFunc()
        StateFavsSingletonClass.share.ImmaginePrac = PracUIImageDictionaryFunc()
        /// this class is called in the viewcontroller class via instance of of this class... this way on load the data is already passed to this class such that the data can then be used immeaditly
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////

    
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////

                                        //EelementsDATA
    ///// testo
    func ElemStringData()->[Int:String]{
        //returning all stringed data in an artay to be parsed through
        // appending all string to the array returned below
        elemDataArray = [1:"l"]
        

       return elemDataArray
    }
    
    
    
    
    func ElemTitoloData()->[String]{
        var ElemtitloArray = [String]()
        ElemtitloArray.append("Elements")
        ElemtitloArray.append("Elements 2")
        ElemtitloArray.append("Elements 3")
        // all titles are added here and appeneded  ass seen here below
        return ElemtitloArray
    }
    
    
    func ElemUIImageDictionaryFunc()->[Int : UIImage?]{
        ImageSingleton.share.ReturnImageString()
        elemUIImageAndKeyDictionary = [
            1: UIImage(contentsOfFile: ImageSingleton.share.ImageString[2]!)!
        ]
        
        
        // all the dictionary values are placed here and returned below as seen there
        return elemUIImageAndKeyDictionary
    }
    func ElemUrlPaginaFunc()-> [Int:String]{
        var ElemPaginaStringArray = [Int:String]()
    // url link connection with the producer are entered here, appended, then returne
        return ElemPaginaStringArray
    }
    
    func ElemAudStringsDictionary ()->[Int:String?]{
        // dictionary takes all the values and palces them into the the dictionary returned below and assign a valeu to them and again returns it... so now it's all just about producing this data
        return ElemAudStringsDictionary()
    }
    func ElemArtistaStringDictionary()->[Int:String]{
        
        return elemArtistaDictionary
    }
    func ElemStyleTwoMainDictionary()->[Int:String]{
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
         elemStyleTwoMainDictionary = [
            0: "Elements",
         1 : "More Stuff"
        ]

        return elemStyleTwoMainDictionary
    }
    
    func ElemStyleTwoImageDictionary()->[Int:UIImage]{
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
       elemStyleTwoImageDictionary =  [
        0: UIImage(contentsOfFile: ImageSingleton.share.ImageString[3]!)! ,
        1: UIImage(contentsOfFile: ImageSingleton.share.ImageString[4]!)!
        ]
        return elemStyleTwoImageDictionary
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
                                            //ColorDATA
    /// Testo
    func ColStringData()->[Int:String]{
        //returning all stringed data in an array to be parsed through
        //appending all string to the array returned below
        return colDataArray
    }
    
    func ColTitoloData()->[String]{
        var ColTitloArray = [String]()
        ColTitloArray.append("Color Theory")
        // all titles are added here and appeneded  ass seen here below
        return ColTitloArray
    }
    
    
    func ColUIImageDictionaryFunc()-> [Int : UIImage?]{
        // all the dictionary values are placed here and returned below as seen there
        return colUIImageAndKeyDictionary
    }
    func ColUrlPaginaFunc ()->[Int:String] {
        var ColPaginaStringArray = [Int:String]()
        // url link connection with the producer are entered here, appended, then returned
        return ColPaginaStringArray
        
    }
    func ColAudStringsDictionary ()->[Int:String?]{
        // dictionary takes all the values and palces them into the the dictionary returned below and assign a valeu to them and again returns it... so now it's all just about producing this data
        return ColAudStringsDictionary()
    }
    func ColArtistaStringDictionary()->[Int:String]{
        //// Sting of artista name meant to be added here
        //// tht int is to alligne it one to one with the values represented in the current view counter
        return colArtistaDictionary
    }
    func ColStyleTwoMainDictionary()->[Int:String]{
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
        return colStyleTwoMainDictionary
    }
    func ColStyleTwoImageDictionary()->[Int:UIImage]{
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
        return colStyleTwoImageDictionary
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
                                            //ShapeDATA
    //Testo
    func ShapeStringData()-> [Int:String]{
        //returning all stringed data in an artay to be parsed through
        // appending all string to the array returned below
        
        return shapeDataArray
    }

    func ShapeTitoloData()->[String]{
        var ShapeTitloArray = [String]()
        // all titles are added here and appeneded  ass seen here below
        ShapeTitloArray.append("Shape")
        return ShapeTitloArray
    }
    
    
    func ShapeUIImageDictionaryFunc()->[Int:UIImage?]{
        // all the dictionary values are placed here and returned below as seen there
        return shapeUIImageAndKeyDictionary
    }
    func ShapeUrlPaginaFunc()->[Int:String]{
        var ShapePaginaStringArray = [Int:String]()
        // url link connection with the producer are entered here, appended, then returned
        return ShapePaginaStringArray
    }
    func ShapeAudStringsDictionary ()->[Int:String?]{
        // dictionary takes all the values and palces them into the the dictionary returned below and assign a valeu to them and again returns it... so now it's all just about producing this data
        return ShapeAudStringsDictionary()
    }
    func ShapeArtistaStringDictionary()->[Int:String]{
        //// Sting of artista name meant to be added here
        //// tht int is to alligne it one to one with the values represented in the current view counter
        return shapeArtistaDictionary
    }
    func ShapeStyleTwoMainDictionary()->[Int:String]{
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
        return shapeStyleTwoMainDictionary
    }
    func ShapeStyleTwoImageDictionary()->[Int:UIImage]{
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
        return shapeStyleTwoImageDictionary
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
                                        //PerspectDATA
    //Testo
    func PerspectStringData()->[Int:String]{
        perspectDataArray = [
            1:"""
            This is a topic that can seem overwhelming to many but rest assured it’s much less complicated then the social perspective around it. For perspective, the only things you need to be capable of drawing is a dot and a few lines
            """
            ,
            2:"""
            Let’s begin by talking about how to think of perspective. First and foremost, don’t think of perspective in terms of art. We will get to that understanding later. Think of perspective in terms of simple geometry and size. Let’s begin by talking about how to think of perspective. First and foremost, don’t think of perspective in terms of art. We will get to that understanding later. Think of perspective in terms of simple geometry and size.
            """,
            3:"""
            Lets break down the geometric approach, which I know doesn’t sound easy, but for this section we will be talking about simple geometry in relation to “Depth”
            """]
        //returning all stringed data in an artay to be parsed through
        // appending all string to the array returned below
        
        print("Main Data Class: Method: PerspectStringData()  \(perspectDataArray)")
        return perspectDataArray
    }
    
    func PerspectTitoloData()->[String]{
        var PerspTitloArray = [String]()
        // all titles are added here and appeneded  ass seen here below
        PerspTitloArray.append("Perspective")
        PerspTitloArray.append("Perspective")
        PerspTitloArray.append("Perspective")
        PerspTitloArray.append("Perspective")
        PerspTitloArray.append("Perspective")
        PerspTitloArray.append("Perspective")
        PerspTitloArray.append("Perspective")
        PerspTitloArray.append("Perspective")
        PerspTitloArray.append("Perspective")
        PerspTitloArray.append("Perspective")
        PerspTitloArray.append("Perspective")

        return PerspTitloArray
    }
    
    
    /// #imageLiteral(resourceName: <#T##String#>)// image litera will be used often there minus will be a copyable example of it in this class to make the easy to access rather than waiting on the computer
    func PerspectUIImageDictionaryFunc()->[Int:UIImage?]{
        // all the dictionary values are placed here and returned below as seen there
        // the for entering data for to be diaplayed in the subviews is seen below
        perspecUIImageAndKeyDictionary = [
            2: UIImage(contentsOfFile: ImageSingleton.share.ImageString[17]!)!,
            3: UIImage(contentsOfFile: ImageSingleton.share.ImageString[7]!)!,
            5 : UIImage(contentsOfFile: ImageSingleton.share.ImageString[112]!)!
        ]
        
        return perspecUIImageAndKeyDictionary
    }
    func PerspectUrlPaginaFunc()->[Int:String]{
        var PerspectPaginaStringArray = [Int:String]()
        // url link connection with the producer are entered here, appended, then returned
        return PerspectPaginaStringArray
    }
    func PerspectAudStringsDictionary ()->[Int:String?]{
        // dictionary takes all the values and palces them into the the dictionary returned below and assign a valeu to them and again returns it... so now it's all just about producing this data
        return PerspectAudStringsDictionary()
    }
    func PerspectArtistaStringDictionary()->[Int:String]{
        //// Sting of artista name meant to be added here
        //// tht int is to alligne it one to one with the values represented in the current view counter
        perspecArtistaDictionary = [5 : "Edward Hopper"]
        return perspecArtistaDictionary
    }
    func PerspectStyleTwoMainDictionary()->[Int:String]{
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
        perspecStyleTwoMainDictionary = [
            0: "Lets Talk Perspective",
            1:"",
            4:"Does it work?"]
        return perspecStyleTwoMainDictionary
    }
    func PerspectStyleTwoImageDictionary()->[Int:UIImage]{
        perspecStyleTwoImageDictionary = [
            0 : UIImage(contentsOfFile: ImageSingleton.share.ImageString[10]!)!,
            4 : UIImage(contentsOfFile: ImageSingleton.share.ImageString[7]!)!
            
        ]
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
        return perspecStyleTwoImageDictionary
    }
    ///////////////////////////////////////////////////////// //////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
                                            //ExpressionDATA
    //Testo
    func ExpressStringData()->[Int:String]{
        //returning all stringed data in an artay to be parsed through
        // appending all string to the array returned below
        return expressionDataArray
    }
    func ExpressionTitoloData()->[String]{
        var ExpressionTitloArray = [String]()
        // all titles are added here and appeneded  ass seen here below
        ExpressionTitloArray.append("Expression")
        return ExpressionTitloArray
    }

    
    func ExpressionUIImageDictionaryFunc()->[Int:UIImage?]{
        // all the dictionary values are placed here and returned below as seen there
        return expressionUIImageAndKeyDictionary
    }
    func ExpressionUrlPaginaFunc ()->[Int:String]{
        var ExpressionPaginaStringArray = [Int:String]()
        // url link connection with the producer are entered here, appended, then returned
        return ExpressionPaginaStringArray
    }
    func ExpressionAudStringsDictionary ()->[Int:String?]{
        // dictionary takes all the values and palces them into the the dictionary returned below and assign a valeu to them and again returns it... so now it's all just about producing this data
        return expressionAudDictionary
    }
    func ExpressionArtistaStringDictionary()->[Int:String]{
        //// Sting of artista name meant to be added here
        //// tht int is to alligne it one to one with the values represented in the current view counter
        return expressionArtistaDictionary
    }
    func ExpressionStyleTwoMainDictionary()->[Int:String]{
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
        return expressionStyleTwoMainDictionary
    }
    func ExpressionStyleTwoImageDictionary()->[Int:UIImage]{
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
        return expressionStyleTwoImageDictionary
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
                                            //PracticeDATA
    //Testo
    func PracStringData()->[Int:String]{
        //returning all stringed data in an artay to be parsed through
        // appending all string to the array returned below
        return pracDataArray
    }

    func PracTitoloData()->[String]{
        var PracTitloArray = [String]()
        // all titles are added here and appeneded  ass seen here below
        PracTitloArray.append("Practice")
        
        return PracTitloArray
    }
    
    
    func PracUIImageDictionaryFunc()->[Int:UIImage?]{
        // all the dictionary values are placed here and returned below as seen there
        
        return pracUIImageAndKeyDictionary
    }
    func PracUrlPaginaFunc()->[Int:String]{
        var PracPaginaStringArray = [Int:String]()
        // url link connection with the producer are entered here, appended, then returned
        return PracPaginaStringArray
    }
    func PracAudStringsDictionary ()->[Int:String?]{
        // dictionary takes all the values and palces them into the the dictionary returned below and assign a valeu to them and again returns it... so now it's all just about producing this data
        return PracAudStringsDictionary()
    }
    func PracArtistaStringDictionary()->[Int:String]{
        //// Sting of artista name meant to be added here
        //// tht int is to alligne it one to one with the values represented in the current view counter
        return pracArtistaDictionary
    }
    func PracStyleTwoMainDictionary()->[Int:String]{
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
        return pracStyleTwoMainDictionary
    }
    func PracStyleTwoImageDictionary()->[Int:UIImage]{
        //// for returning main string for view style 2...will use this method to add data to the dictionary predefined above and a value locatin for it to be presented when/if the time comes.... the time will come.... soon my sun
        return pracStyleTwoImageDictionary
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    
}/// end of MainData class brackets
