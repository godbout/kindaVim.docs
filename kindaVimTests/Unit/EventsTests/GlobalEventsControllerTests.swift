//
//  GlobalEventsControllerTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 27/04/2021.
//

@testable import kindaVim
import XCTest

class GlobalEventsControllerTests: XCTestCase {
    
    func test_that_the_global_hotkey_press_sets_Vim_in_command_mode() {
        VimEngineController.shared.enterInsertMode()
        
        let globalHotkeyCombination = KeyCombination(key: .escape, command: true)
        _ = GlobalEventsController.handle(globalHotkeyCombination)
        
        let currentVimMode = VimEngineController.shared.currentMode

        XCTAssertEqual(currentVimMode, .command)
    }
    
    func test_that_in_insert_mode_the_events_are_just_passed_back_to_macOS() {
        VimEngineController.shared.enterInsertMode()
        
        let originalKeyCombination = KeyCombination(key: .j)
        let handled = GlobalEventsController.handle(originalKeyCombination)
        
        XCTAssertFalse(handled)
    }
    
    func test_that_in_command_mode_the_events_are_transformed() {
        VimEngineController.shared.enterCommandMode()
        
        let originalKeyCombination = KeyCombination(key: .j)
        let handled = GlobalEventsController.handle(originalKeyCombination)
        
        XCTAssertTrue(handled)
    }

    func test_that_events_that_do_not_have_a_VimKey_equivalent_are_transformed() {
        VimEngineController.shared.enterCommandMode()

        let keyWithoutVimEquivalent = KeyCombination(key: .z, shift: true)

        XCTAssertTrue(GlobalEventsController.handle(keyWithoutVimEquivalent))
    }

    func test_that_events_that_do_not_have_a_VimKey_equivalent_do_nothing() {
        // TODO
        // not sure how to do that yet. Strategy returned is nil?
    }

}
