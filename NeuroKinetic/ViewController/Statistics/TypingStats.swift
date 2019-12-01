//
//  TypingStats.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/28/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class TypingStats: UIViewController {
    
    
    @IBOutlet weak var typingChartView: TypingChartView!
    
    @IBOutlet weak var WPMLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typingChartView.setBarsValues(typingArr: TypingGame.typing_statistics.typing_wpm_array)
        
        calculate_average_wpm()
        calculate_average_accuracy()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        typingChartView.play()
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
        
        WPMLabel.text = "WPM: " + "\(average_wpm)"
        
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
        
        accuracyLabel.text = "Accuracy: " + "\(average_accuracy)" + " %"
        
        print("Typing Accuracy")
        print(average_accuracy)
    }
    
}
