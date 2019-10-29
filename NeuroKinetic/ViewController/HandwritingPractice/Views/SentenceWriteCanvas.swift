//
//  SentenceWriteCanvas.swift
//  NeuroKinetic
//
//  Created by yyonata on 10/29/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class SentenceWriteCanvas: UIView {
    var StartingPoint:CGPoint!
    var TouchPoint: CGPoint!
    var Path: UIBezierPath!
    var lineColor: UIColor!

    
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
        
        lineColor = UIColor.black
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        StartingPoint = touch?.location(in: self)
    }
    
    override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first
        TouchPoint = touch?.location(in: self)
        Path = UIBezierPath()
        Path.move(to: StartingPoint)
        Path.addLine(to: TouchPoint)
        StartingPoint=TouchPoint
        
        drawShapeLayer()
    }
    
    func drawShapeLayer(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = Path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
}
