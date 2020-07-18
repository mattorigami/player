//
//  FeedbackQ1VC.swift
//  AdRiver
//
//  Created by Matt on 11.05.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit

class FeedbackQ1VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true

    }
    @IBAction func likeTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "goStep2", sender: self)
        UserDefaults.standard.set(true, forKey: "like")
    }
    @IBAction func dislikeTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "like")
        self.performSegue(withIdentifier: "goStep2", sender: self)
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
