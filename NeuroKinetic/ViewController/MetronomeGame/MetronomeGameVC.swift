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




func setupButtonStyle(button : UIButton, color: UIColor){
    // Customizing Menu Button Style
    button.layer.cornerRadius = 0.5 * button.bounds.size.width
    button.clipsToBounds = true
    button.backgroundColor = color
}


class MetronomeGame: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var tapCount:Int = 0;
    var str = "0"
    var isWait:Bool = false
    var didStart: Bool = false
    var isGameOver: Bool = false
    
    
    //let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    
    
    //timers
    var startTime:Date = Date.init()
    var tapTime: Double = 0.0
    
    //start button and tap count
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tap: UIButton!
    @IBOutlet weak var message: UILabel!
    
    //TAP buttons
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var left: UIButton!
    
    
    @IBOutlet weak var soundNote: UIImageView!
    
    func expectedTime(isRight: Bool) ->Double
    {
            return Double(tapCount*2+2)
    }
    
    //sound note moves to the right tap button
    func moveRight()
    {
        //
        UIView.animate(withDuration: 2,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {
                        //if(self.didStart == false)
                        //{
                        //    self.tap.alpha = 0
                        //    self.didStart = true
                        //}
                        self.soundNote.frame.origin.x = self.right.frame.origin.x + 100
                        
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
                        //if(self.didStart == false)
                        //{
                        //    self.tap.alpha = 0
                        //    self.didStart = true
                        //}
                        self.soundNote.frame.origin.x = self.left.frame.origin.x + 100
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
                        self.label.alpha = 0
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
            //startTime = Date.init()
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
            var difference = tapTime - expectedTime(isRight: false)
            
            
            if(difference > 2.0)
            {
                difference -= 2.0
            }
            label.text = String(difference)
            if(difference>0.5)
            {
                message.text = "Not Good"
            }
            else
            {
                message.text = "Good"
            }
        }
    }
    
    @IBAction func tapLeft(_ sender: UIButton) {
        if(didStart && !isGameOver)
        {
            let tempTime: Date = Date.init()
            tapTime = tempTime.timeIntervalSince(startTime)
            var difference = tapTime - expectedTime(isRight: false)
            
            
            if(difference > 2.0)
            {
                difference -= 2.0
            }
            label.text = String(difference)
            if(difference>0.5)
            {
                message.text = "Not Good"
            }
            else
            {
                message.text = "Good"
            }
        }
    }

}
