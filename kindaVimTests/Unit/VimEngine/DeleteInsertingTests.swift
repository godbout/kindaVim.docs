//
//  DeleteInsertingTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 01/05/2021.
//

@testable import kindaVim
import XCTest

class DeleteInsertingTests: XCTestCase {
    
    override func setUp() {
        VimEngineController.shared.enterCommandMode()
    }

}

extension DeleteInsertingTests {

    func test_that_C_is_handled() {
        let C = KeyCombination(key: .c, shift: true)

        let handled = VimEngineController.shared.transform(from: C)

        XCTAssertTrue(handled)
    }
    
    func test_that_cc_is_handled() {
        let c = KeyCombination(key: .c)

        _ = VimEngineController.shared.transform(from: c)
        let handled = VimEngineController.shared.transform(from: c)

        XCTAssertTrue(handled)
    }
    
    func test_that_cc_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        let c = KeyCombination(key: .c)
        _ = VimEngineController.shared.transform(from: c)
        _ = VimEngineController.shared.transform(from: c)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
    func test_that_ciw_is_handled() {
        let c = KeyCombination(key: .c)
        let i = KeyCombination(key: .i)
        let w = KeyCombination(key: .w)

        _ = VimEngineController.shared.transform(from: c)
        _ = VimEngineController.shared.transform(from: i)
        let handled = VimEngineController.shared.transform(from: w)

        XCTAssertTrue(handled)
    }
    
    func test_that_ciw_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        _ = VimEngineController.shared.transform(from: KeyCombination(key: .c))
        _ = VimEngineController.shared.transform(from: KeyCombination(key: .i))
        _ = VimEngineController.shared.transform(from: KeyCombination(key: .w))

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
}
