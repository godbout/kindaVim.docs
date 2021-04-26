//
//  KeyCombinationConverterTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 26/04/2021.
//

@testable import kindaVim
import XCTest

class KeyCombinationToCGEventTests: XCTestCase {
    
    func test_that_it_can_convert_a_simple_KeyCombination_press_to_a_CGEvent() throws {
        let jKeyCombination = KeyCombination(key: .j)
        
        let jCGEvent = try XCTUnwrap(KeyCombinationConverter.toCGEvent(from: jKeyCombination))
        
        XCTAssertEqual(jCGEvent.getIntegerValueField(.keyboardEventKeycode), 38)
        XCTAssertTrue(jCGEvent.flags.isEmpty)
        XCTAssertEqual(jCGEvent.type, .keyDown)
    }
    
    func test_that_it_can_convert_a_simple_KeyCombination_release_to_a_CGEvent() throws {
        let jKeyCombination = KeyCombination(key: .j, action: .release)
        
        let jCGEvent = try XCTUnwrap(KeyCombinationConverter.toCGEvent(from: jKeyCombination))
        
        XCTAssertEqual(jCGEvent.getIntegerValueField(.keyboardEventKeycode), 38)
        XCTAssertTrue(jCGEvent.flags.isEmpty)
        XCTAssertEqual(jCGEvent.type, .keyUp)
    }

    func test_that_it_can_convert_a_KeyCombination_with_modifiers_press_to_a_CGEvent() throws {
        let kKeyCombination = KeyCombination(key: .k, command: true, shift: true)
        
        let kCGEvent = try XCTUnwrap(KeyCombinationConverter.toCGEvent(from: kKeyCombination))
        
        XCTAssertEqual(kCGEvent.getIntegerValueField(.keyboardEventKeycode), 40)
        XCTAssertEqual(kCGEvent.flags.contains(.maskCommand), true)
        XCTAssertEqual(kCGEvent.flags.contains(.maskAlternate), false)
        XCTAssertEqual(kCGEvent.flags.contains(.maskControl), false)
        XCTAssertEqual(kCGEvent.flags.contains(.maskAlphaShift), false)
        XCTAssertEqual(kCGEvent.flags.contains(.maskShift), true)
        XCTAssertEqual(kCGEvent.type, .keyDown)
    }
    
    func test_that_it_can_convert_a_KeyCombination_with_modifiers_release_to_a_CGEvent() throws {
        let kKeyCombination = KeyCombination(key: .k, option: true, control: true, shift: true, action: .release)
        
        let kCGEvent = try XCTUnwrap(KeyCombinationConverter.toCGEvent(from: kKeyCombination))
        
        XCTAssertEqual(kCGEvent.getIntegerValueField(.keyboardEventKeycode), 40)
        XCTAssertEqual(kCGEvent.flags.contains(.maskCommand), false)
        XCTAssertEqual(kCGEvent.flags.contains(.maskAlternate), true)
        XCTAssertEqual(kCGEvent.flags.contains(.maskControl), true)
        XCTAssertEqual(kCGEvent.flags.contains(.maskAlphaShift), false)
        XCTAssertEqual(kCGEvent.flags.contains(.maskShift), true)
        XCTAssertEqual(kCGEvent.type, .keyUp)
    }

}
