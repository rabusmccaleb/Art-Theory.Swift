//
//  PracticeToddView.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 2/6/20.
//  Copyright © 2020 Rabus Mccaleb. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class PracticeToddController: UIViewController{
    
    @IBOutlet weak var PracticeView : UIView!
    @IBOutlet weak var ImmagineView : UIImageView!
    var viewCounter : Int?
    var scoreCounter : Int?
    var ImmagineArray : [UIImage] = [UIImage]()
    var StringOfArray : [String?] = [String?]()
    var ViewScore = AVAudioPlayer()
    
    override func viewWillAppear(_ animated: Bool) {
        //
        ImmagineArray = [
            UIImage(contentsOfFile:  Bundle.main.path(forResource: "0lb", ofType: "tif")!)!,
            UIImage(contentsOfFile:  Bundle.main.path(forResource: "1lb", ofType: "tif")!)!,
            UIImage(contentsOfFile:  Bundle.main.path(forResource: "2lb", ofType: "tif")!)!,
            UIImage(contentsOfFile:  Bundle.main.path(forResource: "3lb", ofType: "tif")!)!,
            UIImage(contentsOfFile:  Bundle.main.path(forResource: "4lb", ofType: "tif")!)!,
            UIImage(contentsOfFile:  Bundle.main.path(forResource: "5lb", ofType: "tif")!)!
        ]
        
        viewCounter  = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        //
    }
        
    func museFunction(){
        do{
                print("There Is StringData")
            //ViewScore = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: MuseBundleGrab()!))
            
            ViewScore.prepareToPlay()
            
            let musicSession = AVAudioSession.sharedInstance()
            do{
                
                let sessionEr = try musicSession.setCategory(AVAudioSession.Category.playback)
            }catch let sessionErr{print("session errot")
                
            }
            
            
        }catch let songErr{print("songErr")
            
        }
    }
    
    func CallAutoPlay(){
        
    }
    
    func Updater(){
        if viewCounter != nil{
            if ImmagineArray.isEmpty == false{
                if viewCounter! < ImmagineArray.count{
                    viewCounter = viewCounter! + 1
                }else{
                    viewCounter = ImmagineArray.count - 1// aka value is equal to it's maximum value
                }
            }// checking if the immagine array is empty first
        }// end of checking if the view counter is nil bracket
    }// end of updater function bracket
    
    
    
    
    
    
}
