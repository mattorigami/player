//
//  ControlView.swift
//  AdRiver
//
//  Created by Muhammad Zafar on 2020-07-18.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit
class ControlView: UIView {

    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var totalTimeLable: UILabel!
    @IBOutlet weak var seekBar: UISlider!
    @IBOutlet weak var playButton: UIButton!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    
}
