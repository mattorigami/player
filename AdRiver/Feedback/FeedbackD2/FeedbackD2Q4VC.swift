//
//  FeedbackD2Q4VC.swift
//  AdRiver
//
//  Created by Matt on 31.10.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit

class FeedbackD2Q4VC: UIViewController {

   @IBOutlet weak var btnYes: UIButton!
    
    @IBOutlet weak var btnNo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnNo.layer.cornerRadius = 18
        btnYes.layer.cornerRadius = 18

    }
    
    @IBAction func yesTapped(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "heardBefore")
         self.performSegue(withIdentifier: "goStepD4", sender: self)
    }
    @IBAction func noTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "heardBefore")
         self.performSegue(withIdentifier: "goStepD4", sender: self)
    }
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
