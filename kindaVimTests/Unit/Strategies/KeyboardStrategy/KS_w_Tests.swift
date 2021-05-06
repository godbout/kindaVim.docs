//
//  KS_w_Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class KS_w_Tests: XCTestCase {

    let keyboardStrategy = KeyboardStrategy()

}

extension KS_w_Tests {
    
    func test_that_w_is_getting_transformed_to_option_right_option_right_option_left() {
        let transformedKeys = keyboardStrategy.w()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].option, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].option, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
        XCTAssertEqual(transformedKeys[2].key, .left)
        XCTAssertEqual(transformedKeys[2].option, true)
        XCTAssertEqual(transformedKeys[2].action, .both)
    }
    
}


