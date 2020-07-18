//
//  PlayerTopView.swift
//  AdRiver
//
//  Created by Muhammad Zafar on 2020-07-18.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit
protocol PlayerTopViewDelegate {
    func stopButtonPressed()
}
class PlayerTopView: UIView {

    var delegate : PlayerTopViewDelegate?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        self.delegate?.stopButtonPressed()
    }
    
}
