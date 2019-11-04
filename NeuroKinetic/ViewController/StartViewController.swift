//
//  StartViewController.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/20/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var statsButton: UIButton!
    
    @IBOutlet weak var settingButton: UIButton!
    
    @IBOutlet weak var statsLabelButton: UIButton!
    
    @IBOutlet weak var settingLabelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        statsButton.isHidden = true
        settingButton.isHidden = true
        statsLabelButton.isHidden = true
        settingLabelButton.isHidden = true
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
