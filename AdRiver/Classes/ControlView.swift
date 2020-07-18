//
//  ControlView.swift
//  AdRiver
//
//  Created by Muhammad Zafar on 2020-07-18.
//  Copyright © 2020 AdRiver Inc. All rights reserved.
//

import UIKit
protocol ControlViewDelegate {
    func playBtnPress(_ sender: UIButton)
    func soundBtnPress(_ sender: UIButton)
    func sliderValeChanged(_ slider:UISlider)
}
// dummy cahnge
class ControlView: UIView {
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak public var totalTimeLable: UILabel!
    @IBOutlet weak public var seekBar: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    var delegate : ControlViewDelegate?
    var controlDelegate : MBVideoPlayerControlsDelegate?
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
    override func awakeFromNib() {
        
    }
    @IBAction func playBtnPressed(_ sender: UIButton) {
        self.delegate?.playBtnPress(sender)
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.delegate?.sliderValeChanged(sender)
    }
    @IBAction func soundBtnPressed(_ sender: UIButton) {
        self.delegate?.soundBtnPress(sender)
    }
    
}
