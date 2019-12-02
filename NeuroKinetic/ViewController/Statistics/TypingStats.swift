//
//  TypingStats.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/28/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TypingStats: UIViewController {
    
    //UserDefault preference storing
    let preferences = UserDefaults.standard
    
    var ref = Database.database().reference()
    
    var gamesPlayed: Int = 0
    
    struct typing_statistics{
        static var typing_wpm_array: [Int] = [] //Array for the wpm values
        static var typing_accuracy_array: [Int] = []    //Array for the accuracy values
    }
    
    
    @IBOutlet weak var typingChartView: TypingChartView!
    
    @IBOutlet weak var WPMLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typingChartView.createSceneForStats()
        database_read()
        
        //Specifying a delay for the bar graph values
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.calculate_average_wpm()
            self.calculate_average_accuracy()
            self.typingChartView.setBarsValues(typingArr: typing_statistics.typing_wpm_array)
        }
        
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.typingChartView.play()
        }
    
    }
    
    func database_read() {
        
        //Date variable declarations
        let gameFinishTime :Date = Date()
        let calendar = Calendar.current
        let year:Int = calendar.component(.year, from:gameFinishTime)
        let month:Int = calendar.component(.month, from:gameFinishTime)
        let day:Int = calendar.component(.day, from:gameFinishTime)
        
        //Grabs the gamesPlayed from the stored preference
        if preferences.object(forKey: "TotalTypingGamesPlayed") == nil {
            //  Doesn't exist
        } else {
            gamesPlayed = preferences.integer(forKey: "TotalTypingGamesPlayed")
        }
        
        if(gamesPlayed >= 7)
        {
            typing_statistics.typing_accuracy_array.removeAll()
            typing_statistics.typing_wpm_array.removeAll()
            //Looping through and reading from the database
            for n in ((gamesPlayed)-6)...gamesPlayed {
            ref.child("TypingGame/\(year)-\(month)-\(day)").child("Game: \(n)").observeSingleEvent(of: .value, with: { (snapshot) in
                if(snapshot.exists())
                {
                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    let key = snap.key
                    let value = snap.value
                    //Checking if the key in the database corresponds to the WPM
                    if(key == "WPM")
                    {
                        var score = (value as? Int)!
                       typing_statistics.typing_wpm_array.append(score) //Storing the WPM value
                    }
                    //Checking if the key in the database corresponds to the Accuracy
                    if(key == "Accuracy")
                    {
                        var temp = (value as? Int)!
                        typing_statistics.typing_accuracy_array.append(temp)    //Storing the accuracy value
                    }
                }
            }
                else
                {
                    typing_statistics.typing_wpm_array.append(0)    //Will add a zero if no entry was found
                }
            })
            }
        }
        else
        {
            typing_statistics.typing_accuracy_array.removeAll()
            typing_statistics.typing_wpm_array.removeAll()
            //Looping through and reading from the database
            for n in 1...7 {
            ref.child("TypingGame/\(year)-\(month)-\(day)").child("Game: \(n)").observeSingleEvent(of: .value, with: { (snapshot) in
                if(snapshot.exists())
                {
                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    let key = snap.key
                    let value = snap.value
                    //Checking if the key in the database corresponds to the WPM
                    if(key == "WPM")
                    {
                        let score = (value as? Int)!
                        typing_statistics.typing_wpm_array.append(score)    //Storing the WPM value
                    }
                    //Checking if the key in the database corresponds to the Accuracy
                    if(key == "Accuracy")
                    {
                        let temp = (value as? Int)!
                        typing_statistics.typing_accuracy_array.append(temp)    //Storing the accuracy value
                    }
                }
            }
                else
                {
                    typing_statistics.typing_wpm_array.append(0)    //Will add a zero if no entry was found
                }
            })
            }
        }
    }
    
    //This function will calculate the average wpm and store it in WPMLabel to display to the user
    func calculate_average_wpm() {
        var sum: Int = 0
        var average_wpm: Int = 0
        var non_zero_vals: Int = 0
        for(element) in (typing_statistics.typing_wpm_array)
        {
            if(element != 0)
            {
                sum += element
                non_zero_vals += 1
            }
        }
        if(non_zero_vals == 0)
        {
            average_wpm = 0
        }
        else
        {
            average_wpm = sum / non_zero_vals
        }
        
        WPMLabel.text = "Average WPM: " + "\(average_wpm)" //Storing the average wpm in the label
    }
    
    //This function will calculate the average accuracy and store it in accuracyLabel to display to the user
    func calculate_average_accuracy()  {
        var sum: Int = 0
        var average_accuracy: Int = 0
        var non_zero_vals: Int = 0
        for(element) in (typing_statistics.typing_accuracy_array)
        {
            if(element != 0)
            {
                sum += element
                non_zero_vals += 1
            }
        }
        if(non_zero_vals == 0)
        {
            average_accuracy = 0
        }
        else
        {
            average_accuracy = sum / non_zero_vals
        }
        
        accuracyLabel.text = "Average Accuracy: " + "\(average_accuracy)" + " %" //Storing the average accuracy in the label
    }
    
}

