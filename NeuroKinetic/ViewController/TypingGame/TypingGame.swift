//
//  TypingGameViewController.swift
//  NeuroKinetic
//
//  View controller for Typing Game
//
//  NOTE: User should be using a hardware keyboard for the typing game (Make sure Connect Hardware Keyboard is enabled)
//
//  Created by Rico Chao on 10/19/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

//Referenced from https://github.com/anoop4real/UILabelStyles
//Extension for NSMutableAttributedString
extension NSMutableAttributedString {
    // A function to set color for text, used to changing colors in paragraph
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
        
        typingTextField.isUserInteractionEnabled = true //ensures the user can type in the textfield
        
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
            
            let temp = typingTextField.text!.last!  //Grabs the users last input to check if it is space
                
            if temp == " " {
                typedWord = String(typedWord.dropLast())    //Drops the space
            
                if typedWord == paragraphList.paragraph.wordArr[wordElement] {  //typed word comparing with the corresponding paragraph word
                    paragraphPrintCount += typedWord.count + 1
                    
                    typedWord = ""
                    wordElement += 1
                    typingTextField.text = ""
                
                    updateParagraph()   //Updates the paragraphView
                }
            }
        }
        
        checkComplete()
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
            typingTextField.isUserInteractionEnabled = false    //Make sure the user cannot type after the paragraph is completed
            instructionsLabel.text = "Done, Good Job!"
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
            instructionsLabel.text = "NO PARAGRAPHS??"
            return
        }
        
        let tempSubstring = paragraphDisplay.prefix(paragraphPrintCount)    //Grabs the typed part to set color
        
        let string = NSMutableAttributedString(string: paragraphDisplay)
        
        string.setColorForText(String(tempSubstring), with: UIColor.white)
        
        paragraphView.attributedText = string
    }
}




