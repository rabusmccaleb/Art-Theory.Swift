//
//  ImageSingleton.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 12/30/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit

class ImageSingleton{
    
    private init(){

    }
    static var share = ImageSingleton()
    
    var FavedArrayData = [Int]()// one to one relation ship between values such that what is stored is accessable for m all classes... though only two classes will need it
    
    var ImageString = [String?]()
    func ReturnImageString(){
        ImageString = [
        Bundle.main.path(forResource: "0", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "1", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "2", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "3", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "4", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "5", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "6", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "7", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "8", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "9", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "10", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "11", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "12", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "13", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "14", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "15", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "16", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "17", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "18", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "19", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "20", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "21", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "22", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "23", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "24", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "25", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "26", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "27", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "28", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "29", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "30", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "31", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "32", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "33", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "34", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "35", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "36", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "37", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "38", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "39", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "40", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "41", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "42", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "43", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "44", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "45", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "46", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "47", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "48", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "49", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "50", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "51", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "52", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "53", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "54", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "55", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "56", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "57", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "58", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "59", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "60", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "61", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "62", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "63", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "64", ofType: "jpg", inDirectory: "Gallery Images"),
        Bundle.main.path(forResource: "65", ofType: "jpg", inDirectory: "Gallery Images"),
        
        
        
        Bundle.main.path(forResource: "66", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "67", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "68", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "69", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "70", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "71", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "72", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "73", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "74", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "75", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "76", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "77", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "78", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "79", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "80", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "81", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "82", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "83", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "84", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "85", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "86", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "87", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "88", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "89", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "90", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "91", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "92", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "93", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "94", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "95", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "96", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "97", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "98", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "99", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "100", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "101", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "102", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "103", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "104", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "105", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "106", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "107", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "108", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "109", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "110", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "111", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "112", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "113", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "114", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "115", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "116", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "117", ofType: "jpg", inDirectory: "MarkMaryPBDomain"),
        Bundle.main.path(forResource: "118", ofType: "jpg", inDirectory: "MarkMaryPBDomain")
                
        
        
        
            
            
        ]
      
    }
    
    func ImageDictionaryBundleReturn()->[[Int : String?]]{
        let ImageDictionaryBundle = [
            [0 : Bundle.main.path(forResource: "0", ofType: "jpg", inDirectory: "Gallery Images")],
            [1 : Bundle.main.path(forResource: "1", ofType: "jpg", inDirectory: "Gallery Images")],
            [2 : Bundle.main.path(forResource: "2", ofType: "jpg", inDirectory: "Gallery Images")],
            [3 : Bundle.main.path(forResource: "3", ofType: "jpg", inDirectory: "Gallery Images")],
            [4 : Bundle.main.path(forResource: "4", ofType: "jpg", inDirectory: "Gallery Images")],
            [5 : Bundle.main.path(forResource: "5", ofType: "jpg", inDirectory: "Gallery Images")],
            [6 : Bundle.main.path(forResource: "6", ofType: "jpg", inDirectory: "Gallery Images")],
            [7 : Bundle.main.path(forResource: "7", ofType: "jpg", inDirectory: "Gallery Images")],
            [8 : Bundle.main.path(forResource: "8", ofType: "jpg", inDirectory: "Gallery Images")],
            [9 : Bundle.main.path(forResource: "9", ofType: "jpg", inDirectory: "Gallery Images")],
            [10 : Bundle.main.path(forResource: "10", ofType: "jpg", inDirectory: "Gallery Images")],
            [11 : Bundle.main.path(forResource: "11", ofType: "jpg", inDirectory: "Gallery Images")],
            [12 : Bundle.main.path(forResource: "12", ofType: "jpg", inDirectory: "Gallery Images")],
            [13 : Bundle.main.path(forResource: "13", ofType: "jpg", inDirectory: "Gallery Images")],
            [14 : Bundle.main.path(forResource: "14", ofType: "jpg", inDirectory: "Gallery Images")],
            [15 : Bundle.main.path(forResource: "15", ofType: "jpg", inDirectory: "Gallery Images")],
            [16 : Bundle.main.path(forResource: "16", ofType: "jpg", inDirectory: "Gallery Images")],
            [17 : Bundle.main.path(forResource: "17", ofType: "jpg", inDirectory: "Gallery Images")],
            [18 : Bundle.main.path(forResource: "18", ofType: "jpg", inDirectory: "Gallery Images")],
            [19 : Bundle.main.path(forResource: "19", ofType: "jpg", inDirectory: "Gallery Images")],
            [20 : Bundle.main.path(forResource: "20", ofType: "jpg", inDirectory: "Gallery Images")],
            [21 : Bundle.main.path(forResource: "21", ofType: "jpg", inDirectory: "Gallery Images")],
            [22 : Bundle.main.path(forResource: "22", ofType: "jpg", inDirectory: "Gallery Images")],
            [23 : Bundle.main.path(forResource: "23", ofType: "jpg", inDirectory: "Gallery Images")],
            [24 : Bundle.main.path(forResource: "24", ofType: "jpg", inDirectory: "Gallery Images")],
            [25 : Bundle.main.path(forResource: "25", ofType: "jpg", inDirectory: "Gallery Images")],
            [26 : Bundle.main.path(forResource: "26", ofType: "jpg", inDirectory: "Gallery Images")],
            [27 : Bundle.main.path(forResource: "27", ofType: "jpg", inDirectory: "Gallery Images")],
            [28 : Bundle.main.path(forResource: "28", ofType: "jpg", inDirectory: "Gallery Images")],
            [29 : Bundle.main.path(forResource: "29", ofType: "jpg", inDirectory: "Gallery Images")],
            [30 : Bundle.main.path(forResource: "30", ofType: "jpg", inDirectory: "Gallery Images")],
            [31 : Bundle.main.path(forResource: "31", ofType: "jpg", inDirectory: "Gallery Images")],
            [32 : Bundle.main.path(forResource: "32", ofType: "jpg", inDirectory: "Gallery Images")],
            [33 : Bundle.main.path(forResource: "33", ofType: "jpg", inDirectory: "Gallery Images")],
            [34 : Bundle.main.path(forResource: "34", ofType: "jpg", inDirectory: "Gallery Images")],
            [35 : Bundle.main.path(forResource: "35", ofType: "jpg", inDirectory: "Gallery Images")],
            [36 : Bundle.main.path(forResource: "36", ofType: "jpg", inDirectory: "Gallery Images")],
            [37 : Bundle.main.path(forResource: "37", ofType: "jpg", inDirectory: "Gallery Images")],
            [38 : Bundle.main.path(forResource: "38", ofType: "jpg", inDirectory: "Gallery Images")],
            [39 : Bundle.main.path(forResource: "39", ofType: "jpg", inDirectory: "Gallery Images")],
            [40 : Bundle.main.path(forResource: "40", ofType: "jpg", inDirectory: "Gallery Images")],
            [41 : Bundle.main.path(forResource: "41", ofType: "jpg", inDirectory: "Gallery Images")],
            [42 : Bundle.main.path(forResource: "42", ofType: "jpg", inDirectory: "Gallery Images")],
            [43 : Bundle.main.path(forResource: "43", ofType: "jpg", inDirectory: "Gallery Images")],
            [44 : Bundle.main.path(forResource: "44", ofType: "jpg", inDirectory: "Gallery Images")],
            [45 : Bundle.main.path(forResource: "45", ofType: "jpg", inDirectory: "Gallery Images")],
            [46 : Bundle.main.path(forResource: "46", ofType: "jpg", inDirectory: "Gallery Images")],
            [47 : Bundle.main.path(forResource: "47", ofType: "jpg", inDirectory: "Gallery Images")],
            [48 : Bundle.main.path(forResource: "48", ofType: "jpg", inDirectory: "Gallery Images")],
            [49 : Bundle.main.path(forResource: "49", ofType: "jpg", inDirectory: "Gallery Images")],
            [50 : Bundle.main.path(forResource: "50", ofType: "jpg", inDirectory: "Gallery Images")],
            [51 : Bundle.main.path(forResource: "51", ofType: "jpg", inDirectory: "Gallery Images")],
            [52 : Bundle.main.path(forResource: "52", ofType: "jpg", inDirectory: "Gallery Images")],
            [53 : Bundle.main.path(forResource: "53", ofType: "jpg", inDirectory: "Gallery Images")],
            [54 : Bundle.main.path(forResource: "54", ofType: "jpg", inDirectory: "Gallery Images")],
            [55 : Bundle.main.path(forResource: "55", ofType: "jpg", inDirectory: "Gallery Images")],
            [56 : Bundle.main.path(forResource: "56", ofType: "jpg", inDirectory: "Gallery Images")],
            [57 : Bundle.main.path(forResource: "57", ofType: "jpg", inDirectory: "Gallery Images")],
            [58 : Bundle.main.path(forResource: "58", ofType: "jpg", inDirectory: "Gallery Images")],
            [59 : Bundle.main.path(forResource: "59", ofType: "jpg", inDirectory: "Gallery Images")],
            [60 : Bundle.main.path(forResource: "60", ofType: "jpg", inDirectory: "Gallery Images")],
            [61 : Bundle.main.path(forResource: "61", ofType: "jpg", inDirectory: "Gallery Images")],
            [62 : Bundle.main.path(forResource: "62", ofType: "jpg", inDirectory: "Gallery Images")],
            [63 : Bundle.main.path(forResource: "63", ofType: "jpg", inDirectory: "Gallery Images")],
            [64 : Bundle.main.path(forResource: "64", ofType: "jpg", inDirectory: "Gallery Images")],
            [65 : Bundle.main.path(forResource: "65", ofType: "jpg", inDirectory: "Gallery Images")],
            
            
            
            [66 : Bundle.main.path(forResource: "66", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [67 : Bundle.main.path(forResource: "67", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [68 : Bundle.main.path(forResource: "68", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [69 : Bundle.main.path(forResource: "69", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [70 : Bundle.main.path(forResource: "70", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [71 : Bundle.main.path(forResource: "71", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [72 : Bundle.main.path(forResource: "72", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [73 : Bundle.main.path(forResource: "73", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [74 : Bundle.main.path(forResource: "74", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [75 : Bundle.main.path(forResource: "75", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [76 : Bundle.main.path(forResource: "76", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [77 : Bundle.main.path(forResource: "77", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [78 : Bundle.main.path(forResource: "78", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [79 : Bundle.main.path(forResource: "79", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [80 : Bundle.main.path(forResource: "80", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [81 : Bundle.main.path(forResource: "81", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [82 : Bundle.main.path(forResource: "82", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [83 : Bundle.main.path(forResource: "83", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [84 : Bundle.main.path(forResource: "84", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [85 : Bundle.main.path(forResource: "85", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [86 : Bundle.main.path(forResource: "86", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [87 : Bundle.main.path(forResource: "87", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [88 : Bundle.main.path(forResource: "88", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [89 : Bundle.main.path(forResource: "89", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [90 : Bundle.main.path(forResource: "90", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [91 : Bundle.main.path(forResource: "91", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [92 : Bundle.main.path(forResource: "92", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [93 : Bundle.main.path(forResource: "93", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [94 : Bundle.main.path(forResource: "94", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [95 : Bundle.main.path(forResource: "95", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [96 : Bundle.main.path(forResource: "96", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [97 : Bundle.main.path(forResource: "97", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [98 : Bundle.main.path(forResource: "98", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [99 : Bundle.main.path(forResource: "99", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [100 : Bundle.main.path(forResource: "100", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [101 : Bundle.main.path(forResource: "101", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [102 : Bundle.main.path(forResource: "102", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [103 : Bundle.main.path(forResource: "103", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [104 : Bundle.main.path(forResource: "104", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [105 : Bundle.main.path(forResource: "105", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [106 : Bundle.main.path(forResource: "106", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [107 : Bundle.main.path(forResource: "107", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [108 : Bundle.main.path(forResource: "108", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [109 : Bundle.main.path(forResource: "109", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [110 : Bundle.main.path(forResource: "110", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [111 : Bundle.main.path(forResource: "111", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [112 : Bundle.main.path(forResource: "112", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [113 : Bundle.main.path(forResource: "113", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [114 : Bundle.main.path(forResource: "114", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [115 : Bundle.main.path(forResource: "115", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [116 : Bundle.main.path(forResource: "116", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [117 : Bundle.main.path(forResource: "117", ofType: "jpg", inDirectory: "MarkMaryPBDomain")],
            [118 : Bundle.main.path(forResource: "118", ofType: "jpg", inDirectory: "MarkMaryPBDomain")]
            
        ]/// retunrs a dictionary such that values are easily set without confrintation and accessable from all classes
        
        return ImageDictionaryBundle
    }
    
}
