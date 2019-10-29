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


let circleCenter = CGPoint(x: 600,y:600)
let circleWidth = CGFloat(100)
let circleHeight = circleWidth
let circleView = CircleView(frame: CGRect(x: circleCenter.x, y: circleCenter.y, width: circleWidth, height: circleHeight))

var frameView = CircleView(frame: CGRect(x: circleCenter.x, y: circleCenter.y, width: circleWidth, height: circleHeight))




func pulse() {
    UIView.animate(withDuration: 0.5, animations:{
        circleView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }, completion: { _ in
        UIView.animate(withDuration: 0.5, animations: {
            circleView.transform = .identity
        })
    })
}



class MetronomeGame: UIViewController
{
    var audioPlayer: AVAudioPlayer!
    var tapCount:Int = 0
    var str = "0"
    var isWait:Bool = false
    /*
    let path = Bundle.main.url(forResource: "metroNomeSound", withExtension: "mp3")!
    let url = URL(fileURLWithPath: path)
    //audioPlayer =  AVAudioPlayer(contentsOf: soundURL)
    audioPlayer.play()
    */
    @IBOutlet weak var tapAndwait: UILabel!
    @IBOutlet weak var tap: UIButton!
    @IBOutlet weak var count: UILabel!
    //MARK: Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(circleView)
        //frameView.tintColor = UIColor.black
        //view.addSubview(frameView)
    }
    
    @IBAction func TAP(_ sender: UIButton) {
        if(tapCount == 0)
        {
            //label.text = "tapCount == 0"
            tap.setTitle("TAP!", for: .normal)
            audioPlayer?.play()
            //isWait = false
        }
        else if(!isWait)
        {
            count.text = String(tapCount)
            //pulse()
            tap.setTitle("WAIT", for: .normal)
            //isWait = true
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
