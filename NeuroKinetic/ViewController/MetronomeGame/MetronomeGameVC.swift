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


/*
let timer = Timer.scheduledTimer(TimeInterval: 1, target: self, Selector: #selector(update), userInfo: nil, repeats: true)
*/

/*
let circleCenter = CGPoint(x: 600,y:600)
let circleWidth = CGFloat(100)
let circleHeight = circleWidth
let circleView = CircleView(frame: CGRect(x: circleCenter.x, y: circleCenter.y, width: circleWidth, height: circleHeight))

var frameView = CircleView(frame: CGRect(x: circleCenter.x, y: circleCenter.y, width: circleWidth, height: circleHeight))
*/


/*
func pulse() {
    UIView.animate(withDuration: 0.5, animations:{
        circleView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }, completion: { _ in
        UIView.animate(withDuration: 0.5, animations: {
            circleView.transform = .identity
        })
    })
}
*/

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
                        self.moveRight()
        })
    }
    
    //start button disappears
    func startDisappear()
    {
        UIView.animate(withDuration: 2,
                       animations:{self.tap.alpha = 0} )
        self.tap.removeFromSuperview()
    }
    
    
    
    //MARK: Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //bring image to the front
        view.addSubview(soundNote)
        
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
    }
    
    //tap buttons
    @IBAction func tapRight(_ sender: UIButton) {
        if(didStart)
        {
            let tempTime: Date = Date.init()
            tapTime = tempTime.timeIntervalSince(startTime)
            let difference = tapTime - expectedTime(isRight: false)
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
        if(didStart)
        {
            let tempTime: Date = Date.init()
            tapTime = tempTime.timeIntervalSince(startTime)
            let difference = tapTime - expectedTime(isRight: false)
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
