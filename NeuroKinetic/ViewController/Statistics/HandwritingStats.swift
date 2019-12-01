//
//  HandwritingStats.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/28/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class HandwritingStats: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculate_average_amplitude()
    }
    
    func calculate_average_amplitude() {
        var sum: Float = 0
        var average_amplitude: Float = 0
        var non_zero_vals: Float = 0
        for(element) in (AfterSignVC.handwriting_statistics.handwriting_amplitude_array)
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
        print("Handwriting Ampltiude Avg:")
        print(average_amplitude)
    }
}
