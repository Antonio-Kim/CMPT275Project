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
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
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
