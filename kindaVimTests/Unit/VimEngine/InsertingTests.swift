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

    func test_that_i_is_handled() {
        let i = KeyCombination(key: .i)

        let handled = VimEngineController.shared.transform(from: i)
        
        XCTAssertTrue(handled)
    }

    func test_that_i_switches_Vim_to_insert_mode() {
        let i = KeyCombination(key: .i)
        _ = VimEngineController.shared.transform(from: i)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_o_is_handled() {
        let o = KeyCombination(key: .o)

        let handled = VimEngineController.shared.transform(from: o)
        
        XCTAssertTrue(handled)
    }

    func test_that_o_switches_Vim_to_insert_mode() {
        let o = KeyCombination(key: .o)
        _ = VimEngineController.shared.transform(from: o)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
    func test_that_O_is_handled() {
        let O = KeyCombination(key: .o, shift: true)

        let handled = VimEngineController.shared.transform(from: O)
        
        XCTAssertTrue(handled)
    }

    func test_that_O_switches_Vim_to_insert_mode() {
        let O = KeyCombination(key: .o, shift: true)
        _ = VimEngineController.shared.transform(from: O)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

    func test_that_I_is_handled() {
        let I = KeyCombination(key: .i, shift: true)

        let handled = VimEngineController.shared.transform(from: I)
        
        XCTAssertTrue(handled)
    }

    func test_that_I_switches_Vim_to_insert_mode() {
        let I = KeyCombination(key: .i, shift: true)
        _ = VimEngineController.shared.transform(from: I)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
    func test_that_a_is_handled() {
        let a = KeyCombination(key: .a)

        let handled = VimEngineController.shared.transform(from: a)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_a_switches_Vim_to_insert_mode() {
        let a = KeyCombination(key: .a)
        _ = VimEngineController.shared.transform(from: a)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
    func test_that_A_is_handled() {
        let A = KeyCombination(key: .a, shift: true)

        let handled = VimEngineController.shared.transform(from: A)

        XCTAssertTrue(handled)
    }
    
    func test_that_A_switches_Vim_to_insert_mode() {
        let A = KeyCombination(key: .a, shift: true)
        _ = VimEngineController.shared.transform(from: A)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
}
