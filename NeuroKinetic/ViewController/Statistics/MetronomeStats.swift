//
//  MetronomeStats.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/20/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class MetronomeStats: UIViewController {

    
    @IBOutlet weak var metronomeChartView: MetronomeChartView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        metronomeChartView.setBarsValues(metronomeArr: MetronomeGame.metronome_statistics.average_metronome_score)
        
        calculate_average_score()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        metronomeChartView.play()
    }
    
    func calculate_average_score() {
        var sum: Int = 0
        var average_score: Int = 0
        var non_zero_vals: Int = 0
        for(element) in (MetronomeGame.metronome_statistics.average_metronome_score)
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
        
        print("Metronome Score Avg:")
        print(average_score)
    }

}

