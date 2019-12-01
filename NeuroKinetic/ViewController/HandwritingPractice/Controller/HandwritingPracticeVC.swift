//
//  HandwritingPracticeVC.swift
//  NeuroKinetic
//
//  Created by yyonata on 10/24/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit
import AVFoundation

class HandwritingPractice: UIViewController {
    var assistance_1,assistance_2,assistance_3:  AVAudioPlayer!
    var assistance_num:Int = -1
    var isFinish:Bool = false
    var sentenceNum:Int = 1
    let number = Int.random(in: 1 ..< 6)
    
    @IBOutlet weak var nextOrDone: UIButton!
    //Function call to clear all written lines on the canvas
    @IBAction func ClearButton(_ sender: Any) {
        SentenceWrite.clear()
    }
    @IBOutlet weak var SentenceWrite: SentenceWriteCanvas!
    
    // load audio files for auditory assistance
    override func viewDidLoad() {
        super.viewDidLoad()
        let path1 = Bundle.main.path(forResource: "Write_bigger1.mp3", ofType: nil)!
        let path2 = Bundle.main.path(forResource: "use_lines.mp3", ofType: nil)!
        let path3 = Bundle.main.path(forResource: "legible.mp3", ofType: nil)!
        do{
            self.assistance_1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path1))
            self.assistance_2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path2))
            self.assistance_3 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path3))
        }
        catch{
            print ("Unexpected Error")
        }
        nextOrDone.setTitle("Next", for: .normal)
        generateSentence()
        let instruction = UILabel(frame: CGRect(x: 250, y: 100, width: 950, height: 50))
        instruction.center.x = self.view.center.x
        instruction.textAlignment = .center
        instruction.font = UIFont(name:"Montserrat-Bold", size: 45.0)
        instruction.textColor = UIColor(red: 59/255, green: 59/255, blue: 59/255, alpha: 1.0) /* #3b3b3b */
        //label.font = UIFont.preferredFont(forTextStyle: .footnote)
        instruction.text = "Write the following sentence below:"
        self.view.addSubview(instruction)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let SE = UserDefaults.standard.bool(forKey: "handwritingSE")
        print(SE)
        if(SE)
        {
            audioAssistance()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        isFinish = true
        if (assistance_1?.isPlaying == true){
            self.assistance_1?.stop()
            self.assistance_1?.currentTime = 0
        }
        if (assistance_2?.isPlaying == true){
            self.assistance_2?.stop()
            self.assistance_2?.currentTime = 0
        }
        if (assistance_3?.isPlaying == true){
            self.assistance_3?.stop()
            self.assistance_3?.currentTime = 0
        }
        
    }
    
    @IBAction func undo(_ sender: Any) {
        SentenceWrite.undo()
    }

    @IBAction func NextSentence(_ sender: Any) {
        sentenceNum += 1
        SentenceWrite.clear()
        generateSentence()
        if (sentenceNum > 3){
            performSegue(withIdentifier: "HandwritingToAfterSign", sender: nil)
        }
    }
    
    @IBOutlet weak var SentenceBank: UILabel!
    
    //Referenced from: https://www.brainyquote.com/topics/inspirational-quotes
    //Bank of quotes used for handwriting practice on the canvas
    fileprivate func generateSentence(){
        switch number {
        case 1:
            if (sentenceNum == 1){
                SentenceBank.text = "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work."
            }
            else if(sentenceNum == 2){
                SentenceBank.text = " And the only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle."
            }
            else{
                SentenceBank.text = "As with all matters of the heart, you'll know when you find it."
                nextOrDone.setTitle("Done", for: .normal)
            }
        case 2:
            if (sentenceNum == 1){
                SentenceBank.text = "Everyone has inside of him a piece of good news."
            }
            else if(sentenceNum == 2){
                SentenceBank.text = "The good news is that you don't know how great you can be!"
            }
            else{
                SentenceBank.text = "How much you can love! What you can accomplish! And what your potential is!"
                nextOrDone.setTitle("Done", for: .normal)
            }
        case 3:
            if (sentenceNum == 1){
                SentenceBank.text = "Everything you want is out there waiting for you to ask."
            }
            else if(sentenceNum == 2){
                SentenceBank.text = "Everything you want also wants you."
            }
            else{
                SentenceBank.text = "But you have to take action to get it."
                nextOrDone.setTitle("Done", for: .normal)
            }
        case 4:
            if (sentenceNum == 1){
                SentenceBank.text = "And above all things, never think that you're not good enough yourself."
            }
            else if(sentenceNum == 2){
                SentenceBank.text = "A man should never think that."
            }
            else{
                SentenceBank.text = "My belief is that in life people will take you at your own reckoning."
                nextOrDone.setTitle("Done", for: .normal)
            }
        case 5:
            if (sentenceNum == 1){
                SentenceBank.text = "A man has to learn that he cannot command things, but that he can command himself;"
            }
            else if(sentenceNum == 2){
                SentenceBank.text = "that he cannot coerce the wills of others, but that he can mold and master his own will: and things serve him who serves Truth;"
            }
            else{
                SentenceBank.text = "people seek guidance of him who is master of himself."
                nextOrDone.setTitle("Done", for: .normal)
            }
        default:
            if (sentenceNum == 1){
                SentenceBank.text = "If a work of art is rich and vital and complete, those who have artistic instincts will see its beauty,"
            }
            else if(sentenceNum == 2){
                SentenceBank.text = "and those to whom ethics appeal more strongly than aesthetics will see its moral lesson."
            }
            else{
                SentenceBank.text = "It will fill the cowardly with terror, and the unclean will see in it their own shame."
                nextOrDone.setTitle("Done", for: .normal)
            }
        }
    }
    
    //play the audio assistance in a loop
    @objc func audioAssistance() {
        if (!isFinish){
            DispatchQueue.main.asyncAfter(deadline: .now() + 8)
            {
                self.audioAssistance()
            }
            DispatchQueue.main.async
            {
                
                switch self.assistance_num {
                    case 0:
                        self.assistance_1?.play()
                    case 1:
                        self.assistance_2?.play()
                    case 2:
                        self.assistance_3?.play()
                    default:
                        self.assistance_3?.play()
                }
                self.assistance_num += 1
                self.assistance_num %= 3
            }
        }
    }
}
