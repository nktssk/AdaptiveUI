//
//  AdaptiveUI_ExampleUITests.swift
//  AdaptiveUI-ExampleUITests
//
//  Created by Nikita Sosyuk on 03.04.2023.
//

import XCTest
@testable import AdaptiveUI_Example

final class AdaptiveUI_ExampleUITests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    func testRublePaymentNative() throws {
        let app = XCUIApplication()
        app.launch()
        
        for _ in 0...9 {
            app.staticTexts["Экран переводов (натив)"].tap()
            app.navigationBars.firstMatch.buttons["Back"].tap()
        }
    }
    
    func testRublePaymentAdaptiveUI() throws {
        let app = XCUIApplication()
        app.launch()
        for _ in 0...9 {
            app.staticTexts["Экран переводов (сеть)"].tap()
            app.navigationBars.firstMatch.buttons["Back"].tap()
        }
    }
    
    func testRublePaymentCode() throws {
        let app = XCUIApplication()
        app.launch()
        for _ in 0...9 {
            app.staticTexts["Экран переводов (код)"].tap()
            app.navigationBars.firstMatch.buttons["Back"].tap()
        }
    }
    
    func testListAdaptive() throws {
        let app = XCUIApplication()
        app.launch()
        app.staticTexts["Таблицы"].tap()
        app.swipeUp()
        app.swipeUp()
        app.navigationBars.firstMatch.buttons["Back"].tap()
    }
    
    func testListNative() throws {
        let app = XCUIApplication()
        app.launch()
        app.staticTexts["Таблицы (Код)"].tap()
        app.swipeUp()
        app.swipeUp()
        app.navigationBars.firstMatch.buttons["Back"].tap()
    }
}
