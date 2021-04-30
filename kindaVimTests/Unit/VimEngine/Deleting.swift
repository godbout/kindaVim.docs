//
//  Deleting.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 30/04/2021.
//

@testable import kindaVim
import XCTest

class Deleting: XCTestCase {

    func test_that_x_gets_transformed_to_right_delete() {
        let x = KeyCombination(key: .x)

        let transformedKeys = VimEngineController.shared.transform(from: x)

        guard transformedKeys.count == 4 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].action, .release)
        XCTAssertEqual(transformedKeys[2].key, .delete)
        XCTAssertEqual(transformedKeys[2].action, .press)
        XCTAssertEqual(transformedKeys[3].key, .delete)
        XCTAssertEqual(transformedKeys[3].action, .release)
    }
    
    func test_that_X_gets_transformed_to_delete() {
        let X = KeyCombination(key: .x, shift: true)

        let transformedKeys = VimEngineController.shared.transform(from: X)

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .delete)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .delete)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }

}
