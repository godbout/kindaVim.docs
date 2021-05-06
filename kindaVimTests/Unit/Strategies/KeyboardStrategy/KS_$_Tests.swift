//
//  KS_$_Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest


class KS_$_Tests: XCTestCase {
    
    let keyboardStrategy = KeyboardStrategy()
    
}

extension KS_$_Tests {

    func test_that_$_is_getting_transformed_to_control_a() {
        let transformedKeys = keyboardStrategy.dollarSign()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
    }

}
