//
//  FeedbackD2Q1VC.swift
//  AdRiver
//
//  Created by Matt on 31.10.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit

class FeedbackD2Q1VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true

    }
    @IBAction func likeTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "goStepD1", sender: self)
        UserDefaults.standard.set(true, forKey: "like")
    }
    @IBAction func dislikeTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "like")
        self.performSegue(withIdentifier: "goStepD1", sender: self)
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
