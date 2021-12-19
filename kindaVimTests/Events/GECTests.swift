@testable import kindaVim
import KeyCombination
import XCTest
import KeyboardShortcuts


// here are the tests that don't care if we're using the default keyboard shortcut
// or a custom one.
class GlobalEventsControllerTests: XCTestCase {

    let globalHotkeyCombination = KeyCombination(key: .escape)

}


// insert mode
extension GlobalEventsControllerTests {
    
    func test_that_in_insert_mode_the_events_that_we_implemented_are_just_passed_back_to_macOS() {
        AppCore.shared.vimEngine.enterInsertMode()
        
        guard let jEvent = CGEvent(keyboardEventSource: nil, virtualKey: 4, keyDown: true) else { return XCTFail() }
        
        let implementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: jEvent)
        let handled = GlobalEventsController.handle(keyCombination: implementedKeyCombination)
        
        XCTAssertFalse(handled)
    }
    
    func test_that_in_insert_mode_the_events_that_we_did_not_implement_are_just_passed_back_to_macOS() {
        AppCore.shared.vimEngine.enterInsertMode()
        
        guard let pEvent = CGEvent(keyboardEventSource: nil, virtualKey: 37, keyDown: true) else { return XCTFail() }
        
        let nomImplementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: pEvent)
        let handled = GlobalEventsController.handle(keyCombination: nomImplementedKeyCombination)
        
        XCTAssertFalse(handled)
    }
    
}


// normal mode
extension GlobalEventsControllerTests {

    func test_that_in_normal_mode_the_events_that_we_implemented_are_captured() {
        AppCore.shared.vimEngine.enterNormalMode()
        
        guard let jEvent = CGEvent(keyboardEventSource: nil, virtualKey: 4, keyDown: true) else { return XCTFail() }

        let implementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: jEvent)
        let handled = GlobalEventsController.handle(keyCombination: implementedKeyCombination)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_in_normal_mode_the_events_that_we_did_not_implement_are_captured() {
        AppCore.shared.vimEngine.enterNormalMode()
        
        guard let pEvent = CGEvent(keyboardEventSource: nil, virtualKey: 37, keyDown: true) else { return XCTFail() }
        
        let nomImplementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: pEvent)
        let handled = GlobalEventsController.handle(keyCombination: nomImplementedKeyCombination)
        
        XCTAssertTrue(handled)
    }
    
}


// visual mode
extension GlobalEventsControllerTests {
    
    func test_that_in_visual_mode_the_events_that_we_implemented_are_captured() {
        AppCore.shared.vimEngine.enterVisualMode()
        
        guard let jEvent = CGEvent(keyboardEventSource: nil, virtualKey: 4, keyDown: true) else { return XCTFail() }
        
        let implementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: jEvent)
        let handled = GlobalEventsController.handle(keyCombination: implementedKeyCombination)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_in_visual_mode_the_events_that_we_did_not_implement_are_captured() {
        AppCore.shared.vimEngine.enterVisualMode()
        
        guard let pEvent = CGEvent(keyboardEventSource: nil, virtualKey: 37, keyDown: true) else { return XCTFail() }
        
        let nomImplementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: pEvent)
        let handled = GlobalEventsController.handle(keyCombination: nomImplementedKeyCombination)
        
        XCTAssertTrue(handled)
    }

}
