//
//  TypingGameViewController.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/19/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

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
    
    //Checks if input is punctuation, tabs, or other things
    var isOthers: Bool {
        return !isEmpty && range(of: "[^-'.%$#&/]", options: .regularExpression) == nil
    }
}

//Referenced from https://github.com/anoop4real/UILabelStyles
extension NSMutableAttributedString {
    // If no text is send, then the style will be applied to full text
    func setColorForText(_ textToFind: String?, with color: UIColor) {
        
        let range:NSRange?
        if let text = textToFind{
            range = self.mutableString.range(of: text, options: .caseInsensitive)
        }else{
            range = NSMakeRange(0, self.length)
        }
        
        if range!.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range!)
        }
    }
}

class TypingGame: UIViewController {
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var paragraphView: UILabel!
    
    @IBOutlet weak var typingTextField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var wordElement: Int = 0
    
    var paragraphPrintCount: Int = 0
    
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
        paragraphView.textAlignment = NSTextAlignment.justified
    }
    
    @IBAction func typingTextFieldEditingChange(_ typingTextField: UITextField) {
        
        if !completeParagraph {
            //Check to make sure typing text field is not nil
            //User might type some letter and then clear everything from textfield
            //This guard prevents that situation from causes crashes
            guard let text = typingTextField.text, !text.isEmpty else {
                return
            }
            
            typedWord = typingTextField.text!
            
            let temp = typingTextField.text!.last!
                
            if temp == " " {
                typedWord = String(typedWord.dropLast())
            
                if typedWord == paragraphList.paragraph.wordArr[wordElement] {
                    paragraphPrintCount += typedWord.count + 1
                    
                    typedWord = ""
                    wordElement += 1
                    typingTextField.text = ""
                
                    updateParagraph()
                }
            }
        }
        
        checkComplete()
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
    func checkComplete() {
        if wordElement == paragraphList.paragraph.wordArr.count {
            completeParagraph = true;
            wordElement = 0
            print("Complete Paragraph")
        }
    }
    
    //update paragraph text view
    func updateParagraph() {
        //Check to make sure instruction label is not nil
        guard let iText = instructionsLabel.text, !iText.isEmpty else {
            instructionsLabel.text = "NO INSTRUCTIONS??"
            return
        }
        
        //Check to make sure paragraph view is not nil
        guard let pText = paragraphView.text, !pText.isEmpty else {
            instructionsLabel.text = "NANI?? NO PARAGRAPHS??"
            return
        }
        
        let tempSubstring = paragraphDisplay.prefix(paragraphPrintCount)
        
        let string = NSMutableAttributedString(string: paragraphDisplay)
        
        string.setColorForText(String(tempSubstring), with: UIColor.white)
        
        paragraphView.attributedText = string
    }
}




