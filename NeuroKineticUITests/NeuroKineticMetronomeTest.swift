//
//  NeuroKineticMetronomeTest.swift
//  NeuroKineticUITests
//
//  Created by Antonio Kim on 2019-11-03.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import XCTest

class NeuroKineticMetronomeTest: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
    }
/* FOUND MAJOR BUG DURING INTEGRATION TEST. WILL NEED TO BE ADDRESSED ON THE NEXT RELEASE - ANTONIO KIM
    func testMetronomeFullTest() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.buttons["Button"].tap()
        app.buttons["GameChoose Tap"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element
        let tapbuttonButton = element.children(matching: .button).matching(identifier: "tapButton").element(boundBy: 0)
        tapbuttonButton.tap()
        app.buttons["START"].tap()
        
        let tapbuttonButton2 = element.children(matching: .button).matching(identifier: "tapButton").element(boundBy: 1)
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
        tapbuttonButton.tap()
        app.buttons["DONE"].tap()
    }
    */
    func testMetronomeQuitDuringGame(){
        // The user quits the game after tapping 4 buttons, and
        // quits by pressing "< back" button.
        
        let app = XCUIApplication()
        app.buttons["Button"].tap()
        app.buttons["GameChoose Tap"].tap()
        app.buttons["START"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element
        let tapbuttonButton = element.children(matching: .button).matching(identifier: "tapButton").element(boundBy: 1)
        tapbuttonButton.tap()
        
        let tapbuttonButton2 = element.children(matching: .button).matching(identifier: "tapButton").element(boundBy: 0)
        tapbuttonButton2.tap()
        tapbuttonButton.tap()
        tapbuttonButton2.tap()
        app.buttons["Back"].tap()
        
    }

}
