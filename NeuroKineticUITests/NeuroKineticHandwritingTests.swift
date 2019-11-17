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
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
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
        
        let element = XCUIApplication().children(matching: .window).element(boundBy: 2).children(matching: .other).element
        element.swipeUp()
        element.swipeDown()
        
        
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
    
    func testHandwritingClear(){
        /** This test cases ensures that handwriting test is completed and clears the
         *  the writing once the "Clear" button is pressed. When the handwriting is written,
         *  the test case will click on "Clear" button and will remove any handwritings on the paper.
         *
         *  # Testing procedures #
         *      1) Start the game by clicking on the "Start" icon
         *      2) Click on Handwriting game icon
         *      3) Press Done
         *      4) Draw something on the paper
         *      4) Click Clear, and removes any handwritings on the paper
         */
        
        let app = XCUIApplication()
        app.buttons["Button"].tap()
        app.buttons["GameChoose Write"].tap()
        app.buttons["Done"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .image).element.swipeUp()
        app.buttons["Clear"].tap()
        
    }
    
    func testHandwritingDone(){
        /** This test cases ensures that handwriting test is completed and moves to the
         *  main menu once the "Done" button is pressed. When the handwriting is written,
         *  the test case will click on "Clear" button and will remove any handwritings on the paper.
         *
         *  # Testing procedures #
         *      1) Start the game by clicking on the "Start" icon
         *      2) Click on Handwriting game icon
         *      3) Press Done
         *      4) Draw something on the paper
         *      4) Click Done, and return to the main menu
         */
        
        let app = XCUIApplication()
        app.buttons["Button"].tap()
        app.buttons["GameChoose Write"].tap()
        
        let doneButton = app.buttons["Done"]
        doneButton.tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .image).element.swipeUp()
        doneButton.tap()
        
    }
}
