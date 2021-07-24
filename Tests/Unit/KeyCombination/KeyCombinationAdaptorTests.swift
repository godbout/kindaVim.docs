@testable import kindaVim
import XCTest

class KeyCombinationAdaptorTests: XCTestCase {}

// from CGEvent
extension KeyCombinationAdaptorTests {

    func test_that_it_can_convert_a_simple_CGEvent_press_to_a_KeyCombination() throws {
        if let jCGEvent = CGEvent(keyboardEventSource: CGEventSource(stateID: .privateState), virtualKey: 38, keyDown: true) {
            jCGEvent.type = .keyDown

            let jKeyCombination = try XCTUnwrap(KeyCombinationAdaptor.fromCGEvent(from: jCGEvent))

            XCTAssertEqual(jKeyCombination.key, KeyCode.j)
            XCTAssertEqual(jKeyCombination.command, false)
            XCTAssertEqual(jKeyCombination.option, false)
            XCTAssertEqual(jKeyCombination.control, false)
            XCTAssertEqual(jKeyCombination.shift, false)
            XCTAssertEqual(jKeyCombination.action, .press)
        }
    }

    func test_that_it_can_convert_a_simple_CGEvent_release_to_a_KeyCombination() throws {
        if let jCGEvent = CGEvent(keyboardEventSource: CGEventSource(stateID: .privateState), virtualKey: 38, keyDown: false) {
            let jKeyCombination = try XCTUnwrap(KeyCombinationAdaptor.fromCGEvent(from: jCGEvent))

            XCTAssertEqual(jKeyCombination.key, KeyCode.j)
            XCTAssertEqual(jKeyCombination.command, false)
            XCTAssertEqual(jKeyCombination.option, false)
            XCTAssertEqual(jKeyCombination.control, false)
            XCTAssertEqual(jKeyCombination.shift, false)
            XCTAssertEqual(jKeyCombination.action, .release)
        }
    }

    func test_that_it_can_convert_a_CGEvent_with_modifiers_press_to_a_KeyCombination() throws {
        if let kCGEvent = CGEvent(keyboardEventSource: CGEventSource(stateID: .privateState), virtualKey: 40, keyDown: true) {
            kCGEvent.flags.insert([.maskAlternate, .maskCommand])

            let kKeyCombination = try XCTUnwrap(KeyCombinationAdaptor.fromCGEvent(from: kCGEvent))

            XCTAssertEqual(kKeyCombination.key, KeyCode.k)
            XCTAssertEqual(kKeyCombination.command, true)
            XCTAssertEqual(kKeyCombination.option, true)
            XCTAssertEqual(kKeyCombination.control, false)
            XCTAssertEqual(kKeyCombination.shift, false)
            XCTAssertEqual(kKeyCombination.action, .press)
        }
    }

    func test_that_it_can_convert_a_CGEvent_with_modifiers_release_to_a_KeyCombination() throws {
        if let kCGEvent = CGEvent(keyboardEventSource: CGEventSource(stateID: .privateState), virtualKey: 40, keyDown: false) {
            kCGEvent.flags.insert([.maskControl, .maskShift])

            let kKeyCombination = try XCTUnwrap(KeyCombinationAdaptor.fromCGEvent(from: kCGEvent))

            XCTAssertEqual(kKeyCombination.key, KeyCode.k)
            XCTAssertEqual(kKeyCombination.command, false)
            XCTAssertEqual(kKeyCombination.option, false)
            XCTAssertEqual(kKeyCombination.control, true)
            XCTAssertEqual(kKeyCombination.shift, true)
            XCTAssertEqual(kKeyCombination.action, .release)
        }
    }

}

// to CGEvent
extension KeyCombinationAdaptorTests {
    
    func test_that_it_can_convert_a_simple_KeyCombination_press_to_one_CGEvent() {
        let jKeyCombination = KeyCombination(key: .j, action: .press)
        
        let jCGEvents = KeyCombinationAdaptor.toCGEvents(from: jKeyCombination)
        
        XCTAssertEqual(jCGEvents.count, 1)
        
        XCTAssertEqual(jCGEvents.first?.getIntegerValueField(.keyboardEventKeycode), 38)
        XCTAssertEqual(jCGEvents.first?.flags.isEmpty, true)
        XCTAssertEqual(jCGEvents.first?.type, .keyDown)
    }
    
    func test_that_it_can_convert_a_simple_KeyCombination_release_to_one_CGEvent() {
        let jKeyCombination = KeyCombination(key: .j, action: .release)
        
        let jCGEvents = KeyCombinationAdaptor.toCGEvents(from: jKeyCombination)
        
        XCTAssertEqual(jCGEvents.count, 1)
        
        XCTAssertEqual(jCGEvents.first?.getIntegerValueField(.keyboardEventKeycode), 38)
        XCTAssertEqual(jCGEvents.first?.flags.isEmpty, true)
        XCTAssertEqual(jCGEvents.first?.type, .keyUp)
    }
    
    func test_that_it_can_convert_a_simple_KeyCombination_with_both_actions_to_CGEvents() {
        let jKeyCombination = KeyCombination(key: .j, action: .both)
        
        let jCGEvents = KeyCombinationAdaptor.toCGEvents(from: jKeyCombination)
        
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

        let kCGEvents = KeyCombinationAdaptor.toCGEvents(from: kKeyCombination)
        
        XCTAssertEqual(kCGEvents.count, 1)
        
        XCTAssertEqual(kCGEvents.first?.getIntegerValueField(.keyboardEventKeycode), 40)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskCommand), true)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskAlternate), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskControl), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskShift), true)
        XCTAssertEqual(kCGEvents.first?.type, .keyDown)
    }
    
    func test_that_it_can_convert_a_KeyCombination_with_modifiers_release_to_one_CGEvent() {
        let kKeyCombination = KeyCombination(key: .k, option: true, action: .release)

        let kCGEvents = KeyCombinationAdaptor.toCGEvents(from: kKeyCombination)
        
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
        let kKeyCombination = KeyCombination(key: .k, control: true, action: .both)

        let kCGEvents = KeyCombinationAdaptor.toCGEvents(from: kKeyCombination)
        
        XCTAssertEqual(kCGEvents.count, 2)
        
        XCTAssertEqual(kCGEvents.first?.getIntegerValueField(.keyboardEventKeycode), 40)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskCommand), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskAlternate), false)
        XCTAssertEqual(kCGEvents.first?.flags.contains(.maskControl), true)
        XCTAssertEqual(kCGEvents.first?.type, .keyDown)
        
        XCTAssertEqual(kCGEvents.last?.getIntegerValueField(.keyboardEventKeycode), 40)
        XCTAssertEqual(kCGEvents.last?.flags.contains(.maskCommand), false)
        XCTAssertEqual(kCGEvents.last?.flags.contains(.maskAlternate), false)
        XCTAssertEqual(kCGEvents.last?.flags.contains(.maskControl), true)
        XCTAssertEqual(kCGEvents.last?.flags.contains(.maskShift), false)
        XCTAssertEqual(kCGEvents.last?.type, .keyUp)
    }

}
