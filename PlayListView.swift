//
//  PlayListView.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 9/5/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation


class PlayListView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var ArtistLabel: UILabel!
    
    @IBOutlet weak var TempoLable: UILabel!
    
    @IBOutlet weak var FrostedView: UIView!
    
    @IBOutlet weak var PlaylistTopBackImage: UIImageView!
    
    @IBOutlet weak var MuseContentLable: UILabel!
    
    @IBOutlet weak var MuseContentTableView: UITableView!
    
    @IBOutlet weak var MarkMaryUnderTableBackGround: UIImageView!
    
    @IBOutlet weak var MainViewFrosted: UIView!
    
    @IBOutlet weak var PlayPauButton: UIButton!
    
    
    
    let Identifier = "PlayListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frostedWindow: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
       // FrostedView.addSubview(frostedWindow)
       // frostedWindow.frame = FrostedView.bounds
        MarkMaryUnderTableBackGround.layer.cornerRadius = 0.0
        MarkMaryUnderTableBackGround.clipsToBounds = true
        FrostedView.layer.cornerRadius = 0.0
        FrostedView.clipsToBounds = true
        self.view.layer.cornerRadius = 12.5
        self.view.clipsToBounds = true
        self.MuseContentTableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifier)
        MuseContentTableView.delegate = self
        MuseContentTableView.dataSource = self
        MuseContentTableView.backgroundColor = StateFavsSingletonClass.share.ClearColor
        
        MarkMaryUnderTableBackGround.image = UIImage(named: "MarkMarySoftTransParency")
        
        let FrostedVFX : UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark ))
        FrostedVFX.frame = MarkMaryUnderTableBackGround.bounds
        MarkMaryUnderTableBackGround.addSubview(FrostedVFX)
        
        let MainViewFrostedEffect = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        MainViewFrosted.addSubview(MainViewFrostedEffect)
        MainViewFrostedEffect.frame = MainViewFrosted.bounds//setting this view to the frame of the main view
        DisplayTimer()
        SetImmaggineArray()
        ImageSingleton.share.ReturnImageString()/// runs this to set the values in the singleton array of string that hold images
        ImaggineArray.shuffle()
        PlaylistTopBackImage.image = UIImage(contentsOfFile: ImaggineArray[0]!)
        ImmagienTimer()
        
        //CG gradient for the sub view is added here
        let TableViewGradient = CAGradientLayer()
        TableViewGradient.colors = [StateFavsSingletonClass.share.TopGradientColor.cgColor, StateFavsSingletonClass.share.BottomGradientColor.cgColor]
        FrostedView.layer.insertSublayer(TableViewGradient, at: 0)
        TableViewGradient.frame = FrostedView.bounds
        // Do any additional setup after loading the view.
        
        MusePlayChecker()
        // for comparison of song titolos
        MuseSingleton.share.placeSongTitolosInArray()
        UpdateTitoloTimer()
    }
    
    var previousPlayedLocation = MuseSingleton.share.ArraySongValue
    func UpdateTitoloTimer(){
        var TimerTitolo = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ComapreSongValues), userInfo: nil, repeats: true)
    }
   @objc func ComapreSongValues(){
    
    var indexPath = NSIndexPath(row: MuseSingleton.share.ArraySongValue, section: 0)as? IndexPath
    var OldIndexPath = NSIndexPath(row: previousPlayedLocation, section: 0)as? IndexPath
    self.MuseContentTableView.beginUpdates()
    self.MuseContentTableView.performBatchUpdates({}, completion: {(finished : Bool) in
        
        
        if let index = indexPath {
        
        self.MuseContentTableView.cellForRow(at: indexPath!)?.textLabel?.textColor = self.SelectedColorOfText
            
            if self.previousPlayedLocation != MuseSingleton.share.ArraySongValue{
                if let oldIndex = OldIndexPath{
                    self.previousPlayedLocation = MuseSingleton.share.ArraySongValue
                    self.MuseContentTableView.cellForRow(at: OldIndexPath!)?.textLabel?.textColor = self.InitalColorOfText//new text color
                }
            }
        }
        
        })
    self.MuseContentTableView.endUpdates()
    
    }
    
    func DisplayTimer(){
        var DisplayTime = Timer.scheduledTimer(timeInterval: 0.1 , target: self, selector: #selector(DisplayData), userInfo: nil, repeats: true)
    }
    @objc func DisplayData(){
        MuseContentLable.text = MuseSingleton.share.DisplayTitolo()
        TempoLable.text = MuseSingleton.share.NewTimeFunction()
        ArtistLabel.text = "By: Rosso Leo"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MuseSingleton.share.MuseDictionary().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let MuseDictionaryInstance = MuseSingleton.share.MuseDictionary()
        var MuseList = [String]()
        /*
         let TableCell = tableView.dequeueReusableCell(withIdentifier: tableIdentifier)as UITableViewCell?
         
         TableCell?.textLabel?.text = self.GlobalArray[indexPath.row]
         */
        
        let TableCell = tableView.dequeueReusableCell(withIdentifier: Identifier)as UITableViewCell?
        
        for x in 0...MuseDictionaryInstance.count - 1{
            for(key, element) in MuseDictionaryInstance[x]{
                MuseList.append(key)
            }
        }
        
    TableCell?.textLabel?.text = MuseList[indexPath.row]
    TableCell?.textLabel?.textColor = .white
        
        if indexPath.row == MuseList.count - 1 {
        
            TableCell?.separatorInset.top = 19.0
        }
        
        TableCell?.backgroundColor = StateFavsSingletonClass.share.ClearColor
        TableCell?.contentView.backgroundColor = StateFavsSingletonClass.share.ClearColor
        TableCell?.selectionStyle = .none// this stops it from highlighting the whole cell when the cell is clicked
        if MuseSingleton.share.ArraySongValue == indexPath.row{
            //TableCell?.textLabel?.textColor = SelectedColorOfText
        }
        
        return TableCell!
        
    }
    
    
    
    var InitalColorOfText : UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var SelectedColorOfText : UIColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var MusicArray = MuseSingleton.share.MuseDictionary()
        var MusicTitle : String?
        
        for x in 0...MuseSingleton.share.MusicQuePlayer.items.count - 1 {
            //MuseSingleton.share.MusicQuePlayer.nextItems.shuffle()
        }
        
        for y in 0...MusicArray.count - 1{
            for (MusicTitle, Music) in MusicArray[y]{
                
            }
        }
        
        if MuseSingleton.share.shuffleValue == false{
        MuseSingleton.share.MusicDictionaryForUse = MuseSingleton.share.MuseDictionary()
        MuseSingleton.share.MuseBundleGrab()// for if the playlist is out of order
        MuseSingleton.share.ArraySongValue = indexPath.row
        
        MuseSingleton.share.MusicGrabAndStore()
        MuseSingleton.share.playMuse()
        MuseSingleton.share.autoPlay()
        
        MusePlayChecker()
       // MuseContentTableView.cellForRow(at: indexPath)?.textLabel?.textColor = SelectedColorOfText// this is used to set the color of the selected index value
        }else{
            MuseSingleton.share.MusicDictionaryForUse = MuseSingleton.share.MuseDictionary()
           MuseSingleton.share.MuseBundleGrab()
            MuseSingleton.share.ArraySongValue  = indexPath.row
            MuseSingleton.share.MusicGrabAndStore()
            MuseSingleton.share.playMuse()
            MuseSingleton.share.autoPlay()
            MuseSingleton.share.shuffleArray()///the line changed or added was this one for the sake if shuffling after reseting the array to it's original properties
            MusePlayChecker()// checking the play pause button on click
           // MuseContentTableView.cellForRow(at: indexPath)?.textLabel?.textColor = SelectedColorOfText// this is used to set the color of the selected index value
        }
    }
    
    var ImaggineCounter = 0
    var ImaggineArray = ImageSingleton.share.ImageString
    func SetImmaggineArray(){
        
    }

    
    func ImaggineUpdater(){
        if ImaggineCounter < ImaggineArray.count - 1{
           ImaggineCounter = ImaggineCounter + 1
        }else{
            ImaggineCounter = 0
        }
    }
    var ImmaggineTimer : Timer?
    func ImmagienTimer(){

         ImmaggineTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ChangeImmagine), userInfo: nil, repeats: true)
    }
    @objc func ChangeImmagine(){
        ImaggineUpdater()
        
        PlaylistTopBackImage.image = TopResizeImage(ImaggineSourceFile: ImaggineArray[ImaggineCounter])
        //MarkMaryUnderTableBackGround.image =  BottomResizeImage(ImaggineSourceFile: ImaggineArray[ImaggineCounter])
        
        //PlaylistTopBackImage.image = UIImage(contentsOfFile: ImaggineArray[ImaggineCounter]!)
        //MarkMaryUnderTableBackGround.image = PlaylistTopBackImage.image// set them to the same backGround image
        
    }
    
    
    @IBAction func DismissTableOcViewController(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        RemoveImageFromMemory()// this is to invalidate the timer and to remove the images from memory to improve central procceing power and memory when the object is no longer needed
    }
    
    
    func MusePlayChecker(){
        if MuseSingleton.share.song.isPlaying == true {
            //UIIMage here pause UI Image here
            PlayPauButton.setBackgroundImage(#imageLiteral(resourceName: "BlackPauseUIImage"), for: .normal)
        //PlayP.setImage(#imageLiteral(resourceName: "MarkMaryPauseIcon"), for: .normal) //imageView!.image = pauseImage
        }else{
            
             PlayPauButton.setBackgroundImage(#imageLiteral(resourceName: "BlackPLayButton"), for: .normal)
            //UIIMage here pause UIIMage here
            //PlayPauseUIImage.setImage(#imageLiteral(resourceName: "MarkMaryPlayIcon"), for: .normal)
        }
    }
    
    
    @IBAction func PlaylistPlayPauseButton(_ sender: Any) {
        if MuseSingleton.share.song.isPlaying == true{
            MuseSingleton.share.pauseMuse()
            ///UI Image placed here
            MusePlayChecker()
        }else{
            MuseSingleton.share.playMuse()
            MuseSingleton.share.autoPlay()
            /// UI Image placed here
            MusePlayChecker()
        }
    }
    
    
    @IBAction func PlayListShuffleContentButton(_ sender: Any) {
        MuseSingleton.share.shuffleArray()
        MuseSingleton.share.MuseBundleGrab()
        MuseSingleton.share.playMuse()
        MuseSingleton.share.autoPlay()
        
        MusePlayChecker()
        
    }
    
    
    @IBAction func DragDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        RemoveImageFromMemory()
        
    }
    
    func RemoveImageFromMemory(){
        var removeTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(RemoveObjects), userInfo: nil, repeats: false)
    }
    @objc func RemoveObjects(){
        ImmaggineTimer?.invalidate()
        PlaylistTopBackImage.image = nil// set this property to nil such that the image clears out of the memory when the view is not present
    }

    
    ///For top background image:
    func TopResizeImage(ImaggineSourceFile SourceFile : String?)-> UIImage{
        let ImageResize = max(PlaylistTopBackImage.bounds.size.width , PlaylistTopBackImage.bounds.size.height)/// max size of the image to be set is here such that the image placed in the image view is the same size as the image view
        var ImageSize : CGSize = CGSize(width: PlaylistTopBackImage.bounds.size.width, height: PlaylistTopBackImage.bounds.size.height)
        let _ = PlaylistTopBackImage.bounds.size
      //  var ImmaggineName : String = SourceFile
        var ContainerImmage : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG") // image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        
        if let Imagefile = SourceFile{
            guard let ImageView = UIImage(contentsOfFile: Imagefile) else {
                return #imageLiteral(resourceName: "errorImage-vector-image-PnG")
            }
            
            // this is to set the image size and width to an appropriate size that gets clipped and scaled properly:
            var UnscaledImageHeight = ImageView.size.height
            var UnscaledImageWidth = ImageView.size.width
            var ImageViewHeight =  PlaylistTopBackImage.bounds.size.width
            var newHeight = UnscaledImageHeight * ( ImageViewHeight / UnscaledImageWidth )
            
            ImageSize = CGSize(width: ImageViewHeight , height: newHeight)
            
            
            
            let ImageRender = UIGraphicsImageRenderer(size: ImageSize)/// this is the cg size
            ContainerImmage = ImageRender.image{ _ in ImageView.draw(in : CGRect(origin: .zero , size: ImageSize))
                
                
            }// imageview closing bracket
        }//image file closing bracket
        
        return ContainerImmage
    }
    
    
    
    
    
    ///For bottom background image:
    func BottomResizeImage(ImaggineSourceFile SourceFile : String?)->UIImage{
        let ImageResize = max(MarkMaryUnderTableBackGround.bounds.size.width , MarkMaryUnderTableBackGround.bounds.size.height)/// max size of the image to be set is here such that the image placed in the image view is the same size as the image view
        var ImageSize : CGSize = CGSize(width: MarkMaryUnderTableBackGround.bounds.size.width, height: MarkMaryUnderTableBackGround.bounds.size.height)
        let _ = MarkMaryUnderTableBackGround.bounds.size
       // var ImmaggineName : String = SourceFile
        var ContainerImmage : UIImage = #imageLiteral(resourceName: "errorImage-vector-image-PnG") // image literal here but it's damn near tracnsparent becuase it is the transparent Error UIImage
        
        if let Imagefile = SourceFile{
            guard let ImageView = UIImage(contentsOfFile: Imagefile) else {
                return #imageLiteral(resourceName: "errorImage-vector-image-PnG")
            }
            // this is to set the image size and width to an appropriate size that gets clipped and scaled properly:
            var UnscaledImageHeight = ImageView.size.height
            var UnscaledImageWidth = ImageView.size.width
            var ImageViewHeight =  MarkMaryUnderTableBackGround.bounds.size.width
            var newHeight = UnscaledImageHeight * ( ImageViewHeight / UnscaledImageWidth )
            
            ImageSize = CGSize(width: ImageViewHeight , height: newHeight)
            
            
            
            let ImageRender = UIGraphicsImageRenderer(size: ImageSize)/// this is the cg size
            ContainerImmage = ImageRender.image{ _ in ImageView.draw(in : CGRect(origin: .zero , size: ImageSize))
                
            
            }//imageview closing brackets
        }//imagefile closing brackets
        
       // MarkMaryUnderTableBackGround.image = ContainerImmage
        
        return ContainerImmage

    }
    
    
    
    
}

