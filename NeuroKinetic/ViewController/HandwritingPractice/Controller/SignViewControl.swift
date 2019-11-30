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
        let instruction = UILabel(frame: CGRect(x: 250, y: 100, width: 1000, height: 50))
        instruction.center.x = self.view.center.x
        instruction.center.y = (self.view.center.y)/2
        instruction.textAlignment = .center
        instruction.font = UIFont(name:"Montserrat-Bold", size: 40.0)
        //label.font = UIFont.preferredFont(forTextStyle: .footnote)
        instruction.text = "Please enter your signature in the field below"
        self.view.addSubview(instruction)
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
