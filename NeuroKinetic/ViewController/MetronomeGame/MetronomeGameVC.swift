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

class MetronomeGame: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var tapCount:Int = 0;
    var didStart: Bool = false
    var isGameOver: Bool = false
    
    //timers
    var startTime:Date = Date.init()
    var tapTime: Double = 0.0
    
    //start button and tap count
    @IBOutlet weak var tap: UIButton!
    @IBOutlet weak var message: UILabel!
    
    //TAP buttons
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var left: UIButton!
    
    //soundNote
    @IBOutlet weak var soundNote: UIImageView!
    
    //returns the expected timing button is tapped
    func expectedTime(isLeft: Bool) ->Double
    {
        let isOdd = tapCount%2
        
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
    
    //sound note moves to the right tap button
    func moveRight()
    {
        UIView.animate(withDuration: 2,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {
                        self.soundNote.frame.origin.x = self.right.frame.origin.x
                       } ,
                       completion:{
                        finished in
                        self.tapCount += 1
                        self.audioPlayer.play()
                        self.moveLeft()
                       })
    }
    //sound note moves to the left tap button
    func moveLeft()
    {
        UIView.animate(withDuration: 2,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {
                        self.soundNote.frame.origin.x = self.left.frame.origin.x
        } ,
                       completion:{
                        finished in
                        self.tapCount += 1
                        self.audioPlayer.play()
                        if(!(self.tapCount>=19))
                        {
                            self.moveRight()
                        }
                        else
                        {
                            self.message.text = "GAME OVER"
                            self.isGameOver = true
                            self.animateFinish()
                        }
        })
    }
    
    //start button disappears
    func startDisappear()
    {
        UIView.animate(withDuration: 2,
                       animations:{self.tap.alpha = 0} )
        self.tap.removeFromSuperview()
    }
    
    //animation executed at the end of the game
    func animateFinish()
    {
        self.tap.setTitle("DONE", for: .normal)
        UIView.animate(withDuration: 3,
                       animations:{
                        self.tap.alpha = 1
                        self.right.alpha = 0
                        self.left.alpha = 0
                        self.soundNote.alpha = 0
                        self.message.alpha = 0
                        
        } )
    }
    
    
    //MARK: Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //bring image to the front
        view.addSubview(soundNote)
        
        //Game Menu View Controller
        
        
        //initialize sound file
        let sound = Bundle.main.path(forResource:"metronomeSound(2)", ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }
        
    }
    
    //starts the game
    @IBAction func TAP(_ sender: UIButton) {
        //starting game
        if(!didStart)
        {
            startTime = Date.init()
            UIView.animate(withDuration: 2, animations:{self.tap.alpha = 0} )
            moveRight()
            startTime = Date.init()
            didStart = true
        }
        if(isGameOver)
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "GameMenu")
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    //tap buttons
    @IBAction func tapRight(_ sender: UIButton) {
        if(didStart && !isGameOver)
        {
            let tempTime: Date = Date.init()
            tapTime = tempTime.timeIntervalSince(startTime)
            var difference = tapTime - expectedTime(isLeft: true)
            
            
            if(difference<0)
            {
                difference *= (-1)
            }
            
            if(difference>0.5 || difference < -0.5)
            {
                message.alpha = 1
                message.text = "Miss(RIGHT)"
                UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
            else
            {
                message.alpha = 1
                message.text = "Good Tap(RIGHT)"
                UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
        }
    }
    
    @IBAction func tapLeft(_ sender: UIButton) {
        if(didStart && !isGameOver)
        {
            let tempTime: Date = Date.init()
            tapTime = tempTime.timeIntervalSince(startTime)
            var difference = tapTime - expectedTime(isLeft: false)
            if(difference<0)
            {
                difference *= (-1)
            }
            if(difference>0.5)
            {
                message.alpha = 1
                message.text = "Miss(LEFT)"
                UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
            else
            {
                message.alpha = 1
                message.text = "Good Tap(LEFT)"
                UIView.animate(withDuration: 1, animations: {self.message.alpha = 0}, completion: {finished in})
            }
        }
    }
    
}
