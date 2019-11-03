//
//  NeuroKineticUITests.swift
//  NeuroKineticUITests
//
//  Created by Antonio Kim on 2019-11-03.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import XCTest

class NeuroKineticUITests: XCTestCase {

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

    func testStatsMenuThroughIcon() {
    /** This test case starts at the menu, and enters the stats menu by pressing the
     *  Stats Icon. It then cycles through the game stat by
     *  clicking on "next". User should expect to come back to the main menu
     *  after pressing the next button three times.
     *
     *  # Test case Procedure #
     *      1)  User clicks on Stats icon, which goes to Metronome stats
     *      2)  User clicks on next, which then goes to Handwriting stats
     *      3)  User clicks on next, which then goes to Typing stats
     *      4)  User clicks on next, which goes back to the main menu
     */
        
        let app = XCUIApplication()
        app.otherElements.containing(.image, identifier:"Logo").children(matching: .button).matching(identifier: "Button").element(boundBy: 1).tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        
    }
    
    func testStatsMenuThroughLabel() {
    /** This test case starts at the menu, and enters the stats menu by pressing the
     *  "View Stats label". It then cycles through the game stat by
     *  clicking on "next" button. User should expect to come back to the main menu
     *  after pressing the next button three times.
     *
     *  # Test case Procedure #
     *      1)  User clicks on "View Stats" label, which goes to Metronome stats
     *      2)  User clicks on next, which then goes to Handwriting stats
     *      3)  User clicks on next, which then goes to Typing stats
     *      4)  User clicks on next, which goes back to the main menu
     */
        
        let app = XCUIApplication()
        app.buttons["STATS"].tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        
    }
    
    func testStatsBackButton(){
    /** This test cases checks the functionality of "< back" button on each stats
     *  menu. The expectation is that when user presses the button, it should take
     *  the user back to the main menu
     *
     *  # Test case procedure #
     *      1) User presses the stats icon, which takes to metronome stats
     *      2) User goes back to the main menu.
     *      3) User presses the stats icon, then presses next to go to Handwriting stats
     *      4) User goes back to the main menu.
     *      5) User presses the stats icon, the presses next twice to go to
     *         Typing stats
     *      6) User goes back to the main menu.
     *      7) User presses the "View Stats" label, which takes to metronome stats
     *      8) User goes back to the main menu.
     *      9) User presses the "View stats" label, then presses next to go to
     *         Handwriting stats
     *     10) User goes back to the main menu.
     *     11) User presses the "View stats" label, then presses next twice to go to
     *     12) Typing stats
     *     13) User goes back to the main menu.
     */
        
        let app = XCUIApplication()
        let window = app.children(matching: .window).element(boundBy: 0)
        window.children(matching: .other).element(boundBy: 3).children(matching: .other).element.children(matching: .button).matching(identifier: "Button").element(boundBy: 1).tap()
        
        let backButton = app.buttons["< Back"]
        backButton.tap()
        window.children(matching: .other).element(boundBy: 5).children(matching: .other).element.children(matching: .button).matching(identifier: "Button").element(boundBy: 1).tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        backButton.tap()
        window.children(matching: .other).element(boundBy: 8).children(matching: .other).element.children(matching: .button).matching(identifier: "Button").element(boundBy: 1).tap()
        nextButton.tap()
        nextButton.tap()
        backButton.tap()
        
        let statsButton = app.buttons["STATS"]
        statsButton.tap()
        backButton.tap()
        statsButton.tap()
        nextButton.tap()
        backButton.tap()
        statsButton.tap()
        nextButton.tap()
        nextButton.tap()
        backButton.tap()
        
    }

}
