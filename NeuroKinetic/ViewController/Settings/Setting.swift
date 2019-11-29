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
import AVFoundation
import MediaPlayer


/** This extension is used to control the volume of the
 
 */
extension MPVolumeView {
  static func setVolume(_ volume: Float) {
    let volumeView = MPVolumeView(frame: .zero)
    let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
      slider?.value = volume
    }
  }
}

class Setting: UIViewController {
    
    // Setting up UI Variables on the Setting.
    
    @IBOutlet weak var volumeValue: UILabel!
    @IBOutlet weak var volumeStepper: UIStepper!
    @IBOutlet weak var soundEffectSwitch: UISwitch!
    @IBOutlet weak var auditoryAssistanceSwitch: UISwitch!
    
    var volume: Float = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        volume = UserDefaults.standard.float(forKey: "masterVolume")
        
        //stepper initialization
        volumeStepper.maximumValue = 10
        volumeStepper.minimumValue = 0
        volumeStepper.value = Double(volume*10)
        
        soundEffectSwitch.onTintColor = .black
        soundEffectSwitch.transform = CGAffineTransform(scaleX: 1.75, y: 1.75)
        
        auditoryAssistanceSwitch.onTintColor = .black
        auditoryAssistanceSwitch.transform = CGAffineTransform(scaleX: 1.75, y: 1.75)
        
        let metronomeSE = UserDefaults.standard.bool(forKey: "metronomeSE")
        let handwritingSE = UserDefaults.standard.bool(forKey: "handwritingSE")
        
        soundEffectSwitch.setOn (metronomeSE, animated: false)
        auditoryAssistanceSwitch.setOn (handwritingSE, animated: false)
        
        
        MPVolumeView.setVolume(volume)
        volumeValue.text = Int(volume*10).description
    }
    
    //stepper volume function
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //Set volume
        volume = Float(Int(sender.value))*0.1
        MPVolumeView.setVolume(volume)
        volumeValue.text = Int(volume*10).description
        
        //Save volume
        UserDefaults.standard.set(volume, forKey: "masterVolume")
        print(volume)
    }
    
    //sound effect function
    @IBAction func setSoundEffect(_ sender: Any) {
        if soundEffectSwitch.isOn
        {
            UserDefaults.standard.set(true, forKey: "metronomeSE")
            print("Metronome SE: On")
        }
        else
        {
            UserDefaults.standard.set(false, forKey: "metronomeSE")
            print("Metronome SE: Off")
        }
    }
    //auditory assistance
    @IBAction func setAuditoryAssistance(_ sender: Any) {
        if auditoryAssistanceSwitch.isOn
        {
            UserDefaults.standard.set(true, forKey: "handwritingSE")
            print("Handwriting SE: On")
        }
        else
        {
            UserDefaults.standard.set(false, forKey: "handwritingSE")
            print("Handwriting SE: Off")
        }
    }
}
