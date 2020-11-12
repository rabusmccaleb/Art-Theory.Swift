//
//  TableOcData.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 9/30/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation

class TableOcData : UIViewController{
    
    var MainContentLable : String = ""
    var MainContentTableViewArray = [String]()
    
    ///For TableOc Display... when sectioner is added also append it to here, with a number associated with it's location order-- order in mind should be related to the CurrentViewValue Knowledge--But this also gives more freedom for displaying content and Sectioners titolo's with more prescion because these values are set beside the data... the int values will be used in the tableOC to update the current view value:
    var TableOcSectionerElem = [[Int:String]]()
    var TableOcSectionerCol = [[Int:String]]()
    var TableOcSectionerShape = [[Int:String]]()
    var TableOcSectionerPerspect = [[Int:String]]()
    var TableOcSectionerExpression = [[Int:String]]()
    var TableOcSectionerPrac = [[Int:String]]()
    
    ///For TableOc Display... when cont is added also append it to here, with a number associated with it's location order-- order in mind should be related to the CurrentViewValue Knowledge--But this also gives more freedom for displaying content and Sectioners titolo's with more prescion because these values are set beside the data... the int values will be used in the tableOC to update the current view value:
    var TableOcConternElem = [[Int:String]]()
    var TableOcConternCol = [[Int:String]]()
    var TableOcConternShape = [[Int:String]]()
    var TableOcConternPerspect = [[Int:String]]()
    var TableOcConternExpression = [[Int:String]]()
    var TableOcConternPrac = [[Int:String]]()
    
    /// this class is done all that is needed now is data to be passed through
    
    //// ELEM
    //// ELEM
    //// ELEM
    //// ELEM
    //// ELEM
    
    func ElemTableOcSection()->[[Int:String]]{
        
        /// appending tableOC section
        TableOcSectionerElem.append([0:"Elements Introduction"])
        TableOcSectionerElem.append([3:"Elemental Importance"])
        
        return TableOcSectionerElem
        
    }
    func ElemTableOcContent()->[[Int:String]]{
        
        // appending tableOC Con
        TableOcConternElem.append([1:"Stuff About elements"])
        TableOcConternElem.append([2:"Things About elements"])
        TableOcConternElem.append([4:"More Strings"])
        
        return TableOcConternElem
    }
    
    
    ////COL
    ////COL
    ////COL
    func ColTableOcSection()->[[Int:String]]{
        
        
        return TableOcSectionerCol
    }
    //TableOc
    func ColTableOcContent()->[[Int:String]]{
        
        
        
        return TableOcConternCol
    }
    
    
    //// SHAPE
    //// SHAPE
    //// SHAPE
    
    //TableOC Sections
    func ShapeTableOcSection()->[[Int:String]]{
        
        return TableOcSectionerShape
    }
    //TableOc Content
    func ShapeTableOcContent()->[[Int:String]]{
        
        return TableOcConternShape
        
    }
    
    //Table Oc Section
    
    //// PER
    //// PER
    //// PER
    func PerspectTableOcSection()->[[Int:String]]{
        TableOcSectionerPerspect.append([0:"Introduction To Perspective"])
        
        
        
        
        return TableOcSectionerPerspect
    }
    //TableOc Content
    func PerspectTableOcContent()->[[Int:String]]{
        TableOcConternPerspect.append([1: "What is Pespective in Art?"])
        TableOcConternPerspect.append([4: "Why Should You use Pespective?"])
        
        
        
        return TableOcConternPerspect
    }
    
    
    //// EXPR
    //// EXPR
    //// EXPR
    
    //TableOC Section:
    func ExpressionTableOcSection()->[[Int:String]]{
        
        
        
        return TableOcSectionerExpression
    }
    //TableOC Contet:
    func ExpressionTableOcContent()->[[Int:String]]{
        
        
        return TableOcConternExpression
        
    }
    
    //// PRAC
    //// PRAC
    //// PRAC
    
    //TableOc Section:
    func PracTableOcSection()->[[Int:String]]{
        
        
        
        return TableOcSectionerPrac
        
    }
    //TableOC Content:
    func PracTableOcContent()->[[Int:String]]{
        // appending Content
        
        
        
        return TableOcConternPrac
        
    }
    
    
}// END OF CLASS BRACKETS // END OF CLASS BRACKETS // END OF CLASS BRACKETS



