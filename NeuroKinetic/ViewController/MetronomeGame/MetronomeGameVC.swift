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
import MediaPlayer


//This UIViewController class is for metronome game
class MetronomeGame: UIViewController {
    
   
    //MP3 Initialization for metronome sound
    var metroSE,classic_music: AVAudioPlayer!
    
    //Read user setting for classic music on/off
    let SE = UserDefaults.standard.bool(forKey: "metronomeSE")
    
    //Varible Initialization
    var tapCount:Int = 0
    var didStart: Bool = false
    var isGameOver: Bool = false
    var interval:Double = 1.5
    var tolerance:Double = 0.3
    var gamesPlayed: Int = 0

    //Difficulity buttons and message label
    @IBOutlet var easy: UIButton!
    @IBOutlet var normal: UIButton!
    @IBOutlet var hard: UIButton!
    @IBOutlet weak var difficulityLabel: UILabel!
    
    
    //Score Variables
    var score = Array(repeating: -1, count: 20)
    var totalScore: Int = 0
    @IBOutlet weak var scoreLabel: UILabel!
    
    //Timer Initialization
    var rightTime:Date = Date()
    var leftTime:Date = Date()
    var tapTime: Double = 0.0
    
    //UserDefault preference storing
    let preferences = UserDefaults.standard
    let currentLevelKey = "TotalMetronomeGamesPlayed"
    
    //Start button and Message label
    @IBOutlet weak var tap: UIButton!
    @IBOutlet weak var message: UILabel!
    
    //TAP right and left button
    let right = UIButton(frame: CGRect(x:837, y:554, width:100, height:100))
    let left = UIButton(frame: CGRect(x:257, y:554, width:100, height:100))
    
    //Music Note Image
    let soundNote = UIImageView(frame: CGRect(x:257, y:554, width:100, height:100))
    
    //Returns the index to store the score in the array
    func scoreIndex(isLeft: Bool) ->Int{
        let isOdd = tapCount%2
        //If left button is tapped
        if(isLeft){
            if(isOdd==0){
                return tapCount - 1
            }
            else{
                return tapCount
            }
        }
        //If right button is tapped
        else{
            if(isOdd==1){
                return tapCount - 1
            }
            else{
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
                //metronome sound
                DispatchQueue.main.async {
                    self.metroSE.play()
                }
            self.moveLeft()
            //set expected time
            self.rightTime = Date()
            self.leftTime = Date(timeIntervalSinceNow: self.interval)
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
                //If tap count is less than or equal to 19, continue the game
                if(!(self.tapCount>=19))
                {
                    //metronome sound
                    DispatchQueue.main.async {
                        self.metroSE.play()
                    }
                    self.moveRight()
                    self.leftTime = Date()
                    self.rightTime = Date(timeIntervalSinceNow: self.interval)
                }
                //If tap count is bigger than or equal to 19, finish the game displaying "GAME OVER"
                //And fade out all the buttons
                else
                {
                    self.metroSE.play()
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.tolerance)
                    {
                        self.isGameOver = true
                        self.animateFinish()
                    }
                }
                
        })
    }
    
    //Animation to be executed when the game is finished and store data in firebase
    func animateFinish()
    {
        let gameFinishTime :Date = Date()
        let calendar = Calendar.current
        let year:Int = calendar.component(.year, from:gameFinishTime)
        let month:Int = calendar.component(.month, from:gameFinishTime)
        let day:Int = calendar.component(.day, from:gameFinishTime)
        
        //Database update
        self.tap.setTitle("DONE", for: .normal)
        self.message.text = "Score :" + String(self.totalScore)
        let ref = Database.database().reference()
        gamesPlayed += 1
        
        //Setting gamesPlayed into the perferences
        preferences.set(gamesPlayed, forKey: currentLevelKey)
        
        //Save to disk
        let didSave = preferences.synchronize()
        
        ref.child("Metronome/\(year)-\(month)-\(day)/Game: \(gamesPlayed)/TotalGamesPlayed").setValue(gamesPlayed)
        ref.child("Metronome/\(year)-\(month)-\(day)/Game: \(gamesPlayed)/Score").setValue(totalScore)
        
        //Fade out classic music
        if(SE)
        {
            classic_music.setVolume(0, fadeDuration: 2)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
            {
                if(self.classic_music?.isPlaying == true)
                {
                    self.classic_music.stop()
                    self.classic_music.currentTime = 0
                }
            }
        }
        //Display "DONE". Fade out all the other buttons and labels.
        UIView.animate(withDuration: 3,
            animations:{
                self.tap.alpha = 1
                self.right.alpha = 0
                self.left.alpha = 0
                self.soundNote.alpha = 0
                self.message.alpha = 1
                self.scoreLabel.alpha = 0
            } )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initializing sound note image
        soundNote.image = UIImage(named: "movingMusicCircle")
        self.view.addSubview(soundNote)
        
        //Initializing right/left buttons
        let buttonImage = UIImage(named: "tapButton")
        right.setImage(buttonImage, for: .normal)
        left.setImage(buttonImage, for: .normal)
        right.addTarget(self, action:#selector(self.tapRight(_:)),for: .touchUpInside)
        left.addTarget(self, action:#selector(self.tapLeft(_:)),for: .touchUpInside)
        self.view.addSubview(right)
        self.view.addSubview(left)
        
        //Grabs the gamesPlayed from the stored preference
        if preferences.object(forKey: currentLevelKey) == nil {
            //  Doesn't exist
        } else {
            gamesPlayed = preferences.integer(forKey: currentLevelKey)
        }
        
        //Initializing sound file
        let metroSound = Bundle.main.path(forResource:"metronomeSound(2)", ofType: "mp3")
        
        do{
            metroSE = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: metroSound!))
        }
        //If it fails to load, returns, error
        catch{
            print(error)
        }
        
        //If classic music setting on, load the mp3 file
        if(SE)
        {
            let classicMusic = Bundle.main.path(forResource:"classic_music(2)", ofType: "mp3")
            do{
                classic_music = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: classicMusic!))
            }
            catch{
                print(error)
            }
        }
    }
    
    //Called
    override func viewDidDisappear(_ animated: Bool) {
        if(SE){
        self.classic_music.setVolume(0, fadeDuration: 2)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
        {
            if(self.classic_music?.isPlaying == true)
            {
                self.classic_music.stop()
                self.classic_music.currentTime = 0
            }
        }
        }
    }
    
    //The button has two functionalities
    //Before game is started: Works as a start button
    //After game is over: Works as a quit button
    @IBAction func TAP(_ sender: UIButton) {
        //Starting game if the game hasn't started yet
        if(!didStart)
        {
            //Set expected tap time
            rightTime = Date(timeIntervalSinceNow:2)
            leftTime = Date(timeIntervalSinceNow:4)
            
            didStart = true
            //fading out all buttons except for sound note and tap buttons
            UIView.animate(withDuration: 1, animations:{
                self.tap.alpha = 0
                self.easy.alpha = 0
                self.normal.alpha = 0
                self.hard.alpha = 0
                self.difficulityLabel.alpha = 0
                self.message.alpha = 0
            } )
            if(SE)
            {
                DispatchQueue.main.async {
                    self.classic_music.play()
                }
            }
            moveRight()
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
                if(i != 20 && score[i] == -1)
                {
                    score[i] = 0
                    message.text = "Miss"
                    message.alpha = 1
                    UIView.animate(withDuration: 0.8, animations: {self.message.alpha = 0}, completion: {finished in})
                }
            }
            else
            {
                if(score[i] == -1)
                {
                    totalScore += 1
                    score[i] = 1
                    message.text = "Good Tap"
                    message.alpha = 1
                    scoreLabel.text = "Score:  \(totalScore)"
                    UIView.animate(withDuration: 0.8, animations: {self.message.alpha = 0}, completion: {finished in})
                }
            }
        }
    }
    
    @IBAction func tapLeft(_ sender: UIButton) {
        //The button functions if and only if the game has started and hasn't finished yet
        if(didStart && !isGameOver){
            //Take a difference between user tap time and expected timing
            let tempTime: Date = Date()
            tapTime = tempTime.timeIntervalSince(leftTime)
            //If the difference is negative, convert it to positive
            if(tapTime<0){
                tapTime *= (-1)
            }
            
            let i = scoreIndex(isLeft:true)
            
            //Display "Miss" or "Good Tap" depending on user's timing and expected time difference
            if(tapTime>tolerance){
                if(score[i] == -1){
                    score[i] = 0
                    message.text = "Miss"
                    message.alpha = 1
                    UIView.animate(withDuration: 0.8, animations: {self.message.alpha = 0}, completion: {finished in})
                }
            }
            else{
                if(score[i] == -1){
                    totalScore += 1
                    score[i] = 1
                    message.text = "Good Tap"
                    message.alpha = 1
                    scoreLabel.text = "Score:  \(totalScore)"
                    UIView.animate(withDuration: 0.8, animations: {self.message.alpha = 0}, completion: {finished in})
                }
            }
        }
    }
    
    //easy button tapped. set difficulity to easy.
    @IBAction func setEasyInterval(_ sender: UIButton) {
        interval = 2.0
        tolerance = 0.3
        easy.setTitleColor(UIColor.systemBlue, for: UIControl.State.normal)
        normal.setTitleColor(UIColor.black, for: UIControl.State.normal)
        hard.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    
    //normal button tapped. set difficulity to normal.
    @IBAction func setNormalInterval(_ sender: UIButton) {
        interval = 1.5
        tolerance = 0.3
        easy.setTitleColor(UIColor.black, for: UIControl.State.normal)
        normal.setTitleColor(UIColor.systemBlue, for: UIControl.State.normal)
        hard.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    
    //hard button tapped. set difficulity to hard.
    @IBAction func setHardInterval(_ sender: Any) {
        interval = 1.0
        tolerance = 0.3
        easy.setTitleColor(UIColor.black, for: UIControl.State.normal)
        normal.setTitleColor(UIColor.black, for: UIControl.State.normal)
        hard.setTitleColor(UIColor.systemBlue, for: UIControl.State.normal)
    }
}



