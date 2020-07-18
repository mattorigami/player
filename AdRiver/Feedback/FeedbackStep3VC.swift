//
//  FeedbackStep3VC.swift
//  AdRiver
//
//  Created by Matt on 12.05.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit

class FeedbackStep3VC: UIViewController {
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    var btnCheck:Bool!
    
    @IBOutlet weak var btnSubmit: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnSubmit.layer.cornerRadius = 18
        btnCheck = false
    }
    @IBAction func btnTapped(_ sender: Any) {
        var btnRec : UIButton!
        btnCheck = true
        btnRec = (sender as! UIButton)
        if (btnRec.tag==1){
            self .setRadius(btn: btn1)
            self .removeRadius(btn: btn2)
            self .removeRadius(btn: btn3)
            self .removeRadius(btn: btn4)
            self .removeRadius(btn: btn5)
            self .removeRadius(btn: btn6)
            self .removeRadius(btn: btn7)
            self .removeRadius(btn: btn8)
        }
        if (btnRec.tag==2){
                   self .setRadius(btn: btn2)
                   self .removeRadius(btn: btn1)
                   self .removeRadius(btn: btn3)
                   self .removeRadius(btn: btn4)
                   self .removeRadius(btn: btn5)
                   self .removeRadius(btn: btn6)
                   self .removeRadius(btn: btn7)
                   self .removeRadius(btn: btn8)
        }
        if (btnRec.tag==3){
                   self .setRadius(btn: btn3)
                   self .removeRadius(btn: btn2)
                   self .removeRadius(btn: btn1)
                   self .removeRadius(btn: btn4)
                   self .removeRadius(btn: btn5)
                   self .removeRadius(btn: btn6)
                   self .removeRadius(btn: btn7)
                   self .removeRadius(btn: btn8)
        }
        if (btnRec.tag==4){
                   self .setRadius(btn: btn4)
                   self .removeRadius(btn: btn2)
                   self .removeRadius(btn: btn3)
                   self .removeRadius(btn: btn1)
                   self .removeRadius(btn: btn5)
                   self .removeRadius(btn: btn6)
                   self .removeRadius(btn: btn7)
                   self .removeRadius(btn: btn8)
        }
        if (btnRec.tag==5){
                   self .setRadius(btn: btn5)
                   self .removeRadius(btn: btn2)
                   self .removeRadius(btn: btn3)
                   self .removeRadius(btn: btn4)
                   self .removeRadius(btn: btn1)
                   self .removeRadius(btn: btn6)
                   self .removeRadius(btn: btn7)
                   self .removeRadius(btn: btn8)
        }
        if (btnRec.tag==6){
                   self .setRadius(btn: btn6)
                   self .removeRadius(btn: btn2)
                   self .removeRadius(btn: btn3)
                   self .removeRadius(btn: btn4)
                   self .removeRadius(btn: btn5)
                   self .removeRadius(btn: btn1)
                   self .removeRadius(btn: btn7)
                   self .removeRadius(btn: btn8)
        }
        if (btnRec.tag==7){
                   self .setRadius(btn: btn7)
                   self .removeRadius(btn: btn2)
                   self .removeRadius(btn: btn3)
                   self .removeRadius(btn: btn4)
                   self .removeRadius(btn: btn5)
                   self .removeRadius(btn: btn6)
                   self .removeRadius(btn: btn1)
                   self .removeRadius(btn: btn8)
        }
        if (btnRec.tag==8){
                   self .setRadius(btn: btn8)
                   self .removeRadius(btn: btn2)
                   self .removeRadius(btn: btn3)
                   self .removeRadius(btn: btn4)
                   self .removeRadius(btn: btn5)
                   self .removeRadius(btn: btn6)
                   self .removeRadius(btn: btn7)
                   self .removeRadius(btn: btn1)
        }
        UserDefaults.standard.set(btnRec.titleLabel?.text, forKey: "positive")
            }
    
    func setRadius(btn: UIButton) {
        btn.setTitleColor(UIColor(red: 247/256, green: 45/256, blue: 48/256, alpha: 1.0), for: UIControl.State.normal)
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor(red: 71/256, green: 71/256, blue: 71/256, alpha: 1.0).cgColor
    }
    func removeRadius(btn: UIButton) {
        btn.titleLabel?.textColor = UIColor.white
        btn.layer.borderWidth = 0
    }
    
    
    @IBAction func submitTapped(_ sender: Any) {
        if btnCheck {
            self.performSegue(withIdentifier: "goStep4", sender: self)
        }else{
            showAlert()
        }
        
    }
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showAlert(){
        // create the alert
               let alert = UIAlertController(title: "Alert", message: "Please select one word!", preferredStyle: UIAlertController.Style.alert)

               // add an action (button)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

               // show the alert
               self.present(alert, animated: true, completion: nil)
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
