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

class Setting: UIViewController {
    
    @IBOutlet weak var systemVolumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let systemVolumeView = MPVolumeView(frame: systemVolumeSlider.frame)
        systemVolumeView.isHidden = false
        systemVolumeView.alpha = 0.01
        systemVolumView.backgroundColor = UIColor.clear
        view.addSubview(systemVolumeView)
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
