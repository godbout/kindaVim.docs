//
//  KeyCombinationConverterTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 26/04/2021.
//

@testable import kindaVim
import XCTest

class KeyCombinationToCGEventsTests: XCTestCase {
    
    func test_that_it_can_convert_a_simple_KeyCombination_press_to_one_CGEvent() {
        let jKeyCombination = KeyCombination(key: .j, action: .press)
        
        let jCGEvents = KeyCombinationConverter.toCGEvents(from: jKeyCombination)
        
        XCTAssertEqual(jCGEvents.count, 1)
        
        XCTAssertEqual(jCGEvents.first?.getIntegerValueField(.keyboardEventKeycode), 38)
        XCTAssertEqual(jCGEvents.first?.flags.isEmpty, true)
        XCTAssertEqual(jCGEvents.first?.type, .keyDown)
    }
    
    func test_that_it_can_convert_a_simple_KeyCombination_release_to_one_CGEvent() {
        let jKeyCombination = KeyCombination(key: .j, action: .release)
        
        let jCGEvents = KeyCombinationConverter.toCGEvents(from: jKeyCombination)
        
        XCTAssertEqual(jCGEvents.count, 1)
        
        XCTAssertEqual(jCGEvents.first?.getIntegerValueField(.keyboardEventKeycode), 38)
        XCTAssertEqual(jCGEvents.first?.flags.isEmpty, true)
        XCTAssertEqual(jCGEvents.first?.type, .keyUp)
    }
    
    func test_that_it_can_convert_a_simple_KeyCombination_with_both_actions_to_CGEvents() {
        let jKeyCombination = KeyCombination(key: .j, action: .both)
        
        let jCGEvents = KeyCombinationConverter.toCGEvents(from: jKeyCombination)
        
        XCTAssertEqual(jCGEvents.count, 2)
        
        XCTAssertEqual(jCGEvents.first?.getIntegerValueField(.keyboardEventKeycode), 38)
        XCTAssertEqual(jCGEvents.first?.flags.isEmpty, true)
        XCTAssertEqual(jCGEvents.first?.type, .keyDown)
        
        XCTAssertEqual(jCGEvents.last?.getIntegerValueField(.keyboardEventKeycode), 38)
        XCTAssertEqual(jCGEvents.last?.flags.isEmpty, true)
        XCTAssertEqual(jCGEvents.last?.type, .keyUp)
    }
    
    func test_that_it_can_convert_a_KeyCombination_with_modifiers_press_to_one_CGEvent() {
        let kKeyCombination = KeyCombination(key: .k, shift: true, command: true, action: .press)

        let kCGEvents = KeyCombinationConverter.toCGEvents(from: kKeyCombination)
        
        XCTAssertEqual(kCGEvents.count, 1)
        
        XCTAssertEqual(kCGEvents.first?.getIntegerValueField(.keyboardEventKeycode), 40)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskCommand), true)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskAlternate), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskControl), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskSecondaryFn), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskShift), true)
        XCTAssertEqual(kCGEvents.first?.type, .keyDown)
    }
    
    func test_that_it_can_convert_a_KeyCombination_with_modifiers_release_to_one_CGEvent() {
        let kKeyCombination = KeyCombination(key: .k, option: true, action: .release)

        let kCGEvents = KeyCombinationConverter.toCGEvents(from: kKeyCombination)
        
        XCTAssertEqual(kCGEvents.count, 1)
        
        XCTAssertEqual(kCGEvents.first?.getIntegerValueField(.keyboardEventKeycode), 40)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskCommand), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskAlternate), true)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskControl), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskSecondaryFn), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskShift), false)
        XCTAssertEqual(kCGEvents.first?.type, .keyUp)
    }
    
    func test_that_it_can_convert_a_KeyCombination_with_modifiers_with_both_actions_to_CGEvents() {
        let kKeyCombination = KeyCombination(key: .k, control: true, fn: true, action: .both)

        let kCGEvents = KeyCombinationConverter.toCGEvents(from: kKeyCombination)
        
        XCTAssertEqual(kCGEvents.count, 2)
        
        XCTAssertEqual(kCGEvents.first?.getIntegerValueField(.keyboardEventKeycode), 40)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskCommand), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskAlternate), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskControl), true)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskSecondaryFn), true)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskShift), false)
        XCTAssertEqual(kCGEvents.first?.type, .keyDown)
        
        XCTAssertEqual(kCGEvents.last?.getIntegerValueField(.keyboardEventKeycode), 40)
        XCTAssertEqual(kCGEvents.last?.flags.contains(.maskCommand), false)
        XCTAssertEqual(kCGEvents.last?.flags.contains(.maskAlternate), false)
        XCTAssertEqual(kCGEvents.last?.flags.contains(.maskControl), true)
        XCTAssertEqual(kCGEvents.last?.flags.contains(.maskSecondaryFn), true)
        XCTAssertEqual(kCGEvents.last?.flags.contains(.maskShift), false)
        XCTAssertEqual(kCGEvents.last?.type, .keyUp)
    }

}
