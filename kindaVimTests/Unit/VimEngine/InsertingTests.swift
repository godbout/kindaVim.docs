//
//  InsertingTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 28/04/2021.
//

@testable import kindaVim
import XCTest

class InsertingTests: XCTestCase {
    
    override func setUp() {
        VimEngineController.shared.enterCommandMode()
    }
}

extension InsertingTests {

    func test_that_i_does_not_get_transformed() {
        let i = KeyCombination(key: .i)

        let transformedKeys = VimEngineController.shared.transform(from: i)

        XCTAssertEqual(transformedKeys.count, 0)
    }

    func test_that_i_switches_Vim_to_insert_mode() {
        let i = KeyCombination(key: .i)
        _ = VimEngineController.shared.transform(from: i)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_o_gets_transformed_to_command_right_and_enter() {
        let o = KeyCombination(key: .o)

        let transformedKeys = VimEngineController.shared.transform(from: o)

        XCTAssertEqual(
            transformedKeys,
            KeyboardStrategy.o()
        )
    }

    func test_that_o_switches_Vim_to_insert_mode() {
        let o = KeyCombination(key: .o)
        _ = VimEngineController.shared.transform(from: o)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
    func test_that_O_gets_transformed_to_up_command_left_and_enter() {
        let O = KeyCombination(key: .o, shift: true)

        let transformedKeys = VimEngineController.shared.transform(from: O)
        
        XCTAssertEqual(
            transformedKeys,
            KeyboardStrategy.O()
        )
    }

    func test_that_O_switches_Vim_to_insert_mode() {
        let O = KeyCombination(key: .o, shift: true)
        _ = VimEngineController.shared.transform(from: O)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_I_gets_transformed_to_command_left() {
        let I = KeyCombination(key: .i, shift: true)

        let transformedKeys = VimEngineController.shared.transform(from: I)
        
        XCTAssertEqual(
            transformedKeys,
            KeyboardStrategy.I()
        )
    }

    func test_that_I_switches_Vim_to_insert_mode() {
        let I = KeyCombination(key: .i, shift: true)
        _ = VimEngineController.shared.transform(from: I)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
    func test_that_a_gets_transformed_to_right() {
        let a = KeyCombination(key: .a)

        let transformedKeys = VimEngineController.shared.transform(from: a)
        
        XCTAssertEqual(
            transformedKeys,
            KeyboardStrategy.a()
        )        
    }
    
    func test_that_a_switches_Vim_to_insert_mode() {
        let a = KeyCombination(key: .a)
        _ = VimEngineController.shared.transform(from: a)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
    func test_that_A_gets_transformed_to_command_right() {
        let A = KeyCombination(key: .a, shift: true)

        let transformedKeys = VimEngineController.shared.transform(from: A)

        XCTAssertEqual(
            transformedKeys,
            KeyboardStrategy.A()
        )
    }
    
    func test_that_A_switches_Vim_to_insert_mode() {
        let A = KeyCombination(key: .a, shift: true)
        _ = VimEngineController.shared.transform(from: A)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
}
