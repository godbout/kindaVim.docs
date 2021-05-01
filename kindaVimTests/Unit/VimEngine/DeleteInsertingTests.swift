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
    
    func test_that_cc_is_getting_transformed_to_command_right_command_shift_left_delete() {
        let c = KeyCombination(key: .c)

        _ = VimEngineController.shared.transform(from: c)
        let transformedKeys = VimEngineController.shared.transform(from: c)

        guard transformedKeys.count == 6 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
        XCTAssertEqual(transformedKeys[2].key, .left)
        XCTAssertEqual(transformedKeys[2].command, true)
        XCTAssertEqual(transformedKeys[2].shift, true)
        XCTAssertEqual(transformedKeys[2].action, .press)
        XCTAssertEqual(transformedKeys[3].key, .left)
        XCTAssertEqual(transformedKeys[3].command, true)
        XCTAssertEqual(transformedKeys[3].shift, true)
        XCTAssertEqual(transformedKeys[3].action, .release)
        XCTAssertEqual(transformedKeys[4].key, .delete)
        XCTAssertEqual(transformedKeys[4].action, .press)
        XCTAssertEqual(transformedKeys[5].key, .delete)
        XCTAssertEqual(transformedKeys[5].action, .release)
    }
    
    func test_that_cc_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        let c = KeyCombination(key: .c)
        _ = VimEngineController.shared.transform(from: c)
        _ = VimEngineController.shared.transform(from: c)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
}
