//
//  GeneralStats.swift
//  NeuroKinetic
//
//  Created by Rico Chao on 2019-12-02.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import Foundation
import UIKit

class GeneralStats: UIViewController {
    
    @IBOutlet weak var metronomeGPLabel: UILabel!
    
    @IBOutlet weak var handwritingGPLabel: UILabel!
    
    @IBOutlet weak var typingGPLabel: UILabel!
    
    //Variable declarations
    let preferences = UserDefaults.standard
    var metronomeGamesPlayed: Int = 0
    var handwritingGamesPlayed: Int = 0
    var typingGamesPlayed: Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        grabGamesPlayedData()
        
        metronomeGPLabel.text = "Games Played: " + "\(metronomeGamesPlayed)"
        
        handwritingGPLabel.text = "Games Played: " + "\(handwritingGamesPlayed)"
        
        typingGPLabel.text = "Games Played: " + "\(typingGamesPlayed)"
        
    }
    
    func grabGamesPlayedData() {
        //Grabs the gamesPlayed from the metronome stored preference
        if preferences.object(forKey: "TotalMetronomeGamesPlayed") == nil {
            //  Key does not exist, just do not do anything
        } else {
            metronomeGamesPlayed = preferences.integer(forKey: "TotalMetronomeGamesPlayed")
        }
        
        if preferences.object(forKey: "TotalHandwritingGamesPlayed") == nil {
            //  Key does not exist, just do not do anything
        } else {
            handwritingGamesPlayed = preferences.integer(forKey: "TotalHandwritingGamesPlayed")
        }
        
        if preferences.object(forKey: "TotalTypingGamesPlayed") == nil {
            //  Key does not exist, just do not do anything
        } else {
            typingGamesPlayed = preferences.integer(forKey: "TotalTypingGamesPlayed")
        }
    }
}

