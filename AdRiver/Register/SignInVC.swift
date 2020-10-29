//
//  SignInVC.swift
//  AdRiver
//
//  Created by Matt on 01.05.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit
import SideMenu

var isEyeCheck: Bool!
enum Direction : String {
    case English, Espanol, Francais, Deutsch, Portuguese
    static var allValues = [Direction.English, .Espanol, .Francais, .Deutsch, .Portuguese]
}
struct ExampleModel {
    var direction = Direction.English
}


class SignInVC: UIViewController {

    @IBOutlet weak var viewSignInBox: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnJoin: UIButton!
    
    var model = ExampleModel() {
        didSet {
            self.view.setNeedsLayout()
        }
    }

    @IBOutlet weak var btnLanguage: UIButton!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.btnLanguage.setTitle(String(describing: model.direction), for: .normal)
        self.btnLanguage.layer.cornerRadius = 18
    }

    @IBAction func showDirectionPopup(_ sender: UIView) {
        let controller = ArrayChoiceTableViewController(Direction.allValues) { (direction) in
            self.model.direction = direction
        }
        controller.preferredContentSize = CGSize(width: 180, height: 200)
        showPopup(controller, sourceView: sender)
    }
    
    private func showPopup(_ controller: UIViewController, sourceView: UIView) {
        let presentationController = AlwaysPresentAsPopover.configurePresentation(forController: controller)
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceView.bounds
        presentationController.permittedArrowDirections = [.down, .up]
        self.present(controller, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        
        viewSignInBox.layer.cornerRadius = 20
      
        
        viewEmail.layer.cornerRadius = 23
        viewEmail.layer.borderWidth = 2
        viewEmail.layer.borderColor = UIColor(red: 71/256, green: 71/256, blue: 71/256, alpha: 1.0).cgColor
        
        viewPassword.layer.cornerRadius = 23
        viewPassword.layer.borderWidth = 2
        viewPassword.layer.borderColor = UIColor(red: 71/256, green: 71/256, blue: 71/256, alpha: 1.0).cgColor
        
        btnSignIn.layer.cornerRadius = 20
        btnJoin.layer.cornerRadius = 20
        
        tfPassword.isSecureTextEntry = true
        isEyeCheck = false
        
        // POP UP
        
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func eyeTapped(_ sender: Any) {
        if(isEyeCheck){
            tfPassword.isSecureTextEntry = true
            btnEye.setTitle("T", for: UIControl.State.normal)
        }
        else{
            tfPassword.isSecureTextEntry = false
            btnEye.setTitle("Z", for: UIControl.State.normal)
        }
        
        isEyeCheck = !isEyeCheck
    }
    @IBAction func backgroundTapped(_ sender: Any) {
        tfPassword.resignFirstResponder()
        tfEmail.resignFirstResponder()
        
    }
    @IBAction func btnSignInTapped(_ sender: Any) {
//        let vc = HomeVC() //change this to your class name
//        self.present(vc, animated: true, completion: nil)
        let menu = storyboard!.instantiateViewController(withIdentifier: "SearchVC") as! SideMenuNavigationController
        self.present(menu, animated: true, completion: nil)
        
        
        
//        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//        let navController = UINavigationController(rootViewController: VC1) // Creating a navigation controller with VC1 at the root of the navigation stack.
//        self.present(navController, animated:true, completion: nil)
    }
    @IBAction func btnJoinTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "goSignUpVC", sender: self)
    }
    @IBAction func forgotTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "goForgotVC", sender: self)
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
