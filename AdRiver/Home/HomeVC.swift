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

    @IBOutlet weak var menuBtn: UIButton!
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
        
        if revealViewController() != nil {
                //            revealViewController().rearViewRevealWidth = 62
                    self.menuBtn.addTarget(revealViewController(), action:"revealToggle:" , for: .touchUpInside)
                    
                    revealViewController().rightViewRevealWidth = 150
        //                    menuBtn.target = revealViewController()
        //                    extraButton.action = "rightRevealToggle:"

                    self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
                            
                    }
    }
    
    @IBAction func backgroundTapped(_ sender: Any) {
        searchBar.searchTextField.resignFirstResponder()
    }
    @IBAction func btnPlayTapped(_ sender: Any) {
       
        self.performSegue(withIdentifier: "goSearchVC", sender: self)
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
