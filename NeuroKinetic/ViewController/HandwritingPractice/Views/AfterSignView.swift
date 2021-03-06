//
//  AfterSignView.swift
//  NeuroKinetic
//
//  Created by yyonata on 2019-11-21.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class AfterSignView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    //Variable declarations
    var StartingPoint:CGPoint!
    var TouchPoint: CGPoint!
    var Path: UIBezierPath!
    var lineColor: UIColor!
    var lineWidth: CGFloat!
    var yCoordinates = [Float]()
    
    //Setting the canvas and line color/width
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
        self.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "signatureline.png"))
        lineColor = UIColor.black
        lineWidth = 5
    }
    
    //Detecting the first touch input for writing from the pen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        StartingPoint = touch?.location(in: self)
        if (Int(StartingPoint.y) < 0){
            yCoordinates.append(0.0)
        }
        else if(Int(StartingPoint.y) > 230){
            yCoordinates.append(230.0)
        }
        else{
            yCoordinates.append(Float32(StartingPoint.y))
        }
    }
    
    //Detecting written input movement from the pen
    override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first
        TouchPoint = touch?.location(in: self)
        if (Int(TouchPoint.y) < 0){
            yCoordinates.append(0.0)
        }
        else if(Int(TouchPoint.y) > 230){
            yCoordinates.append(230.0)
        }
        else{
            yCoordinates.append(Float32(TouchPoint.y))
        }
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
        //calculateAmplitude()
        
        if self.layer.sublayers == nil {
            return
        }
        yCoordinates.removeAll()
        Path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }
    //amplitude calculation for version 3
    func calculateAmplitude() -> CGFloat {
        if (yCoordinates.isEmpty){
            return 0.0
        }
        let ampl2: CGFloat = CGFloat(yCoordinates.min()!.distance(to: yCoordinates.max()!))
        return ampl2
    }
}
