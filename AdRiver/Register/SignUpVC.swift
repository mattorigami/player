//
//  SignUpVC.swift
//  AdRiver
//
//  Created by Matt on 28.10.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var viewCreateAccount: UIView!
    @IBOutlet weak var viewFirstName: UIView!
    @IBOutlet weak var tfFirstName: UITextField!
    
    @IBOutlet weak var viewLastName: UIView!
    @IBOutlet weak var tfLastName: UITextField!
    
    @IBOutlet weak var viewAge: UIView!
    @IBOutlet weak var tfDOB: UITextField!
    @IBOutlet weak var viewGender: UIView!
    @IBOutlet weak var tfGender: UITextField!
    
    @IBOutlet weak var viewTableGender: UIView!
    @IBOutlet weak var tebleviewGender: UITableView!
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var viewRePassword: UIView!
    @IBOutlet weak var tfRePassword: UITextField!
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    
    
    var genderList = ["Female", "Trans-Female", "Non Binary","Trans-Male","Male" ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.createTFBorder(viewTableGender)
        self.createTFBorder(viewFirstName)
        self.createTFBorder(viewLastName)
        self.createTFBorder(viewAge)
        self.createTFBorder(viewGender)
        self.createTFBorder(viewPassword)
        self.createTFBorder(viewRePassword)
        self.createTFBorder(viewEmail)
        
        //Next Back Button Border
        btnBack.layer.cornerRadius = 16
        btnBack.layer.borderWidth = 1
        btnBack.layer.borderColor = UIColor.white.cgColor
        
        btnSignUp.layer.cornerRadius = 16
        btnSignUp.layer.borderWidth = 1
        btnSignUp.layer.borderColor = UIColor(red: 247/256, green: 45/256, blue: 48/256, alpha: 1.0).cgColor
        
    }
    
    @IBAction func genderTapped(_ sender: Any) {
        self.viewTableGender.isHidden = !self.viewTableGender.isHidden
    }
    
    @IBAction func btnCheckTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            sender.isSelected = !sender.isSelected
        }) { (success) in
            
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
        
       /* if sender.isSelected {
            sender.isSelected = false
        }else {
            sender.isSelected = true
        } */
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSignUpTapped(_ sender: Any) {
        
    }
    
    func createTFBorder(_ view: UIView) {
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 71/256, green: 71/256, blue: 71/256, alpha: 1.0).cgColor
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

            if textField == self.tfGender {
    //            self.pickerView.isHidden = false
                //if you don't want the users to se the keyboard type:

                textField.endEditing(true)
            }
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

extension SignUpVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return genderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell =  UITableViewCell.init(style:.default, reuseIdentifier: "cell")
        cell.textLabel?.text = genderList[indexPath.row]
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.textLabel?.textColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tfGender.text = genderList[indexPath.row]
        viewTableGender.isHidden = true
    }
}
