//
//  ViewController.swift
//  AdRiver
//
//  Created by Matt on 01.05.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUpTapped: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Hide navigation
        self.navigationController?.navigationBar.isHidden = true
        
        btnSignIn.layer.cornerRadius = 18
        btnSignIn.layer.borderWidth = 1
        btnSignIn.layer.borderColor = UIColor.white.cgColor
        
        btnSignUpTapped.layer.cornerRadius = 18
        btnSignUpTapped.layer.borderWidth = 1
        btnSignUpTapped.layer.borderColor = UIColor(red: 247/256, green: 45/256, blue: 48/256, alpha: 1.0).cgColor
        
        
    }
    
    @IBAction func btnSignInTapped(_ sender: Any) {
        self .performSegue(withIdentifier: "goSignInVC", sender: self)
       }


    @IBAction func btnSignUpTapped(_ sender: Any) {
    }
   
    
    
}

