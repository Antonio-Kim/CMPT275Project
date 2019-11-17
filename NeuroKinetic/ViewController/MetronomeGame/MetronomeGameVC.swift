//
//  MetronomeGame.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/23/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import FirebaseDatabase
//This UIViewController class is for metronome game
class MetronomeGame: UIViewController {
    //MP3 Initialization for metronome sound
    var audioPlayer = AVAudioPlayer()
    //Varible Initialization
    var tapCount:Int = 0
    var didStart: Bool = false
    var isGameOver: Bool = false
    var interval:Double = 2.0
    var tolerance:Double = 0.5
    //Difficulity Bar
    @IBOutlet weak var difficulityBar: UISlider!
    
    //Score Variables
    var score = Array(repeating: -1, count: 20)
    var totalScore: Int = 0
    //Timer Initialization
    var rightTime:Date = Date()
    var leftTime:Date = Date()
    var tapTime: Double = 0.0
    
    //UserDefault preference storing
    let preferences = UserDefaults.standard
    let currentLevelKey = "TotalMetronomeGamesPlayed"
    var gamesPlayed: Int = 0
    
    //Start button and Message label
    @IBOutlet weak var tap: UIButton!
    @IBOutlet weak var message: UILabel!
    
    //TAP right and left button
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var left: UIButton!
    
    //Music Note Image
    @IBOutlet weak var soundNote: UIImageView!
    
    //Returns the index of the score array
    func scoreIndex(isLeft: Bool) ->Int
    {
        let isOdd = tapCount%2
        //If left button is tapped
        if(isLeft)
        {
            if(isOdd == 0)
            {
                return tapCount - 1
            }
            else
            {
                return tapCount
            }
        }
        //If right button is tapped
        else
        {
            if(isOdd == 1)
            {
                return tapCount - 1
            }
            else
            {
                return tapCount
            }
        }
    }
    
    //Animation for music note: Right movement
    func moveRight()
    {
        UIView.animate(withDuration: self.interval,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {self.soundNote.frame.origin.x = self.right.frame.origin.x } ,
                       completion:{
                        _ in
                        self.tapCount += 1
                        DispatchQueue.main.async {
                            self.audioPlayer.play()
                        }
                        self.moveLeft()
                        self.rightTime = Date()
                        self.leftTime = Date(timeIntervalSinceNow: self.interval)
                        
                        //Metronome Sound
                        
                        //Chain animation. Start moving to the left.
                        
        })
    }
    //Animation for music note: Left movement
    func moveLeft()
    {
        //The music note will move towards the left button linearly over two seconds
        UIView.animate(withDuration: self.interval, delay: 0.0, options: .curveLinear,
                       animations: { self.soundNote.frame.origin.x = self.left.frame.origin.x} ,
                       //After animation is completed below statements are executed
            completion:{
                _ in
                
                self.tapCount += 1
                //Metronome Sound
                DispatchQueue.main.async {
                    self.audioPlayer.play()
                }
                
                //If tap count is less than or equal to 19, continue the game
                if(!(self.tapCount>=19))
                {
                    ////Chain animation. Start moving to the right.
                    print(self.score)
                    self.moveRight()
                    self.leftTime = Date()
                    self.rightTime = Date(timeIntervalSinceNow: self.interval)
                }
                    //If tap count is bigger than or equal to 19, finish the game displaying "GAME OVER"
                    //And fade out all the buttons
                else
                {
                    self.message.text = "GAME OVER"
                    for sc in self.score
                    {
                        if(sc == 1)
                        {
                            self.totalScore += 1
                        }
                    }
                    self.isGameOver = true
                    self.animateFinish()
                }
                
        })
    }
    
    //Start button disappears
    func startDisappear()
    {
        UIView.animate(withDuration: 2,
                       animations:{self.tap.alpha = 0} )
        //self.tap.removeFromSuperview()
    }
    
    //Animation to be executed when the game is finished
    func animateFinish()
    {
        self.tap.setTitle("DONE", for: .normal)
        self.message.text = "Score :" + String(self.totalScore)
        let ref = Database.database().reference()
        let gameFinishTime :Date = Date()
        let calendar = Calendar.current
        let year:Int = calendar.component(.year, from:gameFinishTime)
        let month:Int = calendar.component(.month, from:gameFinishTime)
        let day:Int = calendar.component(.day, from:gameFinishTime)
        gamesPlayed += 1
        
        //Setting gamesPlayed into the perferences
        preferences.set(gamesPlayed, forKey: currentLevelKey)
        
        //  Save to disk
        let didSave = preferences.synchronize()
        
        if !didSave {
            //  Couldn't save (I've never seen this happen in real world testing)
        }
        ref.child("Metronome/\(year)-\(month)-\(day)/TotalGamesPlayed").setValue(gamesPlayed)
        ref.child("Metronome/\(year)-\(month)-\(day)/Score").setValue(totalScore)
        //Display "DONE". Fade out all the other buttons and labels.
        UIView.animate(withDuration: 3,
                       animations:{
                        self.tap.alpha = 1
                        self.right.alpha = 0
                        self.left.alpha = 0
                        self.soundNote.alpha = 0
                        //self.message.alpha = 0
        } )
    }
    
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Bringing image to the front
        view.addSubview(soundNote)
        
        //Grabs the gamesPlayed from the stored preference
        if preferences.object(forKey: currentLevelKey) == nil {
            //  Doesn't exist
        } else {
            gamesPlayed = preferences.integer(forKey: currentLevelKey)
            print(gamesPlayed)
        }
        
        //Initializing sound file
        let sound = Bundle.main.path(forResource:"metronomeSound(2)", ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        //If it fails to load, returns, error
        catch{
            print(error)
        }
    }
    
    //The button has two functionalities
    //Before game is started: Works as a start button
    //After game is over: Works as a quit button
    @IBAction func TAP(_ sender: UIButton) {
        //Starting game if the game hasn't started yet
        if(!didStart)
        {
            //Take Start time
            
            rightTime = Date(timeIntervalSinceNow:2)
            leftTime = Date(timeIntervalSinceNow:4)
            //Fade out start button
            didStart = true
            UIView.animate(withDuration: 2, animations:{self.tap.alpha = 0} )
            
            moveRight()
            //startTime = Date.init()
            
        }
        //Navigating to the menu, if the game is finished
        if(isGameOver)
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "GameMenu")
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    //
    @IBAction func tapRight(_ sender: UIButton) {
        //The button functions if and only if the game has started and hasn't finished yet
        if(didStart && !isGameOver)
        {
            //Take the user tap time
            let tempTime: Date = Date()
            tapTime = tempTime.timeIntervalSince(rightTime)
            
            //Take a difference between user tap time and expected timing
            
            //If the difference is negative, convert it to positive
            if(tapTime<0)
            {
                tapTime *= (-1)
            }
            let i = scoreIndex(isLeft:false)
            //Display "Miss" or "Good Tap" depending on user's timing and expected time difference
            if(tapTime>tolerance)
            {
                //Display "Miss"
                message.text = "Miss"
                message.alpha = 1
                if(score[i] == -1)
                {
                    score[i] = 0
                }
                //Fade out "Miss" with animation
               // UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
            else
            {
                //Display "Good Tap"
                //message.text = "Good Tap"
                message.alpha = 1
                if(score[i] == -1)
                {
                    score[i] = 1
                }
                //Fade out "Good" with animation
                //UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
            message.text = "\(score)"
        }
    }
    
    @IBAction func tapLeft(_ sender: UIButton) {
        //The button functions if and only if the game has started and hasn't finished yet
        if(didStart && !isGameOver)
        {
            //Take a difference between user tap time and expected timing
            let tempTime: Date = Date()
            tapTime = tempTime.timeIntervalSince(leftTime)
            
            
            
            //If the difference is negative, convert it to positive
            if(tapTime<0)
            {
                tapTime *= (-1)
            }
            let i = scoreIndex(isLeft:true)
            //Display "Miss" or "Good Tap" depending on user's timing and expected time difference
            if(tapTime>tolerance)
            {
                if(score[i] == -1)
                {
                    score[i] = 0
                }
                //Display "Miss"
                //message.text = "Miss"
                message.alpha = 1
                //Fade out "Miss" with animation
                //UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
            else
            {
                if(score[i] == -1)
                {
                    score[i] = 1
                }
                //Display "Good Tap"
                //message.text = "Good Tap"
                message.alpha = 1
                //Fade out "Good" with animation
                //UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
            message.text = "\(score)"
        }
    }
    @IBAction func changeDifficulity(_ sender: UISlider) {
        if(!didStart)
        {
            message.text = String(0.5 + 1.5 * Double(sender.value))
            interval = 0.5 + 1.5 * Double(sender.value)
            tolerance = 0.3 + 0.2 * Double(sender.value)
        }
    }
    
    
    
}
