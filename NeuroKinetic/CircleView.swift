//
//  CircleView.swift
//  NeuroKinetic
//
//  Created by nmaeda on 10/26/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class CircleView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect)
    {
        //Get the graphics context
        if let context = UIGraphicsGetCurrentContext() {
            context.setLineWidth(5.0);
            UIColor.red.set()
            let center = CGPoint(x: frame.size.width/2, y:frame.size.height/2)
            let radius = (frame.size.width-10)/2
            context.addArc(center: center, radius: radius, startAngle: 0.0,endAngle: .pi * 2.0, clockwise: true)
            context.strokePath()
        }
    }
    
    
  
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
