//
//  SentenceWriteCanvas.swift
//  NeuroKinetic
//
//  Created by yyonata on 10/29/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class SentenceWriteCanvas: UIView {
    
    //Variable declarations
    var StartingPoint:CGPoint!
    var TouchPoint: CGPoint!
    var Path: UIBezierPath!
    var lineColor: UIColor!
    var lineWidth: CGFloat!
    
    //Setting the canvas and line color/width
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
        self.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "lines.jpg"))
        lineColor = UIColor.black
        lineWidth = 5
    }
    
    //Detecting the first touch input for writing from the pen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        StartingPoint = touch?.location(in: self)
    }
    
    //Detecting written input movement from the pen
    override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first
        TouchPoint = touch?.location(in: self)
        Path = UIBezierPath()
        Path.move(to: StartingPoint)
        Path.addLine(to: TouchPoint)
        StartingPoint=TouchPoint
        
        drawShapeLayer()
    }
    
    //Setting the shape layers for writing
    func drawShapeLayer(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = Path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
    //Clear function implementation to remove all written input from the canvas
    func clear(){
        if self.layer.sublayers == nil {
            return
        }
        Path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }
}




