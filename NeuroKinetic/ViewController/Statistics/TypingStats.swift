//
//  TypingStats.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/28/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class TypingStats: UIViewController {
    
    @IBOutlet weak var WPM: UILabel!
    @IBOutlet weak var Database: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        calculate_average_wpm()
        calculate_average_accuracy()
    }
    
    func calculate_average_wpm() {
        var sum: Int = 0
        var average_wpm: Int = 0
        var non_zero_vals: Int = 0
        for(element) in (TypingGame.typing_statistics.typing_wpm_array)
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
        print("Average WPM")
        print(average_wpm)
    }
    
    func calculate_average_accuracy()  {
        var sum: Int = 0
        var average_accuracy: Int = 0
        var non_zero_vals: Int = 0
        for(element) in (TypingGame.typing_statistics.typing_accuracy_array)
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
        print("Typing Accuracy")
        print(average_accuracy)
    }
    
}
