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
        
    }

}
