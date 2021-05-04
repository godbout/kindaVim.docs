//
//  OperatorPendingModeTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 04/05/2021.
//

@testable import kindaVim
import XCTest

class OperatorPendingModeTests: XCTestCase {

    override func setUp() {
        VimEngineController.shared.enterCommandMode()
    }
}

extension OperatorPendingModeTests {

    func test_that_after_the_first_g_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngineController.shared.currentMode, .operatorPending)

        let g = KeyCombination(key: .g)
        VimEngineController.shared.handle(keyCombination: g)

        XCTAssertEqual(VimEngineController.shared.currentMode, .operatorPending)
    }

    func test_that_after_the_first_c_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngineController.shared.currentMode, .operatorPending)

        let c = KeyCombination(key: .c)
        VimEngineController.shared.handle(keyCombination: c)

        XCTAssertEqual(VimEngineController.shared.currentMode, .operatorPending)
    }

    func test_that_after_the_first_d_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngineController.shared.currentMode, .operatorPending)

        let d = KeyCombination(key: .d)
        VimEngineController.shared.handle(keyCombination: d)

        XCTAssertEqual(VimEngineController.shared.currentMode, .operatorPending)
    }
    
}
