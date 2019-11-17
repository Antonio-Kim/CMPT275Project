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
    
    
    // This test case checks whether Typing game test gives correct output
    // after the user finishes the whole paragraph given.
    func testTypingResutls(){

    }
    
    func testTypingWPM(){
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
