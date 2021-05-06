//
//  c_Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class c_Tests: BaseTests {
    
    func test_that_c_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .c)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    func test_that_after_the_first_c_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngineController.shared.currentMode, .operatorPending)

        let c = KeyCombination(key: .c)
        VimEngineController.shared.handle(keyCombination: c)

        XCTAssertEqual(VimEngineController.shared.currentMode, .operatorPending)
    }

}
