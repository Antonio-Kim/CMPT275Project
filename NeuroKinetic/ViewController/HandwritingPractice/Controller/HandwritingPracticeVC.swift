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

    //Function call to clear all written lines on the canvas
    @IBAction func ClearButton(_ sender: Any) {
        SentenceWrite.clear()
    }
    @IBOutlet weak var SentenceWrite: SentenceWriteCanvas!
    
    // load audio files for auditory assistance
    override func viewDidLoad() {
        super.viewDidLoad()
        let path1 = Bundle.main.path(forResource: "always_remember.mp3", ofType: nil)!
        let path2 = Bundle.main.path(forResource: "WritingBigger.mp3", ofType: nil)!
        let path3 = Bundle.main.path(forResource: "bigger.mp3", ofType: nil)!
        do{
            self.assistance_1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path1))
            self.assistance_2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path2))
            self.assistance_3 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path3))
        }
        catch{
            print ("Unexpected Error")
        }
        generateSentence()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        audioAssistance()
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

    
    @IBOutlet weak var SentenceBank: UILabel!
    
    //Referenced from: https://www.englishtrackers.com/english-blog/famous-literary-quotes/
    //Bank of quotes used for handwriting practice on the canvas
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
    
    //play the audio assistance in a loop
    @objc func audioAssistance() {
        if (!isFinish){
            DispatchQueue.main.asyncAfter(deadline: .now() + 4)
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
