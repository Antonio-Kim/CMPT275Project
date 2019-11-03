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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearButton(_ sender: Any) {
        signCanvas.clear()
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
