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

    func test_that_o_gets_transformed_to_up_command_left_and_enter() {
        let o = KeyCombination(key: .o)

        let transformedKeys = VimEngineController.shared.transform(from: o)

        XCTAssertEqual(transformedKeys.count, 6)
        XCTAssertEqual(transformedKeys.first?.key, .up)
        XCTAssertEqual(transformedKeys.first?.action, .press)
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

}
