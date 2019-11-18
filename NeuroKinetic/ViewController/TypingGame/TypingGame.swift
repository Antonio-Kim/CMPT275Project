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
import FirebaseDatabase
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
    
    //UI Labels
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var paragraphView: UILabel!
    
    //UI Text field
    @IBOutlet weak var typingTextField: UITextField!
    
    //UI Button
    @IBOutlet weak var doneButton: UIButton!
    
    //UserDefault preference storing
    let preferences = UserDefaults.standard
    let currentLevelKey = "TotalTypingGamesPlayed"
    var gamesPlayed: Int = 0
    
    //Paragraph State
    var paragraphState = ParagraphState.normal
    
    //Paragraph bank class
    var paragraphList: ParagraphBank = ParagraphBank()
    
    //Int
    var wordElement: Int = 0
    var paragraphPrintCount: Int = 0
    var correctWordsNum = 0
    var wrongWordsNum = 0
    var wpm: Int = 0
    
    //var lastParagraphPrintCount: Int = 0
    
    //Strings
    var paragraphDisplay: String = ""
    var maxTypedWord: String = ""
    var typedWord: String = ""
    
    //Bool
    var wordCorrect: Bool = false
    var completeParagraph: Bool = false
    
    //Time measurement
    var startTime: Date = Date()
    var finishTime: Date = Date()
    var totalTime: Double = 0
    var didStart: Bool = false
    
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
        
        //Grabs the gamesPlayed from the stored preference
        if preferences.object(forKey: currentLevelKey) == nil {
            //  Doesn't exist
        } else {
            gamesPlayed = preferences.integer(forKey: currentLevelKey)
            print(gamesPlayed)
        }
    }
    
    @IBAction func typingTextFieldEditingChange(_ typingTextField: UITextField) {
        
        if !completeParagraph {
            //Check to make sure typing text field is not nil
            //User might type some letter and then clear everything from tfield
            //This guard prevents that situation from causes crashes
            guard let text = typingTextField.text, !text.isEmpty else {
                return
            }
            
            if (!didStart) {
                startTime = Date()
                didStart = true
                print(startTime)
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
                }else {
                    //paragraphState = ParagraphState.wrongWord
                    
                    //updateParagraph()   //Updates the paragraphView
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
            let ref = Database.database().reference()
            completeParagraph = true;
            wordElement = 0
            finishTime = Date()
            print("Complete Paragraph")
            totalTime = finishTime.timeIntervalSince(startTime)
            wpm = Int(Double(paragraphList.paragraph.wordArr.count) / (totalTime/60))
            print("Number of words: " + "\(paragraphList.paragraph.wordArr.count)")
            print("TotalTime is " + "\(totalTime)")
            print("Words per minute: " + "\(wpm)")
            //let date:Date = Date()
            let gameFinishTime :Date = Date()
            let calendar = Calendar.current
            let year:Int = calendar.component(.year, from:gameFinishTime)
            let month:Int = calendar.component(.month, from:gameFinishTime)
            let day:Int = calendar.component(.day, from:gameFinishTime)
            
            typingTextField.isUserInteractionEnabled = false    //Make sure keybaord disabled after paragraph is completed
            animationFinish()
            instructionsLabel.text = "Done, Good Job!"
            
            gamesPlayed += 1
            
            //Setting gamesPlayed into the perferences
            preferences.set(gamesPlayed, forKey: currentLevelKey)
            
            //  Save to disk
            let didSave = preferences.synchronize()
            
            if !didSave {
                //  Couldn't save (I've never seen this happen in real world testing)
            }
            
            //Writing into Firebase Realtime Database
            ref.child("TypingGame/\(year)-\(month)-\(day)/Game: \(gamesPlayed)/TotalGamesPlayed").setValue(gamesPlayed)
            ref.child("TypingGame/\(year)-\(month)-\(day)/Game: \(gamesPlayed)/WPM").setValue(wpm)
            
        }
    }
    
    func animationFinish()
    {
        //Display "DONE". Fade out all the other buttons and labels.
        instructionsLabel.text = "Done, Good Job!"
        UIView.animate( withDuration: 2,
                        delay: 0,
                        options: .curveLinear,
                        animations:{self.paragraphView.alpha = 0},
                        completion:{
                            _ in
                            self.paragraphView.text = "WPM: " + "\(self.wpm)"
                            self.paragraphView.textColor = UIColor.white
                            self.paragraphView.font = self.paragraphView.font.withSize(30)
        })
        
        UIView.animate( withDuration: 2,
                        delay: 1,
                        options: .curveLinear,
                        animations:{self.paragraphView.alpha = 1},
                        completion:{
                            _ in
        })
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
            
            string.setColorForText(String(tempSubstring), with: UIColor.green)
            
            string.setColorForText(String(tempSubstring.dropLast(paragraphList.paragraph.wordArr[wordElement-1].count+1)), with: UIColor.white)
            
            paragraphView.attributedText = string
            
        case .wrongWord:
            let tempSubstring = paragraphDisplay.prefix(paragraphPrintCount)    //Grabs the typed part to set color
            
            let string = NSMutableAttributedString(string: paragraphDisplay)
            
            string.setColorForText(String(tempSubstring), with: UIColor.red)
            
            //string.setColorForText(String(tempSubstring.dropLast(paragraphList.paragraph.wordArr[wordElement-1].count+1)), with: UIColor.white)
            
            paragraphView.attributedText = string
            
        }
    }
}








