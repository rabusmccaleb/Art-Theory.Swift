//
//  Protocols.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 9/30/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation

protocol MuseControlDelegate {
    func pauseFunction()
    func playFunction()
    
}


protocol SectionReturnerProtocol {
    func SectionPicker(_ type : Int)
}// will use the function above in a switch statement to return the section using a series of switch statments

protocol TableOcChoiceProtocol {
    func TableValuePicker(SectionType type : String)->String
}



