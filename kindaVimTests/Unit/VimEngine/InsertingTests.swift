//
//  InsertingTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 28/04/2021.
//

@testable import kindaVim
import XCTest

class InsertingTests: XCTestCase {

    func test_that_i_does_not_get_transformed() {
        let i = KeyCombination(key: .i)

        let transformedKeys = VimEngineController.shared.transform(from: i)

        XCTAssertEqual(transformedKeys.count, 0)
    }

    func test_that_i_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        let i = KeyCombination(key: .i)
        _ = VimEngineController.shared.transform(from: i)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_o_gets_transformed_to_up_command_left_and_enter() {
        let o = KeyCombination(key: .o)

        let transformedKeys = VimEngineController.shared.transform(from: o)

        guard transformedKeys.count == 4 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
        XCTAssertEqual(transformedKeys[2].key, .enter)
        XCTAssertEqual(transformedKeys[2].action, .press)
        XCTAssertEqual(transformedKeys[3].key, .enter)
        XCTAssertEqual(transformedKeys[3].action, .release)
    }

    func test_that_o_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        let o = KeyCombination(key: .o)
        _ = VimEngineController.shared.transform(from: o)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
    func test_that_O_gets_transformed_to_up_command_left_and_enter() {
        let O = KeyCombination(key: .o, shift: true)

        let transformedKeys = VimEngineController.shared.transform(from: O)

        guard transformedKeys.count == 6 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .up)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .up)
        XCTAssertEqual(transformedKeys[1].action, .release)
        XCTAssertEqual(transformedKeys[2].key, .right)
        XCTAssertEqual(transformedKeys[2].command, true)
        XCTAssertEqual(transformedKeys[2].action, .press)
        XCTAssertEqual(transformedKeys[3].key, .right)
        XCTAssertEqual(transformedKeys[3].command, true)
        XCTAssertEqual(transformedKeys[3].action, .release)
        XCTAssertEqual(transformedKeys[4].key, .enter)
        XCTAssertEqual(transformedKeys[4].action, .press)
        XCTAssertEqual(transformedKeys[5].key, .enter)
        XCTAssertEqual(transformedKeys[5].action, .release)
    }

    func test_that_O_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        let O = KeyCombination(key: .o, shift: true)
        _ = VimEngineController.shared.transform(from: O)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_I_gets_transformed_to_command_left() {
        let I = KeyCombination(key: .i, shift: true)

        let transformedKeys = VimEngineController.shared.transform(from: I)

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .left)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }

    func test_that_I_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        let I = KeyCombination(key: .i, shift: true)
        _ = VimEngineController.shared.transform(from: I)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
    func test_that_a_gets_transformed_to_right() {
        let a = KeyCombination(key: .a)

        let transformedKeys = VimEngineController.shared.transform(from: a)

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_a_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        let a = KeyCombination(key: .a)
        _ = VimEngineController.shared.transform(from: a)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
    func test_that_A_gets_transformed_to_command_right() {
        let A = KeyCombination(key: .a, shift: true)

        let transformedKeys = VimEngineController.shared.transform(from: A)

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_A_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        let A = KeyCombination(key: .a, shift: true)
        _ = VimEngineController.shared.transform(from: A)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
}
