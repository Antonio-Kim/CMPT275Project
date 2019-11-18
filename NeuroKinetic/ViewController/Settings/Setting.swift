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
import MediaPlayer

extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        // Need to use the MPVolumeView in order to change volume, but don't care about UI set so frame to .zero
        let volumeView = MPVolumeView(frame: .zero)
        // Search for the slider
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider
        // Update the slider value with the desired volume.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
        // Optional - Remove the HUD
        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
            volumeView.alpha = 0.000001
            window.addSubview(volumeView)
        }
    }
}
class Setting: UIViewController {
    
    @IBOutlet weak var volumeValue: UILabel!
    @IBOutlet weak var volumeStepper: UIStepper!
    @IBOutlet weak var soundEffectSwitch: UISwitch!
    @IBOutlet weak var auditoryAssistanceSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        volumeStepper.maximumValue = 10
        volumeStepper.minimumValue = 0
        MPVolumeView.setVolume(0.0)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        volumeValue.text = Int(sender.value).description
    }
        
    
    
    
}
