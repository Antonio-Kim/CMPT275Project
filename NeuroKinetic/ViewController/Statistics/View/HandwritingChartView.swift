//
//  HandwritingChartView.swift
//  NeuroKinetic
//
//  Created by Rico Chao on 2019-11-30.
//  Copyright © 2019 teamRANDY. All rights reserved.
//


import Foundation
import Macaw

open class HandwritingChartView: MacawView {

    open var completionCallback: (() -> ()) = { }

    private var backgroundGroup = Group()
    private var mainGroup = Group()
    private var lastPlayedGroup = Group()

    private var barAnimations = [Animation]()
    private let barsValues = [80, 61, 65, 55, 35, 20, 15]   //Scores multiply by 5
    private let barsCaptions = ["1", "2", "3", "4", "5", "6", "7"]
    private let barsCount = 7
    private let barsSpacing = 40
    private let barWidth = 30
    private let barHeight = 200

    private let emptyBarColor = Color.rgba(r: 138, g: 147, b: 219, a: 0.5)
    private let gradientColor = LinearGradient(degree: 90, from: Color(val: 0xeea849), to: Color(val: 0xf46b45))

    private func createScene() {
        let viewCenterX = Double(self.frame.width / 2)

        let barsWidth = Double((barWidth * barsCount) + (barsSpacing * (barsCount - 1)))
        let barsCenterX = viewCenterX - barsWidth / 2

        let title = Text(
            text: "Metronome Chart for last 7 games",
            font: Font(name: "Serif", size: 24),
            fill: Color(val: 0x000000)
        )
        title.align = .mid
        title.place = .move(dx: viewCenterX, dy: 30)
        
        let scoreMax = Text(
            text: "20",
            font: Font(name: "Serif", size: 16),
            fill: Color(val: 0x000000)
        )
        
        scoreMax.place = .move(dx: 80, dy: 90)

        backgroundGroup = Group()
        for barIndex in 0...barsCount - 1 {
            let barShape = Shape(
                form: RoundRect(
                    rect: Rect(
                        x: Double(barIndex * (barWidth + barsSpacing)),
                        y: 0,
                        w: Double(barWidth),
                        h: Double(barHeight)
                    ),
                    rx: 5,
                    ry: 5
                ),
                fill: emptyBarColor
            )
            backgroundGroup.contents.append(barShape)
        }

        mainGroup = Group()
        for barIndex in 0...barsCount - 1 {
            let barShape = Shape(
                form: RoundRect(
                    rect: Rect(
                        x: Double(barIndex * (barWidth + barsSpacing)),
                        y: Double(barHeight),
                        w: Double(barWidth),
                        h: Double(0)
                    ),
                    rx: 5,
                    ry: 5
                ),
                fill: gradientColor
            )
            mainGroup.contents.append([barShape].group())
        }

        backgroundGroup.place = Transform.move(dx: barsCenterX, dy: 90)
        mainGroup.place = Transform.move(dx: barsCenterX, dy: 90)

        lastPlayedGroup = Group()
        lastPlayedGroup.place = Transform.move(
            dx: barsCenterX,
            dy: 90 + Double(barHeight)
        )
        for barIndex in 0...barsCount - 1 {
            let text = Text(
                text: barsCaptions[barIndex],
                font: Font(name: "Serif", size: 14),
                fill: Color(val: 0x000000)
            )
            text.align = .mid
            text.place = .move(
                dx: Double((barIndex * (barWidth + barsSpacing)) + barWidth / 2),
                dy: 10
            )
            lastPlayedGroup.contents.append(text)
        }

        self.node = [title, scoreMax, backgroundGroup, mainGroup, lastPlayedGroup].group()
        self.backgroundColor = UIColor(cgColor: Color(val: 0xfefdf6).toCG())
    }

    private func createAnimations() {
        barAnimations.removeAll()
        for (index, node) in mainGroup.contents.enumerated() {
            if let group = node as? Group {
                let heightValue = self.barHeight / 100 * barsValues[index]
                let animation = group.contentsVar.animation({ t in
                    let value = Double(heightValue) / 100 * (t * 100)
                    let barShape = Shape(
                        form: RoundRect(
                            rect: Rect(
                                x: Double(index * (self.barWidth + self.barsSpacing)),
                                y: Double(self.barHeight) - Double(value),
                                w: Double(self.barWidth),
                                h: Double(value)
                            ),
                            rx: 5,
                            ry: 5
                        ),
                        fill: self.gradientColor
                    )
                    return [barShape]
                })   //, during: 0.2, delay: 0).easing(Easing.easeInOut)
                barAnimations.append(animation)
            }
        }
    }

    open func play() {
        createScene()
        createAnimations()
//        barAnimations.sequence().onComplete {
//            self.completionCallback()
//        }.play()
        barAnimations.combine().play()

    }

}

