//
//  ASMotionsTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

@testable import kindaVim
import XCTest

class ASMotionsTests: XCTestCase {

    let accessibilityStrategy = AccessibilityStrategy()
    
}

extension ASMotionsTests {

    func test_that_h_is_moving_cursor_position_to_the_left_by_one_increment() {
        let element = AccessibilityElement(
            text: "hello world",
            cursorLocation: 6,
            selectionLength: 0
        )
        
        let returnedElement = accessibilityStrategy.h(on: element)
        
        XCTAssertEqual(returnedElement?.text, element.text)
        XCTAssertEqual(returnedElement?.cursorLocation, 5)
        XCTAssertEqual(returnedElement?.selectionLength, element.selectionLength)
    }
    
    func test_that_l_is_moving_cursor_position_to_the_right_by_one_increment() {
        let element = AccessibilityElement(
            text: "hello world",
            cursorLocation: 6,
            selectionLength: 0
        )
        
        let returnedElement = accessibilityStrategy.l(on: element)
        
        XCTAssertEqual(returnedElement?.text, element.text)
        XCTAssertEqual(returnedElement?.cursorLocation, 7)
        XCTAssertEqual(returnedElement?.selectionLength, element.selectionLength)
    }
    
}
