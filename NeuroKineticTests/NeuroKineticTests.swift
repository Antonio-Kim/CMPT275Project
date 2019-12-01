//
//  NeuroKineticTests.swift
//  NeuroKineticTests
//
//  Created by nmaeda on 10/19/19.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import XCTest

@testable import NeuroKinetic

class NeuroKineticTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceTypingGame() {
        let typing = TypingGame()
        self.measure {
            for _ in 1..<10{
                typing.chooseParagraph()
            }
        }
    }
    
    func testPerformanceWritingGame(){
        let writing = HandwritingPractice()
        self.measure{
            for _ in 1..<10{
                writing.audioAssistance()
            }
        }
    }
    
    func testPerformanceMetronomeGame(){
        let metronome = MetronomeGame()
        self.measure{
            metronome.viewDidLoad()
        }
    }

}

