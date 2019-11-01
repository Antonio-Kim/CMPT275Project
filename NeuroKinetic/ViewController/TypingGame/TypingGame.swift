//
//  TypingGameViewController.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/19/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

let timeLimit = 600 //10 minutes

class TypingGame: UIViewController {
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var paragraphScrollView: UIScrollView!
    
    @IBOutlet weak var typingTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!

    var wordCount: Int = 0
    
    var wordElement: Int = 0
    
    var wordCorrectCount: Int = 0
    
    var wordWrongCount: Int = 0
    
    var paragraphList: ParagraphBank = ParagraphBank()
    
    var paragraphDisplay: String = ""
    
    var typedWord: String = ""
    
    var wordCorrect: Bool = false
    
    var completeParagraph: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        chooseParagraph()
        
        //When user starts typing (might move to the keyboard button
//        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    /**
            Show the keyboard
     */
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    /**
            Hide the keyboard
     */
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    func chooseParagraph() {
        let tempNum: Int = Int.random(in:1...15);
        
        paragraphList.paragraphNum = tempNum
        
        paragraphDisplay = paragraphList.generateParagraph(paragraphNumber: tempNum)
    }
    
    //Chekc if correct or wrong and also if it is last word
    func checkWord() {
        
        
        
        
    }
    
    func updateParagraph() {
        guard let t1: String = typingTextField?.text else {
            //instructionsLabel.
            return
        }
        
        //typedWord = typingTextField.text
        
        //Keep looping until paragraph is complete or time exceeds time limi
        while /*time != timeLimit || */ !completeParagraph {
            
//            if /* space is pressed */ {
//                //check word
//                //word flag set
//
//                //if typedWord == wordArr[wordElement] {
//                //
//                //
//                //}
//
//            }
            
                
        
//        if typedWord == paragraphWord {
//            //green
//        }
        }
    }
    

    
        
    

}

