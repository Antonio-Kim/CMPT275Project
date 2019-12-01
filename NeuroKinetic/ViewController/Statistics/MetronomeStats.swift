//
//  MetronomeStats.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/20/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class MetronomeStats: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        calculate_average_score()
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
        print("Metronome Score Avg:")
        print(average_score)
    }

}

