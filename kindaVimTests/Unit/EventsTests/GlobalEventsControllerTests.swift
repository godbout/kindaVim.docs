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
        let startingVimMode = VimEngineController.shared.currentMode
        
        let globalHotkeyCombination = KeyCombination(key: .escape, command: true)
        _ = GlobalEventsController.handle(globalHotkeyCombination)
        
        let currentVimMode = VimEngineController.shared.currentMode

        XCTAssertEqual(startingVimMode, .insert)
        XCTAssertEqual(currentVimMode, .command)
    }
    
    func test_that_in_insert_mode_the_events_are_just_passed_back_to_macOS() {
        VimEngineController.shared.enterInsertMode()
        
        let originalKeyCombination = KeyCombination(key: .j)
        let handledKeyCombinations = GlobalEventsController.handle(originalKeyCombination)
            
        XCTAssertEqual([originalKeyCombination], handledKeyCombinations)
    }
    
    func test_that_in_command_mode_the_events_are_transformed() {
        VimEngineController.shared.enterCommandMode()
        
        let originalKeyCombination = KeyCombination(key: .j)
        let transformedKeyCombinations = GlobalEventsController.handle(originalKeyCombination)
            
        XCTAssertNotEqual([originalKeyCombination], transformedKeyCombinations)
        XCTAssertEqual(transformedKeyCombinations?.first?.key, .down)
    }

}
