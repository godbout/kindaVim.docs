//
//  InsertModeTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 04/05/2021.
//

@testable import kindaVim
import XCTest

class InsertModeTests: XCTestCase {

    override func setUp() {
        VimEngineController.shared.enterCommandMode()
    }

}

extension InsertModeTests {

    func test_that_a_switches_Vim_to_insert_mode() {
        let a = KeyCombination(key: .a)
        VimEngineController.shared.handle(keyCombination: a)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_A_switches_Vim_to_insert_mode() {
        let A = KeyCombination(key: .a, shift: true)
        VimEngineController.shared.handle(keyCombination: A)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_cc_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        let c = KeyCombination(key: .c)
        VimEngineController.shared.handle(keyCombination: c)
        VimEngineController.shared.handle(keyCombination: c)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_ciw_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_i_switches_Vim_to_insert_mode() {
        let i = KeyCombination(key: .i)
        VimEngineController.shared.handle(keyCombination: i)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_I_switches_Vim_to_insert_mode() {
        let I = KeyCombination(key: .i, shift: true)
        VimEngineController.shared.handle(keyCombination: I)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_o_switches_Vim_to_insert_mode() {
        let o = KeyCombination(key: .o)
        VimEngineController.shared.handle(keyCombination: o)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_O_switches_Vim_to_insert_mode() {
        let O = KeyCombination(key: .o, shift: true)
        VimEngineController.shared.handle(keyCombination: O)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
}
