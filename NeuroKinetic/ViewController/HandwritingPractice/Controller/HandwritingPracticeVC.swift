//
//  HandwritingPracticeVC.swift
//  NeuroKinetic
//
//  Created by yyonata on 10/24/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class HandwritingPractice: UIViewController {
    
    @IBAction func ClearButton(_ sender: Any) {
        SentenceWrite.clear()
    }
    @IBOutlet weak var SentenceWrite: SentenceWriteCanvas!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateSentence()
    }
    
    
    @IBOutlet weak var SentenceBank: UILabel!
    
    fileprivate func generateSentence(){
        let number = Int.random(in: 0 ..< 5)
        switch number {
        case 1:
            SentenceBank.text = "All we have to decide is what to do with the time that is given to us"
        case 2:
            SentenceBank.text = "It matters not what someone is born, but what they grow to be"
        case 3:
            SentenceBank.text = "Whatever our souls are made of, his and mine are the same"
        case 4:
            SentenceBank.text = "Not all those who wander are lost"
        case 5:
            SentenceBank.text = "Real courage is when you know you’re licked before you begin, but you begin anyway and see it through no matter what"
        default:
            SentenceBank.text = "We are such stuff as dreams are made on, and our little life is rounded with a sleep"
        }
    }
}
