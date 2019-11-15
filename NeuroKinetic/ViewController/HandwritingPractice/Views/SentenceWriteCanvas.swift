//
//  SentenceWriteCanvas.swift
//  NeuroKinetic
//
//  Created by yyonata on 10/29/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit
import AVFoundation

class SentenceWriteCanvas: UIView {
    
    //Variable declarations
    var StartingPoint:CGPoint!
    var TouchPoint: CGPoint!
    var Path: UIBezierPath!
    var lineColor: UIColor!
    var lineWidth: CGFloat!
    var isErase: Bool = false
    var lineStrokes = [intmax_t]()
    var lineLength = 0
    var strokeCounter = 0
    
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
        lineLength = 0
    }
    
    //Detecting written input movement from the pen
    override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first
        lineLength = lineLength + 1
        TouchPoint = touch?.location(in: self)
        Path = UIBezierPath()
        Path.move(to: StartingPoint)
        Path.addLine(to: TouchPoint)
        StartingPoint=TouchPoint
        drawShapeLayer()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //checking the end of a line stroke, reinitializing variables
        lineStrokes.append(lineLength)
        strokeCounter = strokeCounter + 1
        lineLength = 0
    }
    
    //Setting the shape layers for writing
    func drawShapeLayer(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = lineWidth
        lineColor = UIColor.black
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.path = Path.cgPath
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
    //Clear function implementation to remove all written input from the canvas
    func clear(){
        strokeCounter = 0
        if self.layer.sublayers == nil {
            return
        }
        Path.removeAllPoints()
        lineStrokes.removeAll()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }
    
    func undo(){
        guard let n = layer.sublayers?.count, n >= 1 else { return }
        //repeatedly popping the layers of writing to undo the last stroke
        if (lineStrokes.count - 1 >= 0){
            for _ in 1...lineStrokes[lineStrokes.count - 1]{
                _ = layer.sublayers?.popLast()
            }
            lineStrokes.remove(at: lineStrokes.count - 1)
            self.setNeedsDisplay()
            strokeCounter = strokeCounter - 1
            //To avoid undoing past 0 lineStrokes
            if (strokeCounter < 0){
                strokeCounter = 0
            }
        }
    }
}
