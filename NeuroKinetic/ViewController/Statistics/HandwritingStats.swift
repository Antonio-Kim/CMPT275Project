//
//  HandwritingStats.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/28/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit
import FirebaseDatabase
class HandwritingStats: UIViewController {
    var ref = Database.database().reference()
    let preferences = UserDefaults.standard
    var gamesPlayed: Int = 0
    
    struct handwriting_statistics{
         static var handwriting_amplitude_array: [Float] = []
     }
    
    @IBOutlet weak var handwritingChartView: HandwritingChartView!
    
    @IBOutlet weak var amplitudeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handwritingChartView.createSceneForStats()
        database_read()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.calculate_average_amplitude()
            self.handwritingChartView.setBarsValues(handwritingArr: handwriting_statistics.handwriting_amplitude_array)
        }
        
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.handwritingChartView.play()
        }
        
    }
    
    func database_read() {
           
           let gameFinishTime :Date = Date()
           let calendar = Calendar.current
           let year:Int = calendar.component(.year, from:gameFinishTime)
           let month:Int = calendar.component(.month, from:gameFinishTime)
           let day:Int = calendar.component(.day, from:gameFinishTime)
           
           //Grabs the gamesPlayed from the stored preference
           if preferences.object(forKey: "TotalHandwritingGamesPlayed") == nil {
               //  Doesn't exist
           } else {
               gamesPlayed = preferences.integer(forKey: "TotalHandwritingGamesPlayed")
           }
           
           if(gamesPlayed >= 7)
           {
            handwriting_statistics.handwriting_amplitude_array.removeAll()
               for n in ((gamesPlayed)-6)...gamesPlayed {
               ref.child("Handwriting/\(year)-\(month)-\(day)").child("Game: \(n)").observeSingleEvent(of: .value, with: { (snapshot) in
                   if(snapshot.exists())
                   {
                   for child in snapshot.children {
                       let snap = child as! DataSnapshot
                       let key = snap.key
                       let value = snap.value
                       if(key == "AmplitudeDifference")
                       {
                           var score = (value as? Float)!
                            handwriting_statistics.handwriting_amplitude_array.append(score)
                       }
                   }
               }
                   else
                   {
                    handwriting_statistics.handwriting_amplitude_array.append(0)
                   }
               })
               }
           }
           else
           {
               handwriting_statistics.handwriting_amplitude_array.removeAll()
               for n in 1...7 {
               ref.child("Handwriting/\(year)-\(month)-\(day)").child("Game: \(n)").observeSingleEvent(of: .value, with: { (snapshot) in
                   if(snapshot.exists())
                   {
                   for child in snapshot.children {
                       let snap = child as! DataSnapshot
                       let key = snap.key
                       let value = snap.value
                       if(key == "AmplitudeDifference")
                       {
                           let score = (value as? Float)!
                        handwriting_statistics.handwriting_amplitude_array.append(score)
                       }
                   }
               }
                   else
                   {
                    handwriting_statistics.handwriting_amplitude_array.append(0)
                   }
               })
               }
           }
       }
    func calculate_average_amplitude() {
        var sum: Float = 0
        var average_amplitude: Float = 0
        var non_zero_vals: Float = 0
        for(element) in (handwriting_statistics.handwriting_amplitude_array)
        {
            if(element != 0)
            {
                sum += element
                non_zero_vals += 1
            }
        }
        if(non_zero_vals == 0)
        {
            average_amplitude = 0
        }
        else
        {
            average_amplitude = sum / non_zero_vals

        }
        
        amplitudeLabel.text = "Average Amplitude: " + String(format: "%.2f", average_amplitude)
        
    }
}
