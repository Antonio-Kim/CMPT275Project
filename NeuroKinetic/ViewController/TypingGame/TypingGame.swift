//
//  TypingGameViewController.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/19/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

let timeLimit = 600 //10 minutes

//checks if input character is either a-z, A-Z, or 0-9
extension String {
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}

class TypingGame: UIViewController {
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var paragraphView: UILabel!
    
    @IBOutlet weak var typingTextField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    
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
        
        instructionsLabel.text = "Type the following paragraph"
        
        paragraphView.text = paragraphDisplay
        paragraphView.numberOfLines = 0
        //paragraphView.size
        paragraphView.textAlignment = NSTextAlignment.justified
        
        //When user starts typing (might move to the keyboard button
        //        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @IBAction func typingTextFieldEditingChanged(_ sender: UITextField) {
        
        if typingTextField.text == " " {
            updateParagraph()
            wordElement += 1
        }else if typingTextField.text!.isAlphanumeric {
            typedWord = typingTextField.text!
        }
        
        if(typedWord == paragraphList.paragraph.wordArr[wordElement]) {
            //turn word to green
            //print correct
            
        }
    }
    
    //Showing keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    //Hiding keyboard (might be a problem?)
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    //Pick paragraph from list
    func chooseParagraph() {
        let tempNum: Int = Int.random(in:0...15);
        
        paragraphDisplay = paragraphList.generateParagraph(paragraphNumber: tempNum)
    }
    
    //Chekc if correct or wrong and also if it is last word
    func checkWord() {
        
        if typedWord == paragraphList.paragraph.wordArr[wordElement] {
            
            //green colour word
        }
        
        
        
        if (wordElement+1) == paragraphList.paragraph.wordArr.count {
            completeParagraph = true;
        }
        
        
    }
    
    //update paragraph text view
    func updateParagraph() {
        //Check to make sure instruction label is not nil
        guard let _: String = instructionsLabel?.text else {
            instructionsLabel.text = "NO INSTRUCTIONS??"
            return
        }
        
        //Check to make sure typing text field is not nil
        //Might not need it if we are updating/emptying out text field
        guard let _: String = typingTextField?.text else {
            instructionsLabel.text = "Please type something"
            return
        }
        
        //Check to make sure paragraph view is not nil
        guard let _: String = paragraphView?.text else {
            instructionsLabel.text = "NANI?? NO PARAGRAPHS??"
            return
        }
        
        
    }
    
}



