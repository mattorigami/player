//
//  SignupVC.swift
//  AdRiver
//
//  Created by Matt on 07.09.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit

class SignupVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate{
    
    

    @IBOutlet weak var viewHeaderBtns: UIView!
    @IBOutlet weak var viewCreateAccount: UIView!
    @IBOutlet weak var viewDemoDetails: UIView!
    @IBOutlet weak var viewAdPref: UIView!
    @IBOutlet weak var btnAdPref: UIButton!
    @IBOutlet weak var btnDemoDetails: UIButton!
    @IBOutlet weak var btnCreateAccount: UIButton!
    @IBOutlet weak var viewFirstName: UIView!
    @IBOutlet weak var viewLastName: UIView!
    @IBOutlet weak var viewDOB: UIView!
    @IBOutlet weak var viewGender: UIView!
    @IBOutlet weak var viewCreatePass: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    //Create Account Fields
    @IBOutlet weak var tfGender: UITextField!
    var genderList = ["1", "2", "3"]
    
    
    // Demo Graphic Details
    @IBOutlet weak var viewOccupation: UIView!
    @IBOutlet weak var viewResidance: UIView!
    @IBOutlet weak var viewEthnicity: UIView!
    @IBOutlet weak var viewSexOrientation: UIView!
    @IBOutlet weak var viewNationality: UIView!
    @IBOutlet weak var viewQualification: UIView!
    
    // Ad Preferences Outlets
    @IBOutlet weak var collectionPrefs: UICollectionView!
    var items : NSArray!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Ad Preferences
        self.collectionPrefs.dataSource = self
        self.collectionPrefs.delegate = self
        self.collectionPrefs.allowsMultipleSelection = true
         items = ["Adsoulute, Cover Future Campaigns, Charity and Donations", "Children Products", "Female Colthing & Accessories", "Infomercials", "Market Research", "Apps, Games, Software", "Electronics & Technology", "Food & Drinks", "Leisure, Sports, Gym & Outdoors", "Paid Oppertunities", "Arts, Crafts & Collectables", "Everyday & Increment Products", "Film & TV", "Male Clothing & Accessories", "Pets", "Banking, Loans, Insurance", "Female Health & Beauty", "Health Products", "Male Health & Grooming", "Travel & Holiday", "Toys", "Home Decor, Garden & DIY", "Music", "Utilities"]
        
        //Header Buttons
        viewHeaderBtns.layer.cornerRadius = 20
        btnAdPref.layer.cornerRadius = 17
        btnDemoDetails.layer.cornerRadius = 17
        btnCreateAccount.layer.cornerRadius = 17
        
        // Text Fields Create Account
         self.createTFBorder(viewFirstName)
         self.createTFBorder(viewLastName)
         self.createTFBorder(viewDOB)
         self.createTFBorder(viewGender)
         self.createTFBorder(viewCreatePass)
         self.createTFBorder(viewEmail)
        
        // Text Fields Demographic Details
        self.createTFBorder(viewOccupation)
        self.createTFBorder(viewResidance)
        self.createTFBorder(viewEthnicity)
        self.createTFBorder(viewSexOrientation)
        self.createTFBorder(viewNationality)
        self.createTFBorder(viewQualification)

        
        
        //Next Back Button Border
        btnBack.layer.cornerRadius = 16
        btnBack.layer.borderWidth = 1
        btnBack.layer.borderColor = UIColor.white.cgColor
        
        btnNext.layer.cornerRadius = 16
        btnNext.layer.borderWidth = 1
        btnNext.layer.borderColor = UIColor(red: 247/256, green: 45/256, blue: 48/256, alpha: 1.0).cgColor

        // Do any additional setup after loading the view.
        
        //Picker view
        
        
        
    }
    @IBAction func btnAdPrefTapped(_ sender: Any) {
        btnAdPref.backgroundColor = UIColor(red: 247/256, green: 45/256, blue: 48/256, alpha: 1)
        btnCreateAccount.backgroundColor = UIColor(red: 54/256, green: 55/256, blue: 56/256, alpha: 1)
        btnDemoDetails.backgroundColor = UIColor(red: 81/256, green: 82/256, blue: 83/256, alpha: 1)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                    //Frame Option 1:
        //            self.viewDemoDetails.frame = CGRect(x: self.viewDemoDetails.frame.origin.x*0.5, y: self.viewDemoDetails.frame.origin.y, width: self.viewDemoDetails.frame.width, height: self.viewDemoDetails.frame.height)

                    //Frame Option 2:
                    self.viewAdPref.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height * 0.53)
                    self.viewCreateAccount.center = CGPoint(x: self.view.frame.width * (1.5), y: self.view.frame.height / 2)
                    self.viewDemoDetails.center = CGPoint(x: self.view.frame.width * (1.5), y: self.view.frame.height / 2)
        //            self.viewCreateAccount.isHidden = true
                    
        //            self.myView.backgroundColor = .blue

                    },completion: nil)
        
        
        
    }
    
    @IBAction func btnDemoTapped(_ sender: Any) {
        btnAdPref.backgroundColor = UIColor(red: 81/256, green: 82/256, blue: 83/256, alpha: 1)
        btnCreateAccount.backgroundColor = UIColor(red: 54/256, green: 55/256, blue: 56/256, alpha: 1)
        btnDemoDetails.backgroundColor = UIColor(red: 247/256, green: 45/256, blue: 48/256, alpha: 1)
        
        // Call animation for Demo button
        
//        self.viewDemoDetails.isHidden = false
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            //Frame Option 1:
//            self.viewDemoDetails.frame = CGRect(x: self.viewDemoDetails.frame.origin.x*0.5, y: self.viewDemoDetails.frame.origin.y, width: self.viewDemoDetails.frame.width, height: self.viewDemoDetails.frame.height)

            //Frame Option 2:
            self.viewDemoDetails.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
            self.viewCreateAccount.center = CGPoint(x: self.view.frame.width * (1.5), y: self.view.frame.height / 2)
            self.viewAdPref.center = CGPoint(x: self.view.frame.width * (1.5), y: self.view.frame.height / 2)
//            self.viewCreateAccount.isHidden = true
            
//            self.myView.backgroundColor = .blue

            },completion: nil)

        
    }
    @IBAction func btnCreateAcTapped(_ sender: Any) {
        btnAdPref.backgroundColor = UIColor(red: 81/256, green: 82/256, blue: 83/256, alpha: 1)
        btnCreateAccount.backgroundColor = UIColor(red: 247/256, green: 45/256, blue: 48/256, alpha: 1)
        btnDemoDetails.backgroundColor = UIColor(red: 54/256, green: 55/256, blue: 56/256, alpha: 1)
        
        //Animation
//        self.viewCreateAccount.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                    //Frame Option 2:
            self.viewCreateAccount.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height * 0.53)
            self.viewDemoDetails.center = CGPoint(x: self.view.frame.width * 1.5, y: self.view.frame.height / 2)
            self.viewAdPref.center = CGPoint(x: self.view.frame.width * (1.5), y: self.view.frame.height / 2)
//                    self.viewDemoDetails.isHidden = true
        //            self.myView.backgroundColor = .blue

                    },completion: nil)
    }
    
    @IBAction func backViewTapped (_ sender: Any) {
    }
    
    @IBAction func backButtonTapped (_ sender: Any) {
      self.navigationController?.popViewController(animated: true)
      }
    @IBAction func btnNextTapped(_ sender: Any) {
    }
    
    func createTFBorder(_ view: UIView) {
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 71/256, green: 71/256, blue: 71/256, alpha: 1.0).cgColor
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

                let row = indexPath.item
                // get a reference to our storyboard cell
                let reuseIdentifier = "cell"
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! AdPrefCollectionCell

                // Use the outlet in our custom class to get a reference to the UILabel in the cell
                cell.layer.cornerRadius = 10
                cell.layer.masksToBounds = true
        cell.lblAdPref.text = items.object(at: row) as? String
                
                
    //            cell.backgroundColor = UIColor.cyan // make cell more visible in our example project

                return cell
            }
    private func collectionView(collectionView: UICollectionView, shouldSelectItemAt indexPath: NSIndexPath) -> Bool {
        if let selectedItems = collectionView.indexPathsForSelectedItems {
            if selectedItems.contains(indexPath as IndexPath) {
                collectionView.deselectItem(at: indexPath as IndexPath, animated: true)
                return false
            }
        }
        return true
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
       
        
//        let dataDictonary = self.adsArray[indexPath.item] as! NSDictionary
//        let videoUrlString = dataDictonary["video_path"] as? String
//        let videoId = dataDictonary["_id"] as? String
//        UserDefaults.standard.set(videoId, forKey: "videoId")
//        if let url = videoUrlString{
//            playVideo(url: url)
//        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(3))
        let sizeWidth = Int((collectionView.bounds.width - totalSpace) / CGFloat(3.9))
        let sizeHeight = Int((collectionView.bounds.width - totalSpace) / CGFloat(5.6))
            print(sizeWidth, sizeHeight)
            return CGSize(width: sizeWidth, height: sizeHeight)
    //        return CGSize(width:(collectionView.frame.height-90)/2, height: 100)
        }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{

        return genderList.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        self.view.endEditing(true)
        return genderList[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {


        //        self.pickerView.isHidden = true
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
