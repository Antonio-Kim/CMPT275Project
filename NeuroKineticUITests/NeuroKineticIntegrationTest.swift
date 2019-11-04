//
//  NeuroKineticIntegrationTest.swift
//  NeuroKineticUITests
//
//  Created by Antonio Kim on 2019-11-03.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import XCTest

class NeuroKineticIntegrationTest: XCTestCase {

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
/*
    func testIntegrationTests() {
        
        
        // FOUND MAJOR BUG DURING INTEGRATION TEST. WILL NEED TO BE ADDRESSED ON THE NEXT RELEASE
        //          - ANTONIO KIM
        // The integeration test goes through all the features of the app, including
        // metronome game, handwriting game, and typing game. Please see each UI tests
        // for more information
        
        let app = XCUIApplication()
        app.buttons["Button"].tap()
        app.buttons["GameChoose Tap"].tap()
        app.buttons["START"].tap()
        
        let window = app.children(matching: .window).element(boundBy: 0)
        let element2 = window.children(matching: .other).element(boundBy: 9).children(matching: .other).element
        let tapbuttonButton = element2.children(matching: .button).matching(identifier: "tapButton").element(boundBy: 1)
        tapbuttonButton.tap()
        
        let tapbuttonButton2 = element2.children(matching: .button).matching(identifier: "tapButton").element(boundBy: 0)
        tapbuttonButton2.tap()
        tapbuttonButton.tap()
        tapbuttonButton2.tap()
        tapbuttonButton.tap()
        tapbuttonButton2.tap()
        tapbuttonButton.tap()
        tapbuttonButton2.tap()
        tapbuttonButton.tap()
        tapbuttonButton2.tap()
        tapbuttonButton.tap()
        tapbuttonButton2.tap()
        tapbuttonButton.tap()
        tapbuttonButton2.tap()
        tapbuttonButton.tap()
        tapbuttonButton2.tap()
        tapbuttonButton.tap()
        tapbuttonButton2.tap()
        tapbuttonButton.tap()
        tapbuttonButton2.tap()
        app.buttons["DONE"].tap()
        app.buttons["GameChoose Write"].tap()
        
        let element = window.children(matching: .other).element(boundBy: 11).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.swipeDown()
        
        let clearButton = app.buttons["Clear"]
        clearButton.tap()
        element.swipeUp()
        
        let doneButton = app.buttons["Done"]
        doneButton.tap()
        
        let image = window.children(matching: .other).element(boundBy: 12).children(matching: .other).element.children(matching: .image).element
        image.swipeUp()
        clearButton.tap()
        image.swipeUp()
        doneButton.tap()
        app.buttons["GameChoose Type"].tap()
        window.children(matching: .other).element(boundBy: 14).children(matching: .other).element.children(matching: .textField).element.tap()
        doneButton.tap()
        
    }
*/
}
