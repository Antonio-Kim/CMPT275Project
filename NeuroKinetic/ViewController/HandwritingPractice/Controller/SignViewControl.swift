//
//  SignViewControl.swift
//  NeuroKinetic
//
//  Created by yyonata on 2019-11-01.
//  Copyright © 2019 teamRANDY. All rights reserved.
//
import UIKit

class SignViewControl: UIViewController {
    struct ampl1{
        static var amplitude1:CGFloat!
    }
    
    @IBOutlet weak var signCanvas: SignatureCanvas!
    
    
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Label.text = "Please enter your signature in the field below"
    }
    
    @IBAction func Done(_ sender: UIButton) {
        ampl1.amplitude1 = signCanvas.calculateAmplitude()
    }
    //Function call to clear written input from the canvas
    @IBAction func clear(_ sender: UIButton) {
        signCanvas.clear()
    }
    
}
