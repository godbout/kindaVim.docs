//
//  KSDeleteInsertingTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

@testable import kindaVim
import XCTest

class KSDeleteInsertingTests: XCTestCase {

    func test_that_C_is_getting_transformed_to_command_shift_right_delete() {
        let transformedKeys = KeyboardStrategy.C()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].shift, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .delete)
        XCTAssertEqual(transformedKeys[1].action, .both)
    }
    
    func test_that_cc_is_getting_transformed_to_command_right_command_shift_left_delete() {
        let transformedKeys = KeyboardStrategy.cc()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .left)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].shift, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
        XCTAssertEqual(transformedKeys[2].key, .delete)
        XCTAssertEqual(transformedKeys[2].action, .both)
    }
    
    func test_that_ciw_is_getting_transformed_to_option_right_option_left_delete() {
        let transformedKeys = KeyboardStrategy.ciw()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].option, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .left)
        XCTAssertEqual(transformedKeys[1].option, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
        XCTAssertEqual(transformedKeys[2].key, .delete)
        XCTAssertEqual(transformedKeys[2].action, .both)
    }

}
