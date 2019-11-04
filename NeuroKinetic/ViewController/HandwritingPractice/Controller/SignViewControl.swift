//
//  SignViewControl.swift
//  NeuroKinetic
//
//  Created by yyonata on 2019-11-01.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class SignViewControl: UIViewController {
    
    @IBOutlet weak var signCanvas: SignatureCanvas!
    
    
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var done: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clear(_ sender: UIButton) {
        signCanvas.clear()
    }
    
}
