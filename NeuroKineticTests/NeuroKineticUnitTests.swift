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

    // This test cases completes Unit test on Metronome game. The test
    // applies to expected time with different tap count and also
    // whether the the button is on the left button or on the right
    // button.
    //
    // Pre-condition:
    //      int metroGame.tapCount: tap count of the metronome
    //      bool isLeft: true when the button is on the left,
    //                   false, when the button is on the right
    //
    // Post-condition:
    //      XCAssertEqual: the test passes when the parameter of
    //      expectedTime and expected outcome are the same
    //
    
    func testExpecTime0_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 0
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 2.0)
    }
    
    func testExpecTime0_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 0
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 0.0)
    }
    
    func testExpecTime1_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 1
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 2.0)
    }
    
    func testExpecTime1_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 1
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 4.0)
    }
    
    func testExpecTime2_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 2
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 6.0)
    }
    
    func testExpecTime2_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 2
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 4.0)
    }
    
    func testExpecTime3_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 3
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 6.0)
    }
    
    func testExpecTime3_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 3
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 8.0)
    }
    
    func testExpecTime4_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 4
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 10.0)
    }

    func testExpecTime4_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 4
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 8.0)
    }
    
    func testExpecTime5_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 5
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 10.0)
    }
    
    func testExpecTime5_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 5
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 12.0)
    }
    
    func testExpecTime6_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 6
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 14.0)
    }
    
    func testExpecTime6_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 6
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 12.0)
    }
    
    func testExpecTime7_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 7
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 14.0)
    }
    
    func testExpecTime7_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 7
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 16.0)
    }
    
    func testExpecTime8_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 8
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 18.0)
    }
    
    func testExpecTime8_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 8
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 16.0)
    }
    
    func testExpecTime9_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 9
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 18.0)
    }
    
    func testExpecTime9_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 8
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 16.0)
    }
    
    func testExpecTime10_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 10
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 22.0)
    }
    
    func testExpecTime10_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 10
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 20.0)
    }
    
    func testExpecTime11_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 11
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 22.0)
    }
    
    func testExpecTime11_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 11
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 24.0)
    }
    
    func testExpecTime12_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 12
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 26.0)
    }
    
    func testExpecTime12_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 12
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 24.0)
    }
    
    func testExpecTime13_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 13
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 26.0)
    }
    
    func testExpecTime13_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 13
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 28.0)
    }
    
    func testExpecTime14_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 14
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 30.0)
    }
    
    func testExpecTime14_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 14
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 28.0)
    }
    
    func testExpecTime15_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 15
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 30.0)
    }
    
    func testExpecTime15_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 15
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 32.0)
    }
    
    func testExpecTime16_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 16
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 34.0)
    }
    
    func testExpecTime16_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 16
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 32.0)
    }
    
    func testExpecTime17_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 17
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 34.0)
    }
    
    func testExpecTime17_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 17
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 36.0)
    }
    
    func testExpecTime18_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 18
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 38.0)
    }
    
    func testExpecTime18_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 17
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 36.0)
    }
    
    func testExpecTime19_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 19
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 38.0)
    }
    
    func testExpecTime19_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 19
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 40.0)
    }
    
    func testExpecTime20_0() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 20
        XCTAssertEqual(metroGame.expectedTime(isLeft: false), 42.0)
    }
    
    func testExpecTime20_1() {
        let metroGame = NeuroKinetic.MetronomeGame()
        metroGame.tapCount = 20
        XCTAssertEqual(metroGame.expectedTime(isLeft: true), 40.0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
