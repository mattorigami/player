//
//  FeedbackD2Q5VC.swift
//  AdRiver
//
//  Created by Matt on 31.10.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit
import Alamofire

class FeedbackD2Q5VC: UIViewController {

   @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnConfirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnBack.layer.cornerRadius = 18
        btnConfirm.layer.cornerRadius = 18
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func confirmTapped(_ sender: Any) {
        // Call Review API
        let videoId = UserDefaults.standard.string(forKey: "videoId")
        
        let reviewAPI = String(format: "http://ec2-18-224-62-211.us-east-2.compute.amazonaws.com/api/videos/review/%@", videoId!)
        
        let positive = "positive"
        let negative = "negative"
        let like = UserDefaults.standard.bool(forKey: "like")
        let heardBefore = UserDefaults.standard.bool(forKey: "heardBefore")
        
        let parameters = [
            "positive" : positive,
            "negative" : negative,
            "like" : like,
            "heardBefore": heardBefore
            ] as [String : Any]
        
        let headers:HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVlZGViNDE1MzQzNzFiMGMwZWU0YjQ4NCIsIm5hbWUiOiJVc2FtYTEyMyIsImlhdCI6MTU5MjI1Njk4OCwiZXhwIjoxNjIzODEzOTE0fQ.jE8f3FOYmzdSMtTte45AS0vrLkuC283W1Ezwl8Fj3ew"
        ]
        AF.request(reviewAPI, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: headers)
                    .responseJSON { (response) in
                               switch response.result {
                               case .success(let value):
                                   if let json = value as? NSDictionary{
                                       let result = json as NSDictionary

                                       print(result)
                                    self.showAlert()
                                   }
                               case .failure(let error):
                                print(error.errorDescription ?? "Error Server")
                               }
                           }
        
    }
    
    func showAlert(){
        // create the alert
               let alert = UIAlertController(title: "Success", message: "Thanks for your review!", preferredStyle: UIAlertController.Style.alert)

               // add an action (button)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
                UserDefaults.standard.set(true, forKey: "reviewed")
                   self.dismiss(animated: true, completion: nil)
               }))

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
