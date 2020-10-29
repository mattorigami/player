//
//  ListCollectionCell.swift
//  AdRiver
//
//  Created by Matt on 02.10.20.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit

class ListCollectionCell: UICollectionViewCell {
    @IBOutlet weak var lblList: UILabel!
        
        override var isSelected: Bool {
            didSet {
    //            self.layer.borderWidth = 1.0
    //            self.layer.borderColor = isSelected ? UIColor(red: 247/256, green: 45/256, blue: 48/256, alpha: 1.0).cgColor : UIColor.clear.cgColor
                self.backgroundColor = isSelected ? UIColor.black : UIColor(red: 81/256, green: 82/256, blue: 83/256, alpha: 1.0)
            }
        }
}
