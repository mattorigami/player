//
//  ForgotPasswordVC.swift
//  AdRiver
//
//  Created by Matt on 02.05.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewForgot: UIView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var tfEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewEmail.layer.cornerRadius = 23
        viewEmail.layer.borderWidth = 2
        viewEmail.layer.borderColor = UIColor(red: 71/256, green: 71/256, blue: 71/256, alpha: 1.0).cgColor
        
        viewForgot.layer.cornerRadius = 20
        btnSubmit.layer.cornerRadius = 20
    }
    
    @IBAction func btnSubmitTapped(_ sender: Any) {
    }
    @IBAction func backgroundTapped(_ sender: Any) {
        tfEmail.resignFirstResponder()
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
