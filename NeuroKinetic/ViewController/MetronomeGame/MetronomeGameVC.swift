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


//This UIViewController class is for metronome game
class MetronomeGame: UIViewController {
    
    //MP3 Initialization for metronome sound
    var audioPlayer = AVAudioPlayer()
    //Varible Initialization
    var tapCount:Int = 0;
    var didStart: Bool = false
    var isGameOver: Bool = false
    
    //Timer Initialization
    var startTime:Date = Date.init()
    var tapTime: Double = 0.0
    
    //Start button and Message label
    @IBOutlet weak var tap: UIButton!
    @IBOutlet weak var message: UILabel!
    
    //TAP right and left button
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var left: UIButton!
    
    //Music Note Image
    @IBOutlet weak var soundNote: UIImageView!
    
    //Returns the expected timing button is supposed to be tapped depending on the tap count and which button is being pressed
    func expectedTime(isLeft: Bool) ->Double
    {
        let isOdd = tapCount%2
        //If left button is tapped
        if(isLeft)
        {
            if(isOdd == 0)
            {
                return Double(tapCount*2)
            }
            else
            {
                
                return Double(2*(tapCount+1))
            }
        }
        //If right button is tapped
        else
        {
            if(isOdd == 1)
            {
                return Double(tapCount*2)
            }
            else
            {
                return Double(2*(tapCount+1))
            }
        }
    }
    
    //Animation for music note: Right movement
    func moveRight()
    {
        UIView.animate(withDuration: 2,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {self.soundNote.frame.origin.x = self.right.frame.origin.x } ,
                       completion:{
                        finished in
                        self.tapCount += 1
                        //Metronome Sound
                        self.audioPlayer.play()
                        //Chain animation. Start moving to the left.
                        self.moveLeft()
        })
    }
    //Animation for music note: Left movement
    func moveLeft()
    {
        //The music note will move towards the left button linearly over two seconds
        UIView.animate(withDuration: 2, delay: 0.0, options: .curveLinear,
                       animations: { self.soundNote.frame.origin.x = self.left.frame.origin.x} ,
                       //After animation is completed below statements are executed
            completion:{
                finished in
                self.tapCount += 1
                //Metronome Sound
                self.audioPlayer.play()
                //If tap count is less than or equal to 19, continue the game
                if(!(self.tapCount>=10))
                {
                    ////Chain animation. Start moving to the right.
                    self.moveRight()
                }
                    //If tap count is bigger than or equal to 19, finish the game displaying "GAME OVER"
                    //And fade out all the buttons
                else
                {
                    self.message.text = "GAME OVER"
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
        //Display "DONE". Fade out all the other buttons and labels.
        UIView.animate(withDuration: 3,
                       animations:{
                        self.tap.alpha = 1
                        self.right.alpha = 0
                        self.left.alpha = 0
                        self.soundNote.alpha = 0
                        self.message.alpha = 0
                        
        } )
    }
    
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Bringing image to the front
        view.addSubview(soundNote)
        
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
            startTime = Date.init()
            //Fade out start button
            UIView.animate(withDuration: 2, animations:{self.tap.alpha = 0} )
            moveRight()
            startTime = Date.init()
            didStart = true
        }
        //Navigating to the menu, if the game is finished
        if(isGameOver)
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "GameMenu")
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    //
    @IBAction func tapRight(_ sender: UIButton) {
        //The button functions if and only if the game has started and hasn't finished yet
        if(didStart && !isGameOver)
        {
            //Take the user tap time
            let tempTime: Date = Date.init()
            tapTime = tempTime.timeIntervalSince(startTime)
            
            //Take a difference between user tap time and expected timing
            var difference = tapTime - expectedTime(isLeft: false)
            
            //If the difference is negative, convert it to positive
            if(difference<0)
            {
                difference *= (-1)
            }
            
            //Display "Miss" or "Good Tap" depending on user's timing and expected time difference
            if(difference>0.5)
            {
                //Display "Miss"
                message.text = "Miss"
                message.alpha = 1
                //Fade out "Miss" with animation
                UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
            else
            {
                //Display "Good Tap"
                message.text = "Good Tap"
                message.alpha = 1
                //Fade out "Good" with animation
                UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
        }
    }
    
    @IBAction func tapLeft(_ sender: UIButton) {
        //The button functions if and only if the game has started and hasn't finished yet
        if(didStart && !isGameOver)
        {
            //Take the user tap time
            let tempTime: Date = Date.init()
            tapTime = tempTime.timeIntervalSince(startTime)
            
            //Take a difference between user tap time and expected timing
            var difference = tapTime - expectedTime(isLeft: true)
            //If the difference is negative, convert it to positive
            if(difference<0)
            {
                difference *= (-1)
            }
            
            //Display "Miss" or "Good Tap" depending on user's timing and expected time difference
            if(difference>0.5)
            {
                //Display "Miss"
                message.text = "Miss"
                message.alpha = 1
                //Fade out "Miss" with animation
                UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
            else
            {
                //Display "Good Tap"
                message.text = "Good Tap"
                message.alpha = 1
                //Fade out "Good" with animation
                UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
        }
    }
    
}


