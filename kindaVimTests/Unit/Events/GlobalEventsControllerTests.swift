@testable import kindaVim
import XCTest

class GlobalEventsControllerTests: XCTestCase {
    
    func test_that_when_in_insert_mode_the_global_hotkey_press_sets_Vim_in_command_mode() {
        VimEngineController.shared.enterInsertMode()
        
        let globalHotkeyCombination = KeyCombination(key: .escape, command: true)
        _ = GlobalEventsController.stole(keyCombination: globalHotkeyCombination)
        
        let currentVimMode = VimEngineController.shared.currentMode

        XCTAssertEqual(currentVimMode, .command)
    }

    func test_that_when_in_insert_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        VimEngineController.shared.enterInsertMode()

        let globalHotkeyCombination = KeyCombination(key: .escape, command: true)
        let captured = GlobalEventsController.stole(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }

    func test_that_when_in_command_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        VimEngineController.shared.enterCommandMode()

        let globalHotkeyCombination = KeyCombination(key: .escape, command: true)
        let captured = GlobalEventsController.stole(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
    
    func test_that_in_insert_mode_the_events_that_we_implemented_are_just_passed_back_to_macOS() {
        VimEngineController.shared.enterInsertMode()

        guard let jEvent = CGEvent(keyboardEventSource: nil, virtualKey: 38, keyDown: true) else { return XCTFail() }

        let implementedKeyCombination = KeyCombinationAdaptor.toKeyCombination(from: jEvent)
        let handled = GlobalEventsController.stole(keyCombination: implementedKeyCombination)
        
        XCTAssertFalse(handled)
    }

    func test_that_in_insert_mode_the_events_that_we_did_not_implement_are_just_passed_back_to_macOS() {
        VimEngineController.shared.enterInsertMode()

        guard let pEvent = CGEvent(keyboardEventSource: nil, virtualKey: 35, keyDown: true) else { return XCTFail() }

        let nomImplementedKeyCombination = KeyCombinationAdaptor.toKeyCombination(from: pEvent)
        let handled = GlobalEventsController.stole(keyCombination: nomImplementedKeyCombination)

        XCTAssertFalse(handled)
    }
    
    func test_that_in_command_mode_the_events_that_we_implemented_are_captured() {
        VimEngineController.shared.enterCommandMode()
        
        guard let jEvent = CGEvent(keyboardEventSource: nil, virtualKey: 38, keyDown: true) else { return XCTFail() }

        let implementedKeyCombination = KeyCombinationAdaptor.toKeyCombination(from: jEvent)
        let handled = GlobalEventsController.stole(keyCombination: implementedKeyCombination)
        
        XCTAssertTrue(handled)
    }

    func test_that_in_command_mode_the_events_that_we_did_not_implement_are_captured() {
        VimEngineController.shared.enterCommandMode()

        guard let pEvent = CGEvent(keyboardEventSource: nil, virtualKey: 35, keyDown: true) else { return XCTFail() }

        let nomImplementedKeyCombination = KeyCombinationAdaptor.toKeyCombination(from: pEvent)
        let handled = GlobalEventsController.stole(keyCombination: nomImplementedKeyCombination)

        XCTAssertTrue(handled)
    }

}
