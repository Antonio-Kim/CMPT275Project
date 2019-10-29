//
//  HandwritingPracticeVC.swift
//  NeuroKinetic
//
//  Created by yyonata on 10/24/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import UIKit

class Canvas: UIView{
    override func draw( _ rect: CGRect){
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else{return}
        
        context.setLineWidth(5)
        
        lines.forEach{ (line) in
            for (i,p) in line.enumerated(){
                if i == 0{
                    context.move(to:p)
                }
                else{
                    context.addLine(to: p)
                }
            }
        }
        
        context.strokePath()
    }
    
    //var line = [CGPoint]()
    var lines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent?){
        guard let point = touches.first?.location(in:nil)else {return}
        guard var lastLine = lines.popLast() else{return}
        lastLine.append(point)
        lines.append(lastLine)
        
        //lines.append(point)
        setNeedsDisplay()
    }
}

class HandwritingPractice: UIViewController {
    
    let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
