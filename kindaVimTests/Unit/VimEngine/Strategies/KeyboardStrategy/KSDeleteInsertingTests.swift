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

        guard transformedKeys.count == 4 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].shift, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].shift, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
        XCTAssertEqual(transformedKeys[2].key, .delete)
        XCTAssertEqual(transformedKeys[2].action, .press)
        XCTAssertEqual(transformedKeys[3].key, .delete)
        XCTAssertEqual(transformedKeys[3].action, .release)
    }

}
