//
//  NeuroKineticUnitTests.swift
//  NeuroKineticTests
//
//  Created by Antonio Kim on 2019-11-04.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import XCTest
@testable import NeuroKinetic

class NeuroKineticUnitTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    /** This test cases completes Unit test on Metronome game. The resutl of the test will depend on the
     user's current tap count and whether the tap was completed on the left or the right button. This test will go
     from tap count one to twenty, with each count accounting for left and right. Eact test will have a number,
     followed by underscore, then a binary number. The first number indicates the tap count which ranges
     from 0 to 20, and the second number will either be 0 or 1, 0 indicated right, 1 indicating left
    */
    // tapCount = 1
    func testScoreIndex1_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 1
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 0)
    }
    
    func testScoreIndex1_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 1
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 1)
    }
    
    // tapCount = 2
    func testScoreIndex2_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 2
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 2)
    }
    
    func testScoreIndex2_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 2
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 1)
    }
    
    // tapCount = 3
    func testScoreIndex3_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 3
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 2)
    }
    
    func testScoreIndex3_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 3
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 3)
    }
    
    // tapCount = 4
    func testScoreIndex4_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 4
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 4)
    }
    
    func testScoreIndex4_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 4
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 3)
    }
    
    // tapCount = 5
    func testScoreIndex5_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 5
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 4)
    }
    
    func testScoreIndex5_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 5
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 5)
    }
    
    // tapCount = 6
    func testScoreIndex6_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 6
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 6)
    }
    
    func testScoreIndex6_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 6
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 5)
    }
    
    // tapCount = 7
    func testScoreIndex7_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 7
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 6)
    }
    
    func testScoreIndex7_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 7
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 7)
    }
    
    // tapCount = 8
    func testScoreIndex8_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 8
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 8)
    }
    
    func testScoreIndex8_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 8
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 7)
    }
    
    // tapCount = 9
    func testScoreIndex9_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 9
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 8)
    }
    
    func testScoreIndex9_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 9
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 9)
    }
    
    // tapCount = 10
    func testScoreIndex10_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 10
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 10)
    }
    
    func testScoreIndex10_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 10
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 9)
    }
    
    // tapCount = 11
    func testScoreInde11_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 11
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 10)
    }
    
    func testScoreIndex11_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 11
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 11)
    }
    
    // tapCount = 12
    func testScoreIndex12_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 12
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 12)
    }
    
    func testScoreIndex12_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 12
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 11)
    }
    
    // tapCount = 13
    func testScoreIndex13_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 13
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 12)
    }
    
    func testScoreIndex13_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 13
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 13)
    }
    
    // tapCount = 14
    func testScoreIndex14_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 14
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 14)
    }
    
    func testScoreIndex14_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 14
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 13)
    }
    
    // tapCount = 15
    func testScoreIndex15_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 15
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 14)
    }
    
    func testScoreIndex15_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 15
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 15)
    }
    
    // tapCount = 16
    func testScoreIndex16_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 16
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 16)
    }
    
    func testScoreIndex16_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 16
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 15)
    }
    
    // tapCount = 17
    func testScoreIndex17_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 17
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 16)
    }
    
    func testScoreIndex17_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 17
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 17)
    }
    
    // tapCount = 18
    func testScoreIndex18_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 18
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 18)
    }
    
    func testScoreIndex18_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 18
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 17)
    }
    
    // tapCount = 19
    func testScoreIndex19_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 19
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 18)
    }
    
    func testScoreIndex19_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 19
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 19)
    }
    
    // tapCount = 20
    func testScoreIndex20_0(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 20
        XCTAssertEqual(metroGame.scoreIndex(isLeft: false), 20)
    }
    
    func testScoreIndex20_1(){
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 20
        XCTAssertEqual(metroGame.scoreIndex(isLeft: true), 19)
    }
}
