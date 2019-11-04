//
//  NeuroKineticTypingTests.swift
//  NeuroKineticUITests
//
//  Created by Antonio Kim on 2019-11-03.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import XCTest

class NeuroKineticTypingTests: XCTestCase {

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

    func testTypingGameButton() {
        // checks the buttons on the of typing game. There are back button a
        // and done button in the Typing Practice, and will return to the main
        // menu once they are pressed.
        //
        // # Test Procedure #
        //      1) Click "Start" icon
        //      2) Click on "Typing Practice" icon
        //      3) Press "< Back"
        //      4) Returns to main menu
        //      5) Repeat step 1 and 2
        //      6) Press "Done"
        //      7) Returns to main menu
        let app = XCUIApplication()
        app.buttons["Button"].tap()
        app.buttons["GameChoose Type"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element.tap()
        app.buttons["Done"].tap()
    }
    func testKeyboardLayout(){
        // Checks whether the keyboard layout pops up once the mouse
        // scroll is pressed on the text field.
        //
        // # Test Procedure #
        //      1) Click "Start" icon
        //      2) Click on "Typing Practice" icon
        //      3) Press on the text field
        //      4) Soft keyboard layout should pop out.
        
        let app = XCUIApplication()
        app.buttons["Button"].tap()
        app.buttons["GameChoose Type"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element.tap()
        
    }

}
