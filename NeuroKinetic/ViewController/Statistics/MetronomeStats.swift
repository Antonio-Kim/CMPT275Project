//
//  MetronomeStats.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/20/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MetronomeStats: UIViewController {
    var ref = Database.database().reference()
    var gamesPlayed: Int = 0
    let preferences = UserDefaults.standard
    
    struct metronome_statistics {
        static var average_metronome_score: [Int] = []
    }
    
    @IBOutlet weak var metronomeChartView: MetronomeChartView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        metronomeChartView.createSceneForStats()
        database_read()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.calculate_average_score()
            self.metronomeChartView.setBarsValues(metronomeArr: metronome_statistics.average_metronome_score)
        }
        
        
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.metronomeChartView.play()
        }
    }
    
    func calculate_average_score() {
        var sum: Int = 0
        var average_score: Int = 0
        var non_zero_vals: Int = 0
        for(element) in (metronome_statistics.average_metronome_score)
        {
            if(element != 0)
            {
                sum += element
                non_zero_vals += 1
            }
        }
        if(non_zero_vals == 0)
        {
            average_score = 0
        }
        else
        {
            average_score = sum / non_zero_vals
        }
        scoreLabel.text = "Score: " + "\(average_score)"
    }
    
    func database_read() {
        
        let gameFinishTime :Date = Date()
        let calendar = Calendar.current
        let year:Int = calendar.component(.year, from:gameFinishTime)
        let month:Int = calendar.component(.month, from:gameFinishTime)
        let day:Int = calendar.component(.day, from:gameFinishTime)
        
        if preferences.object(forKey: "TotalMetronomeGamesPlayed") == nil {
            //  Doesn't exist
        } else {
            gamesPlayed = preferences.integer(forKey: "TotalMetronomeGamesPlayed")
        }
        
        if(gamesPlayed >= 7)
        {
            metronome_statistics.average_metronome_score.removeAll()
            for n in ((gamesPlayed)-6)...gamesPlayed {
            ref.child("Metronome/\(year)-\(month)-\(day)").child("Game: \(n)").observeSingleEvent(of: .value, with: { (snapshot) in
                if(snapshot.exists())
                {
                    for child in snapshot.children {
                        let snap = child as! DataSnapshot
                        let key = snap.key
                        let value = snap.value
                        if(key == "Score")
                        {
                            var score = (value as? Int)!
                            metronome_statistics.average_metronome_score.append(score)
                        }
                    }
                }
                else
                {
                    metronome_statistics.average_metronome_score.append(0)
                }
            })
            }
        }
        else
        {
            metronome_statistics.average_metronome_score.removeAll()
            for n in 1...7{
            ref.child("Metronome/\(year)-\(month)-\(day)").child("Game: \(n)").observeSingleEvent(of: .value, with: { (snapshot) in
                if(snapshot.exists())
                {
                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    let key = snap.key
                    let value = snap.value
                    if(key == "Score")
                    {
                        var score = (value as? Int)!
                        metronome_statistics.average_metronome_score.append(score)
                    }
                }
            }
                else
                {
                    metronome_statistics.average_metronome_score.append(0)
                }
            })
            }
        }
    }

}

