//
//  Setting.swift
//  NeuroKinetic
//
//  Created by Rico Chao on 2019-10-28.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

// Use the following reference to figure the volume issue:
// https://www.youtube.com/watch?v=tq49LUKbRLY
// https://stackoverflow.com/questions/31538921/how-to-change-ios-volume-in-swift-with-help-uislider/31540153#31540153
// https://www.ioscreator.com/tutorials/volume-view-ios-tutorial

import UIKit

class Setting: UIViewController {
    
    @IBOutlet weak var volumeValue: UILabel!
    @IBOutlet weak var volumeStepper: UIStepper!
    @IBOutlet weak var soundEffectSwitch: UISwitch!
    @IBOutlet weak var auditoryAssistanceSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        volumeStepper.maximumValue = 10
        volumeStepper.minimumValue = 0
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        volumeValue.text = Int(sender.value).description
    }
        
    
    
    
}
