//
//  PaginaSingleton.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 10/17/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit

class PaginaSingleton{
    
    private init(){
        /// should be functional
    }
    
    static let share = PaginaSingleton()
    
    var PaginaURL : String = "https://www.instagram.com/rossoleo_/"/// default is to Rosso Leo
    
    var PaginaIsLoading : Bool = false
    var PaginaDidLoad : Bool = false

    
    
    
}////// end of singleton class bracket
