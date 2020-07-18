//
//  HomeVC.swift
//  AdRiver
//
//  Created by Matt on 02.05.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//
import UIKit
import AVFoundation
import AVKit

var player = AVPlayer()
var playerViewController = AVPlayerViewController()

class HomeVC: UIViewController {

    @IBOutlet weak var videoPlayerView: MBVideoPlayerView!
    @IBOutlet weak var btnTimer: UIButton!
    @IBOutlet weak var btnWithdraw: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var lblBalance: UILabel!
    let playerView = MBVideoPlayerView(configuration: nil, theme: nil, header: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        
        btnWithdraw.layer.cornerRadius = 18
        btnWithdraw.layer.borderWidth = 2
        btnWithdraw.layer.borderColor = UIColor(red: 71/256, green: 71/256, blue: 71/256, alpha: 1.0).cgColor
        
        btnTimer.layer.cornerRadius = 22
        btnTimer.layer.borderWidth = 2
        btnTimer.layer.borderColor = UIColor(red: 71/256, green: 71/256, blue: 71/256, alpha: 1.0).cgColor
        
        searchBar.searchTextField.layer.cornerRadius = 20
        searchBar.searchTextField.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backgroundTapped(_ sender: Any) {
        searchBar.searchTextField.resignFirstResponder()
    }
    @IBAction func btnPlayTapped(_ sender: Any) {
        let videoPath = Bundle.main.path(forResource: "SpaceX", ofType: "mov")
        let videoPathUrl = URL(fileURLWithPath: videoPath!)
        player = AVPlayer(url: videoPathUrl)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name:
//        NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
//
//
//        playerViewController.player = player
//        self.present(playerViewController, animated: true, completion: nil)
//        player.play()
        
        let playerItems = [
            PlayerItem(title: "Apple Live Broadcast WWDC.", url: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8", thumbnail: "1"),
            PlayerItem(title: "Driving a Cycle experience.", url: "https://content.jwplatform.com/manifests/yp34SRmf.m3u8", thumbnail: "2"),
            PlayerItem(title: "The Durian Open Movie Project.", url: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8", thumbnail: "3"),
            PlayerItem(title: "Table Ronde.", url: "https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8", thumbnail: "4"),
            PlayerItem(title: "What is this event? ... parker.", url: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8", thumbnail: "5")
        ]
        
        
        
        playerView.setPlayList(currentItem: PlayerItem(title: "By Apple", url: videoPathUrl.absoluteString, thumbnail: "5"), items: playerItems, fullScreenView: view)
        
        view.addSubview(playerView)
        playerView.pinEdges(to: view)
        
        playerView.playerStateDidChange = { (state) in
            
        }
        playerView.playerOrientationDidChange = { (orientation) in
        
        }
        playerView.playerDidChangeSize = { (dimension) in
            
        }
        playerView.playerTimeDidChange = { (newTime, duration) in
            
        }
        
        
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Video Finished")
        self.dismiss(animated: true) {
            print("Player Dimissed")
        
            let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "FeedbackQ1VC") as! FeedbackQ1VC
            let navController = UINavigationController(rootViewController: VC1) // Creating a navigation controller with VC1 at the root of the navigation stack.
            self.present(navController, animated:true, completion: nil)
        }
    }
    @IBAction func btnWithdrawTapped(_ sender: Any) {
    }
    @IBAction func sidebarTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnTimerTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "goTimerVC", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
