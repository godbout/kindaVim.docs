//
//  GlobalEventsControllerTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 27/04/2021.
//

@testable import kindaVim
import XCTest

class GlobalEventsControllerTests: XCTestCase {
    
    func test_that_when_in_insert_mode_the_global_hotkey_press_sets_Vim_in_command_mode() {
        VimEngineController.shared.enterInsertMode()
        
        let globalHotkeyCombination = KeyCombination(key: .escape, command: true)
        _ = GlobalEventsController.handle(globalHotkeyCombination)
        
        let currentVimMode = VimEngineController.shared.currentMode

        XCTAssertEqual(currentVimMode, .command)
    }

    func test_that_when_in_insert_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        VimEngineController.shared.enterInsertMode()

        let globalHotkeyCombination = KeyCombination(key: .escape, command: true)
        let captured = GlobalEventsController.handle(globalHotkeyCombination)

        XCTAssertTrue(captured)
    }

    func test_that_when_in_command_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        VimEngineController.shared.enterCommandMode()

        let globalHotkeyCombination = KeyCombination(key: .escape, command: true)
        let captured = GlobalEventsController.handle(globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
    
    func test_that_in_insert_mode_the_events_that_we_implemented_are_just_passed_back_to_macOS() {
        VimEngineController.shared.enterInsertMode()

        guard let jEvent = CGEvent(keyboardEventSource: nil, virtualKey: 38, keyDown: true) else { return XCTFail() }

        let implementedKeyCombination = KeyCombinationConverter.toKeyCombination(from: jEvent)
        let handled = GlobalEventsController.handle(implementedKeyCombination)
        
        XCTAssertFalse(handled)
    }

    func test_that_in_insert_mode_the_events_that_we_did_not_implement_are_just_passed_back_to_macOS() {
        VimEngineController.shared.enterInsertMode()

        guard let pEvent = CGEvent(keyboardEventSource: nil, virtualKey: 35, keyDown: true) else { return XCTFail() }

        let nomImplementedKeyCombination = KeyCombinationConverter.toKeyCombination(from: pEvent)
        let handled = GlobalEventsController.handle(nomImplementedKeyCombination)

        XCTAssertFalse(handled)
    }
    
    func test_that_in_command_mode_the_events_that_we_implemented_are_captured() {
        VimEngineController.shared.enterCommandMode()
        
        guard let jEvent = CGEvent(keyboardEventSource: nil, virtualKey: 38, keyDown: true) else { return XCTFail() }

        let implementedKeyCombination = KeyCombinationConverter.toKeyCombination(from: jEvent)
        let handled = GlobalEventsController.handle(implementedKeyCombination)
        
        XCTAssertTrue(handled)
    }

    func test_that_in_command_mode_the_events_that_we_did_not_implement_are_captured() {
        VimEngineController.shared.enterCommandMode()

        guard let pEvent = CGEvent(keyboardEventSource: nil, virtualKey: 35, keyDown: true) else { return XCTFail() }

        let nomImplementedKeyCombination = KeyCombinationConverter.toKeyCombination(from: pEvent)
        let handled = GlobalEventsController.handle(nomImplementedKeyCombination)

        XCTAssertTrue(handled)
    }

}
