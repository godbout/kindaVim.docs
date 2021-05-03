//
//  CGEventToKeyCombinationTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 26/04/2021.
//

@testable import kindaVim
import XCTest

class CGEventToKeyCombinationTests: XCTestCase {
    
    func test_that_it_can_convert_a_simple_CGEvent_press_to_a_KeyCombination() throws {
        if let jCGEvent = CGEvent(keyboardEventSource: nil, virtualKey: 38, keyDown: true) {
            jCGEvent.type = .keyDown
            
            let jKeyCombination = try XCTUnwrap(KeyCombinationConverter.toKeyCombination(from: jCGEvent))
            
            XCTAssertEqual(jKeyCombination.key, KeyCode.j)
            XCTAssertEqual(jKeyCombination.command, false)
            XCTAssertEqual(jKeyCombination.option, false)
            XCTAssertEqual(jKeyCombination.control, false)
            XCTAssertEqual(jKeyCombination.fn, false)
            XCTAssertEqual(jKeyCombination.shift, false)
            XCTAssertEqual(jKeyCombination.action, .press)
        }
    }
    
    func test_that_it_can_convert_a_simple_CGEvent_release_to_a_KeyCombination() throws {
        if let jCGEvent = CGEvent(keyboardEventSource: nil, virtualKey: 38, keyDown: false) {
            let jKeyCombination = try XCTUnwrap(KeyCombinationConverter.toKeyCombination(from: jCGEvent))
            
            XCTAssertEqual(jKeyCombination.key, KeyCode.j)
            XCTAssertEqual(jKeyCombination.command, false)
            XCTAssertEqual(jKeyCombination.option, false)
            XCTAssertEqual(jKeyCombination.control, false)
            XCTAssertEqual(jKeyCombination.fn, false)
            XCTAssertEqual(jKeyCombination.shift, false)
            XCTAssertEqual(jKeyCombination.action, .release)
        }
    }
    
    func test_that_it_can_convert_a_CGEvent_with_modifiers_press_to_a_KeyCombination() throws {
        if let kCGEvent = CGEvent(keyboardEventSource: nil, virtualKey: 40, keyDown: true) {
            kCGEvent.flags.insert([.maskAlternate, .maskSecondaryFn])
            
            let kKeyCombination = try XCTUnwrap(KeyCombinationConverter.toKeyCombination(from: kCGEvent))
            
            XCTAssertEqual(kKeyCombination.key, KeyCode.k)
            XCTAssertEqual(kKeyCombination.command, false)
            XCTAssertEqual(kKeyCombination.option, true)
            XCTAssertEqual(kKeyCombination.control, false)
            XCTAssertEqual(kKeyCombination.fn, true)
            XCTAssertEqual(kKeyCombination.shift, false)
            XCTAssertEqual(kKeyCombination.action, .press)
        }
    }
    
    func test_that_it_can_convert_a_CGEvent_with_modifiers_release_to_a_KeyCombination() throws {
        if let kCGEvent = CGEvent(keyboardEventSource: nil, virtualKey: 40, keyDown: false) {
            kCGEvent.flags.insert([.maskControl, .maskShift])
            
            let kKeyCombination = try XCTUnwrap(KeyCombinationConverter.toKeyCombination(from: kCGEvent))
            
            XCTAssertEqual(kKeyCombination.key, KeyCode.k)
            XCTAssertEqual(kKeyCombination.command, false)
            XCTAssertEqual(kKeyCombination.option, false)
            XCTAssertEqual(kKeyCombination.control, true)
            XCTAssertEqual(kKeyCombination.fn, false)
            XCTAssertEqual(kKeyCombination.shift, true)
            XCTAssertEqual(kKeyCombination.action, .release)
        }
    }

}
