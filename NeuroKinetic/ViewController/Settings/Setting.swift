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
    
    @IBOutlet var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
    }
    
}
