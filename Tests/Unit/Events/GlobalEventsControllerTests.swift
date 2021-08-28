@testable import kindaVim
import KeyCombination
import XCTest


class GlobalEventsControllerTests: XCTestCase {

    let globalHotkeyCombination = KeyCombination(key: .escape)

}


// insert mode
extension GlobalEventsControllerTests {
    
    func test_that_when_in_insert_mode_the_global_hotkey_press_sets_Vim_in_normal_mode() {
        KindaVimEngine.shared.enterInsertMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

    func test_that_when_in_insert_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        KindaVimEngine.shared.enterInsertMode()

        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
    
    func test_that_in_insert_mode_the_events_that_we_implemented_are_just_passed_back_to_macOS() {
        KindaVimEngine.shared.enterInsertMode()
        
        guard let jEvent = CGEvent(keyboardEventSource: nil, virtualKey: 38, keyDown: true) else { return XCTFail() }
        
        let implementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: jEvent)
        let handled = GlobalEventsController.handle(keyCombination: implementedKeyCombination)
        
        XCTAssertFalse(handled)
    }
    
    func test_that_in_insert_mode_the_events_that_we_did_not_implement_are_just_passed_back_to_macOS() {
        KindaVimEngine.shared.enterInsertMode()
        
        guard let pEvent = CGEvent(keyboardEventSource: nil, virtualKey: 35, keyDown: true) else { return XCTFail() }
        
        let nomImplementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: pEvent)
        let handled = GlobalEventsController.handle(keyCombination: nomImplementedKeyCombination)
        
        XCTAssertFalse(handled)
    }
    
}


// normal mode
extension GlobalEventsControllerTests {

    func test_that_when_in_normal_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        KindaVimEngine.shared.enterNormalMode()

        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
        
    func test_that_in_normal_mode_the_events_that_we_implemented_are_captured() {
        KindaVimEngine.shared.enterNormalMode()
        
        guard let jEvent = CGEvent(keyboardEventSource: nil, virtualKey: 38, keyDown: true) else { return XCTFail() }

        let implementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: jEvent)
        let handled = GlobalEventsController.handle(keyCombination: implementedKeyCombination)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_in_normal_mode_the_events_that_we_did_not_implement_are_captured() {
        KindaVimEngine.shared.enterNormalMode()
        
        guard let pEvent = CGEvent(keyboardEventSource: nil, virtualKey: 35, keyDown: true) else { return XCTFail() }
        
        let nomImplementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: pEvent)
        let handled = GlobalEventsController.handle(keyCombination: nomImplementedKeyCombination)
        
        XCTAssertTrue(handled)
    }
    
}


// visual mode
extension GlobalEventsControllerTests {
    
    func test_that_when_in_visual_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        KindaVimEngine.shared.enterVisualMode()
        
        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)
        
        XCTAssertTrue(captured)
    }
    
    func test_that_in_visual_mode_the_events_that_we_implemented_are_captured() {
        KindaVimEngine.shared.enterVisualMode()
        
        guard let jEvent = CGEvent(keyboardEventSource: nil, virtualKey: 38, keyDown: true) else { return XCTFail() }
        
        let implementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: jEvent)
        let handled = GlobalEventsController.handle(keyCombination: implementedKeyCombination)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_in_visual_mode_the_events_that_we_did_not_implement_are_captured() {
        KindaVimEngine.shared.enterVisualMode()
        
        guard let pEvent = CGEvent(keyboardEventSource: nil, virtualKey: 35, keyDown: true) else { return XCTFail() }
        
        let nomImplementedKeyCombination = KeyCombinationAdaptor.fromCGEvent(from: pEvent)
        let handled = GlobalEventsController.handle(keyCombination: nomImplementedKeyCombination)
        
        XCTAssertTrue(handled)
    }

}
