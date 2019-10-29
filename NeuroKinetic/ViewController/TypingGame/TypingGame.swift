//
//  TypingGameViewController.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/19/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

let timeLimit = 120 //2 minutes

class TypingGame: UIViewController {
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var paragraphScrollView: UIScrollView!
    
    @IBOutlet weak var typingTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var wordCount: Int = 0
    
    var paragraphList: ParagraphBank = ParagraphBank()
    
    var paragraph: Paragraph = Paragraph()
    
    var word: Word = Word()
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
    
    var typedWord: String = ""
    
    func chooseParagraph() {
        let tempNum: Int = Int.random(in:1...15);
        
        paragraphList.generateParagraph(paragraphNumber: tempNum)
        
        paragraph = paragraphList.paragraph
        
    }
    
    func checkWord() {
        guard let word = myTextField.text else {
            return
        }
        
        
    }
    
    func updateParagraph() {
        
        
        if typedWord == paragraphWord {
            //green
        }
    }
    

    
        
    

}

