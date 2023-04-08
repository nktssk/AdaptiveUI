//
//  AdaptiveUI_ExampleUITests.swift
//  AdaptiveUI-ExampleUITests
//
//  Created by Nikita Sosyuk on 03.04.2023.
//

import XCTest
import AdaptiveUI_Example

final class AdaptiveUI_ExampleUITests: XCTestCase {

    func testExample() throws {
        let app = XCUIApplication()
        
        for _ in 0...9 {
            app.staticTexts["Экран переводов (натив)"].tap()
            app.navigationBars["Перевод между счетами"].buttons["Back"].tap()
        }
        
        app.launch()
    }
    
    func testExample2() throws {
        let app = XCUIApplication()
        
        for _ in 0...9 {
            app.staticTexts["Экран переводов (сеть)"].tap()
            app.navigationBars["Перевод между счетами"].buttons["Back"].tap()
        }
        
        app.launch()
    }
}
