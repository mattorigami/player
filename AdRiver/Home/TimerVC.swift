//
//  TimerVC.swift
//  AdRiver
//
//  Created by Matt on 07.05.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit

class TimerVC: UIViewController {

    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var viewYes: UIButton!
    @IBOutlet weak var lblYes: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnNo.layer.cornerRadius = 23
        btnNo.layer.borderWidth = 2
        btnNo.layer.borderColor = UIColor(red: 71/256, green: 71/256, blue: 71/256, alpha: 1.0).cgColor
        
        viewYes.layer.cornerRadius = 23
        viewYes.layer.borderWidth = 2
        viewYes.layer.borderColor = UIColor(red: 71/256, green: 71/256, blue: 71/256, alpha: 1.0).cgColor
    }
    
    @IBAction func btnNoTapped(_ sender: Any) {
        
    }
    
    @IBAction func btnYesTapped(_ sender: Any) {
        
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
