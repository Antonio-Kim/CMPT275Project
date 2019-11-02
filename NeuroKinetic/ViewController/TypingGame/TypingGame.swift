//
//  TypingGameViewController.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/19/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

let timeLimit = 600 //10 minutes

//extensions for type String
extension String {
    //Checks if input is a-z, A-Z, 0-9
    var isAlphabet: Bool {
        return !isEmpty && range(of: "[^a-zA-Z]", options: .regularExpression) == nil
    }
    
    var isNumeric: Bool {
        return !isEmpty && range(of: "[^0-9]", options: .regularExpression) == nil
    }
    
    //Checks if input is space
    var isSpace: Bool {
        return !isEmpty && range(of: "^\\s", options: .regularExpression) == nil
    }
    
    //Checks if input is backspace
    var isBackSpace: Bool {
        return !isEmpty && range(of: "^\\b", options: .regularExpression) == nil
    }
    
    //Checks if input is punctuation, tabs, or other things
    var isOthers: Bool {
        return !isEmpty && range(of: "^\\t|[^-'.%$#&/]", options: .regularExpression) == nil
    }
}

class TypingGame: UIViewController {
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var paragraphView: UILabel!
    
    @IBOutlet weak var typingTextField: UITextField!
    
   
    @IBOutlet weak var doneButton: UIButton!
    
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
    }
    
    
    @IBAction func typingTextFieldEditingChange(_ typingTextField: UITextField) {
        
        instructionsLabel.text = "Type the following paragraph"
        
        if !completeParagraph {
            if typingTextField.text!.isAlphabet {
                typedWord = typingTextField.text!
                print("LETTER")
            }else if typingTextField.text!.isNumeric {
                print("NUMBER")
            }else if typingTextField.text!.isSpace {
                print("SPACE")
                
                if typedWord == paragraphList.paragraph.wordArr[wordElement] {
                    //turn word to green
                    //save to wordsCorrect
                    //updateParagraph()
                    
                    //prints correct since the typed word is correct
                    instructionsLabel.text = " 😂 100% CORRECT 😂"
                    
                    print("CORRECT WORD")
                    
                    typedWord = ""
                    wordElement += 1
                    typingTextField.text = ""
                }
            }else if typingTextField.text!.isOthers {
                print("OTHERS")
            }
        }
        
        print(typedWord + " \(wordElement)")
        
        😂😂🆗()
    }
    
    //Showing keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    //Hiding keyboard
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
    
    //Check if the paragraph is complete
    func 😂😂🆗() {
        if (wordElement-1) == paragraphList.paragraph.wordArr.count {
            completeParagraph = true;
            wordElement = 0
        }
    }
    
    //update paragraph text view (maybe for version 2)
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




