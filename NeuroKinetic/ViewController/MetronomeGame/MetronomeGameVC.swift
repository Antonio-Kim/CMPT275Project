//
//  MetronomeGame.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/23/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit
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
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tap: UIButton!
    //TAP buttons
    @IBOutlet weak var left: UIButton!
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var soundNote: UIImageView!
    
    
    
    //MARK: Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        
                let button = UIButton()
        button.frame = CGRect(x: 10, y:100, width:100,height:100)
        
        self.view.addSubview(button)
        
        setupButtonStyle(button: left, color: UIColor.red)
        setupButtonStyle(button: right, color: UIColor.red)
 
        let sound = Bundle.main.path(forResource:"metronomeSound", ofType: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }
       

    }
    
    
    @IBAction func TAP(_ sender: UIButton) {
        //start
        if(tapCount == 0)
        {
            
            UIView.animate(withDuration: 2)
            {
                self.soundNote.frame.origin.x = self.right.frame.origin.x
                
            }
            UIView.animate(withDuration: 2)
            {
                self.soundNote.frame.origin.x = self.left.frame.origin.x
                
            }
            tap.setTitle("TAP!", for: .normal)
            audioPlayer.play()
            //isWait = false
        }
        //while playing
        else if(!isWait)
        {
            label.text = String(tapCount)
            //pulse()
            tap.setTitle("WAIT", for: .normal)
            let seconds = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.tap.setTitle("TAP!", for: .normal)
            }
        }
        tapCount = tapCount + 1
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
