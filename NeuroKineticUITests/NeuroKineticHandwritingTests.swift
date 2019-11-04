//
//  NeuroKineticHandwritingTests.swift
//  NeuroKineticHandwritingTests
//
//  Created by antoniok on 2019-11-03.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import XCTest

class NeuroKineticHandwritingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignatureDone() {
        /** This test cases ensures that initial test is completed on the signature portion of
         *  Handwriting game. Once the signature has been filled, the test case will click on
         *  "Done" button and will move onto the next portion of the game
         *
         *  # Testing procedures #
         *      1) Start the game by clicking on the "Start" icon
         *      2) Click on Handwriting game icon
         *      3) Draw something on the highlighted box
         *      4) Click Done, and moves onto the next game
         */
 
        let app = XCUIApplication()
        app.otherElements.containing(.image, identifier:"Logo").children(matching: .button).matching(identifier: "Button").element(boundBy: 0).tap()
        app.buttons["GameChoose Write"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        app.buttons["DONE"].tap()
        
    }
    
    func testSignatureClear(){
        /** This test cases ensures that initial test is completed on the signature portion of
         *  Handwriting game. Once the signature has been filled, the test case will click on
         *  "Clear" button and will remove any signature on the highlighted box
         *
         *  # Testing procedures #
         *      1) Start the game by clicking on the "Start" icon
         *      2) Click on Handwriting game icon
         *      3) Draw something on the highlighted box
         *      4) Click Clear, and clears the signature on the highlighted box
         */
        
        let app = XCUIApplication()
        app.otherElements.containing(.image, identifier:"Logo").children(matching: .button).matching(identifier: "Button").element(boundBy: 0).tap()
        app.buttons["GameChoose Write"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.swipeDown()
        app.buttons["Clear"].tap()
        
    }
 
}