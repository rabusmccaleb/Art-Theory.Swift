//
//  PaginaViewClass.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 10/17/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit
import WebKit

class PaginaViewClass : UIViewController{


    @IBOutlet weak var DismissImmagine: UIImageView!
    @IBOutlet weak var DismissButton: UIButton!
    @IBOutlet weak var FrostedView: UIView!
    @IBOutlet weak var LoadingViewProgress: UIProgressView!
    /// view did load function
    override func viewWillAppear(_ animated: Bool) {
        LoadingViewProgress.progress = Float(0.0)
        LoadingViewProgress.setProgress(Float(0.0), animated: true)/// starting the view at zero before it even loads... such that when the view does begin to load it can jump to .5
    }
    override func viewDidLoad() {
       super.viewDidLoad()
        PaginaLoadingTimer()
        LoadingViewProgress.trackTintColor = StateFavsSingletonClass.share.ProgressoUnfilledSection
        LoadingViewProgress.progressTintColor = StateFavsSingletonClass.share.MuseProgressoProgress
        LoadingViewProgress.tintColor = .clear/// set this to no color  in general
        // code insert here
        let Frosted : UIBlurEffect = UIBlurEffect(style: .dark)
        let FrostedVisualView : UIVisualEffectView = UIVisualEffectView(effect: Frosted)
        FrostedView.addSubview(FrostedVisualView)
        FrostedVisualView.frame = FrostedView.bounds
        self.view.layer.cornerRadius = 15.0
        self.view.clipsToBounds = true
        PaginaLoadingSet.shuffle()/// pagina set to be randominzed in between .5 and .9/// to be displayed
        DismissImmagine.image = #imageLiteral(resourceName: "MarkMaryLogoControlInitalLoad")
        //LoadingViewProgress.trackTintColor =
    }

    @IBAction func DismissButtonFunction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DismissPanGestureFunction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var PaginaTimer : Timer?
    var PaginaLoadingSet : [Float] = [0.5, 0.7, 0.8 , 0.9]
    
    func PaginaLoadingTimer(){
        var PaginaTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(UpdateLoadProgress), userInfo: nil
            , repeats: true)
        /// Is triggered until the page loads.... then is to invalidated
        
    }
    @objc func UpdateLoadProgress(){
        
        if PaginaSingleton.share.PaginaIsLoading == true{
            LoadingViewProgress.progress = Float(PaginaLoadingSet[1])//set to what ever is the second value in the set
            LoadingViewProgress.setProgress(Float(PaginaLoadingSet[1]), animated: true)/// setting the progress view to that value.... this should update it
        }
        
        if PaginaSingleton.share.PaginaDidLoad == true {
            LoadingViewProgress.progress = Float(0.97)
            LoadingViewProgress.setProgress(Float(0.97), animated: true)
            var DidLoadTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(HideProgressBar), userInfo: nil, repeats: false)
        }
    }
    
    @objc func HideProgressBar(){
        PaginaTimer?.invalidate()/// turns timer off
        LoadingViewProgress.isHidden = true
    }
    
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}/// end of class bracket


