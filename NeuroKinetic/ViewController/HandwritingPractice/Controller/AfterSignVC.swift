//
//  AfterSignVC.swift
//  NeuroKinetic
//
//  Created by yyonata on 2019-11-21.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class AfterSignVC: UIViewController {

    @IBOutlet weak var SignatureCanvasAfter: AfterSignView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Clear(_ sender: Any) {
        SignatureCanvasAfter.clear()
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
