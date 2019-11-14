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

enum ParagraphState {   //Determines how update paragraph should work
    case normal
    case correctWord
    case wrongWord
}

class TypingGame: UIViewController {
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var paragraphView: UILabel!
    
    @IBOutlet weak var typingTextField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var paragraphState = ParagraphState.normal
    
    var wordElement: Int = 0
    
    var paragraphPrintCount: Int = 0
    
    var lastParagraphPrintCount: Int = 0
    
    var paragraphList: ParagraphBank = ParagraphBank()
    
    var paragraphDisplay: String = ""
    
    var maxTypedWord: String = ""
    
    var typedWord: String = ""
    
    var wordCorrect: Bool = false
    
    var completeParagraph: Bool = false
    
    var correctWord: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        typingTextField.isUserInteractionEnabled = true //ensures the user can type in the textfield
        
        chooseParagraph()
        
        instructionsLabel.text = "Type the following paragraph"
        
        paragraphView.text = paragraphDisplay
        paragraphView.numberOfLines = 0
        paragraphView.textAlignment = NSTextAlignment.justified
        
        paragraphState = ParagraphState.normal
    }
    
    @IBAction func typingTextFieldEditingChange(_ typingTextField: UITextField) {
        
        if !completeParagraph {
            //Check to make sure typing text field is not nil
            //User might type some letter and then clear everything from tfield
            //This guard prevents that situation from causes crashes
            guard let text = typingTextField.text, !text.isEmpty else {
                return
            }
            
            //            let temp = typingTextField.text!.last!  //Grabs the users last input to check if it is space
            //
            //            if temp != " " && typingTextField.text! == String(typedWord.dropLast()) {
            //
            //                print("なに backspace -1")
            //
            //                if paragraphPrintCount > lastParagraphPrintCount {
            //                    paragraphPrintCount -= 1
            //                }
            //                //updateParagraph()
            //
            //                print("paragraph print count: " + "\(paragraphPrintCount)")
            //
            //                typedWord = typingTextField.text!
            //
            //                return
            //            }
            //
            //            typedWord = typingTextField.text!
            //
            //            print("typed word: " + typedWord)
            //
            //            print("WordArr count: " + "\(paragraphList.paragraph.wordArr[wordElement].count)")
            //
            //            print("typed word count: " + "\(typedWord.count)")
            //
            //            print("WordArr element: " + "\(paragraphList.paragraph.wordArr[wordElement])")
            //
            //            if typedWord.count <= (paragraphList.paragraph.wordArr[wordElement].count) {   //Check if the typed length exceed what the user is suppose to type
            //
            //                print(paragraphList.paragraph.wordArr[wordElement].prefix(typedWord.count))
            //
            //                if typedWord == paragraphList.paragraph.wordArr[wordElement].prefix(typedWord.count) {
            //                    paragraphPrintCount += 1
            //
            //                    lastParagraphPrintCount = paragraphPrintCount
            //
            //                    print("Inside updating paragraph for correct words")
            //
            //                    paragraphState = ParagraphState.normal
            //                    updateParagraph()   //Updates real time now
            //                }
            //
            //                maxTypedWord = typedWord
            //
            //                print("paragraph print count: " + "\(paragraphPrintCount)" + "\n")
            //
            //            }else if typedWord.count == (paragraphList.paragraph.wordArr[wordElement].count+1) && temp == " " {
            //
            //                typedWord = String(typedWord.dropLast())    //Drops the space
            //
            //                print("paragraph print count in space: " + "\(paragraphPrintCount)" + "\n")
            //
            //                if typedWord == paragraphList.paragraph.wordArr[wordElement] {  //typed word comparing with the corresponding paragraph word
            //                    paragraphPrintCount += 1
            //
            //                    typedWord = ""
            //                    wordElement += 1
            //                    typingTextField.text = ""
            //                    paragraphState = ParagraphState.correctWord
            //                    updateParagraph()   //Updates real time now
            //
            //                }else {
            //                    //paragraphState = ParagraphState.wrongWord
            //                    //turn that word into red
            //                    //updateParagraph()
            //                }
            //
            //            }else {
            //                typingTextField.text! = maxTypedWord
            //            }
            
            typedWord = typingTextField.text!
            
            let temp = typingTextField.text!.last!  //Grabs the users last input to check if it is space
            
            if temp == " " {
                typedWord = String(typedWord.dropLast())    //Drops the space
                
                if typedWord == paragraphList.paragraph.wordArr[wordElement] {  //typed word comparing with the corresponding paragraph word
                    paragraphPrintCount += typedWord.count + 1
                    
                    typedWord = ""
                    wordElement += 1
                    typingTextField.text = ""
                    paragraphState = ParagraphState.correctWord
                    
                    updateParagraph()   //Updates the paragraphView
                }
            }
            
        }
        checkComplete()
    }
    
    //Pick paragraph from list
    func chooseParagraph() {
        let tempNum: Int = Int.random(in:0...15);
        paragraphDisplay = paragraphList.generateParagraph(paragraphNumber: 15)
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
        
        switch paragraphState {
        case .normal:
            let tempSubstring = paragraphDisplay.prefix(paragraphPrintCount)    //Grabs the typed part to set color
            
            let string = NSMutableAttributedString(string: paragraphDisplay)
            
            string.setColorForText(String(tempSubstring), with: UIColor.white)
            
            paragraphView.attributedText = string
            
        case .correctWord:
            let tempSubstring = paragraphDisplay.prefix(paragraphPrintCount)    //Grabs the typed part to set color
            
            let string = NSMutableAttributedString(string: paragraphDisplay)
            
            string.setColorForText(paragraphList.paragraph.wordArr[wordElement-1], with: UIColor.green)
            string.setColorForText(String(tempSubstring.dropLast(paragraphList.paragraph.wordArr[wordElement-1].count+1)), with: UIColor.white)
            
            paragraphView.attributedText = string
            
        case .wrongWord:
            let tempSubstring = paragraphDisplay.prefix(paragraphPrintCount)    //Grabs the typed part to set color
            
            let string = NSMutableAttributedString(string: paragraphDisplay)
            
            string.setColorForText(paragraphList.paragraph.wordArr[wordElement-1], with: UIColor.red)
            string.setColorForText(String(tempSubstring.dropLast(paragraphList.paragraph.wordArr[wordElement-1].count+1)), with: UIColor.white)
            
            paragraphView.attributedText = string
            
        }
        
    }
}






