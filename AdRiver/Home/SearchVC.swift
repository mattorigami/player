//
//  SearchVC.swift
//  AdRiver
//
//  Created by Matt on 14.06.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import AVKit
import AVFoundation

class SearchVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ENSideMenuDelegate {
    ///
    let AVPlayerVC = AVPlayerViewController()
    var commmentQueuePlayer = AVQueuePlayer()
    var OverlayView = UIView()
    var prevItem:AVPlayerItem?
    ///
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var collectionAds: UICollectionView!
    @IBOutlet weak var videoPlayerView: MBVideoPlayerView!
    var playerView = MBVideoPlayerView(configuration: nil, theme: nil, header: nil)
    var adsArray : NSArray!
    
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
//    let columnLayout = ColumnFlowLayout(
//        cellsPerRow: 5,
//        minimumInteritemSpacing: 10,
//        minimumLineSpacing: 10,
//        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    //    )

        // MARK: - UICollectionViewDataSource protocol

        // tell the collection view how many cells to make
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.adsArray.count
        }

        // make a cell for each cell index path
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let row = indexPath.item
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! VideoCollectionCell

            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.ivAds.layer.cornerRadius = 10
            cell.ivAds.layer.masksToBounds = true
            
            let dataDictonary = self.adsArray[row] as! NSDictionary
            let adNameName  = dataDictonary["name"] as? String
            let adDescription  = dataDictonary["description"] as? String
            cell.myLabel.text = adNameName
            cell.lblDescription.text = adDescription
            
            let thumbString = dataDictonary["thumbnail_path"] as? String
            let urlStr = String(format: "%@", thumbString!)
            print(urlStr)
            
            if let encoded = urlStr.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
                let urlImage = URL(string: encoded)
            {
                print(urlImage)
                cell.ivAds.sd_setImage(with: urlImage, placeholderImage: UIImage(named: "spaceXImage"), options: .refreshCached) { (image, error, cache, urls) in
                    if (error != nil) {
                        //Failure code here
                        
                        print(error.debugDescription)
                        cell.ivAds.image = UIImage(named: "spaceXImage")
                    } else {
                        //Success code here
//                        cell.ivCity.image = image
                    }
                }
            }
//            cell.backgroundColor = UIColor.cyan // make cell more visible in our example project

            return cell
        }

        // MARK: - UICollectionViewDelegate protocol

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // handle tap events
            print("You selected cell #\(indexPath.item)!")
            
            let dataDictonary = self.adsArray[indexPath.item] as! NSDictionary
            let videoUrlString = dataDictonary["video_path"] as? String
            let videoId = dataDictonary["_id"] as? String
            UserDefaults.standard.set(videoId, forKey: "videoId")
            if let url = videoUrlString{
                playVideo(url: url)
            }
            
            
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(3 - 1))
        let sizeWidth = Int((collectionView.bounds.width - totalSpace) / CGFloat(2))
        let sizeHeight = Int((collectionView.bounds.width - totalSpace) / CGFloat(2.7))
        print(sizeWidth, sizeHeight)
        return CGSize(width: sizeWidth, height: sizeHeight)
//        return CGSize(width:(collectionView.frame.height-90)/2, height: 100)
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        setupCustomPlayer()
        self.navigationController?.navigationBar.isHidden = true
//        self.sideMenuController()?.sideMenu?.delegate = self
        
        if revealViewController() != nil {
        //            revealViewController().rearViewRevealWidth = 62
            self.menuBtn.addTarget(revealViewController(), action:"revealToggle:" , for: .touchUpInside)
            
            revealViewController().rightViewRevealWidth = 150
//                    menuBtn.target = revealViewController()
//                    extraButton.action = "rightRevealToggle:"

            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
                    
            }
        
        
        getAllAds()
    }
    @IBAction func toggleSideMenuBtn(_ sender: UIButton) {
        toggleSideMenuView()
    }
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
    
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    func setupCustomPlayer() {
//        AVPlayerVC.view.frame = self.view.frame
//        AVPlayerVC.view.sizeToFit()
//        AVPlayerVC.showsPlaybackControls = true
//        self.view.addSubview(AVPlayerVC.view)
//
//        let videoURL: String = "http://cdnapi.kaltura.com/p/11/sp/11/playManifest/entryId/0_6swapj1k/format/applehttp/protocol/http/a.m3u8"
//        let firstItemURL: String = "http://cdnapi.kaltura.com/p/11/sp/11/playManifest/entryId/0_2p3957qy/format/applehttp/protocol/http/a.m3u8"
//        let secondItemURL: String = "http://cdnapi.kaltura.com/p/11/sp/11/playManifest/entryId/0_buy5xjol/format/applehttp/protocol/http/a.m3u8"
//
//        let firstItem = AVPlayerItem(url: NSURL(string: firstItemURL)! as URL )
//        let secondItem = AVPlayerItem(url: NSURL(string: secondItemURL)! as URL )
//        let playerItem = AVPlayerItem(url: NSURL(string: videoURL)! as URL )
//        let items = [firstItem,secondItem,playerItem]
//
//        commmentQueuePlayer = AVQueuePlayer(items: items)
//
//        commmentQueuePlayer.actionAtItemEnd = .none
//        AVPlayerVC.player = commmentQueuePlayer
//
//        NotificationCenter.default.addObserver(self, selector: #selector(self.stopedPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
//        addContentOverlayView()
//        AVPlayerVC.player?.play()
//    }
//
//    func addContentOverlayView() {
//
//        OverlayView.frame = CGRect(x: 0,y: 30,width: AVPlayerVC.view.bounds.width, height: 100)
//        OverlayView.isHidden = true
//        OverlayView.backgroundColor = UIColor ( red: 0.5, green: 0.5, blue: 0.5, alpha: 0.379 )
//
//        let btnNext = UIButton(frame:CGRect(x: AVPlayerVC.view.bounds.width - 60,y: 0,width: 60,height: 44))
//        btnNext.setTitle(">>", for: .normal)
//        btnNext.addTarget(self, action:Selector(("playNext")), for:.touchUpInside)
//        //        btnNext.layer.borderColor = UIColor ( red: 0.0, green: 0.0, blue: 1.0, alpha: 0.670476140202703 ).CGColor
//        //        btnNext.layer.borderWidth = 1.0
//        OverlayView.addSubview(btnNext)
//
//        let btnReplay = UIButton(frame:CGRect(x: (AVPlayerVC.view.bounds.width/2)-40,y: 0,width: 80,height: 44))
//        btnReplay.setTitle("Replay", for:.normal)
//        btnReplay.addTarget(self, action:Selector(("replayVideo")), for:.touchUpInside)
//        OverlayView.addSubview(btnReplay)
//
//        let btnPrevious = UIButton(frame:CGRect(x: 0,y: 0,width: 80,height: 44))
//        btnPrevious.setTitle("<<", for:.normal)
//        btnPrevious.addTarget(self, action:Selector(("previousVideo")), for:.touchUpInside)
//        OverlayView.addSubview(btnPrevious)
//
//        let btnComment = UIButton(frame:CGRect(x: (AVPlayerVC.view.bounds.width/2)-70,y: 40,width: 140,height: 44))
//        btnComment.setTitle("Comments", for:.normal)
//        btnComment.addTarget(self, action:Selector(("openComments")), for:.touchUpInside)
//        OverlayView.addSubview(btnComment)
//
//        AVPlayerVC.view.addSubview(OverlayView);
//
//    }
//
//    func playNext() {
//        prevItem = AVPlayerVC.player?.currentItem
//        OverlayView.isHidden = true
//        commmentQueuePlayer.advanceToNextItem()
//    }
//
//    func replayVideo() {
//        OverlayView.isHidden = true
//        AVPlayerVC.player?.currentItem?.seek(to: CMTime.zero)
//        AVPlayerVC.player?.play()
//    }
//
//    func previousVideo() {
//        OverlayView.isHidden = true
//        if prevItem != AVPlayerVC.player?.currentItem {
//            if (commmentQueuePlayer.canInsert(prevItem!, after:AVPlayerVC.player?.currentItem)) {
//                //commmentQueuePlayer.insertItem(prevItem!, afterItem:AVPlayerVC.player?.currentItem)
//                commmentQueuePlayer.replaceCurrentItem(with: prevItem)
//                prevItem = AVPlayerVC.player?.currentItem
//                replayVideo()
//            }
//        } else {
//            replayVideo()
//            //Else display alert no prev video found
//        }
//    }
//
//    func openComments() {
//        //Open the comment View/VC
//    }
//
//    @objc func stopedPlaying() {
//        if prevItem == nil {
//            prevItem = AVPlayerVC.player?.currentItem
//        }
//        OverlayView.isHidden = false
//    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getAllAds(){
      // 1
    AF.request("http://ec2-18-224-62-211.us-east-2.compute.amazonaws.com/api/videos").responseJSON { (response) in
           switch response.result {
           case .success(let value):
               if let json = value as? NSDictionary{
                   let result = json as NSDictionary
                   
                   print(result)
                self.adsArray = result["data"] as? NSArray
//
                self.collectionAds.dataSource = self
                self.collectionAds.delegate = self
                self.collectionAds.reloadData()
            
               }
           case .failure(let error):
            print(error.errorDescription ?? "Error Server")
           }
       }
       }
    
    func playVideo (url : String){
//        let videoPath = Bundle.main.path(forResource: "SpaceX", ofType: "mov")
        
        let urlStr = String(format: "%@", url)
        
        print(urlStr)
        
        if let encoded = urlStr.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let urlVideo = URL(string: encoded)
        {
    
            playerView.setPlayList(currentItem: PlayerItem(title: "By Apple", url: url, thumbnail: "5"), items: nil, fullScreenView: view)
            
            
            view.addSubview(playerView)
            playerView.pinEdges(to: view)
            
            playerView.playerStateDidChange = { (state) in
                if state == .twentySecPause {
                    self.showSurveyView()
                }
                if state == .stopPlaying {
                    self.playerView.removeFromSuperview()
                }
            }
            playerView.playerOrientationDidChange = { (orientation) in
                
            }
            playerView.playerDidChangeSize = { (dimension) in
                
            }
            playerView.playerTimeDidChange = { (newTime, duration) in
                
            }
            
        }
        
    }
    
    func showSurveyView(){
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "FeedbackD2Q1VC") as! FeedbackD2Q1VC
        VC1.modalPresentationStyle = .overCurrentContext

        let navController = UINavigationController(rootViewController: VC1) // Creating a navigation controller with VC1 at the root of the navigation stack.
        self.present(navController, animated:true, completion: nil)
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Video Finished")
        self.dismiss(animated: true) {
            print("Player Dimissed")
            
            let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "FeedbackD2Q1VC") as! FeedbackD2Q1VC
            let navController = UINavigationController(rootViewController: VC1) // Creating a navigation controller with VC1 at the root of the navigation stack.
            self.present(navController, animated:true, completion: nil)
        }
    }

}
extension SearchVC:MBConfiguration{
    var canShowVideoList: Bool {
        return false
    }
    
    var canShowTime: Bool {
        return true
    }
    
    var canShowPlayPause: Bool {
        return true
    }
    
    var canShowTimeBar: Bool {
        return true
    }
    
    var canShowFullScreenBtn: Bool {
        return false
    }
    
    var canShowForwardBack: Bool {
        return false
    }
    
    var canShowHeader: Bool {
        return true
    }
    
    var canShowHeaderTitle: Bool {
        return true
    }
    
    var canShowHeaderOption: Bool {
        return true
    }
    
    var isShowOverlay: Bool {
        get {
            return true
        }
        set {
            
        }
    }
    
    var dimension: PlayerDimension {
        return .fullScreen
    }
    
    var seekDuration: Float64 {
        return 10.0
    }
    
    
}
