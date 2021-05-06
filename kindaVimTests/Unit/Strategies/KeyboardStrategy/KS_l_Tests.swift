//
//  KS_l_Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class KS_l_Tests: XCTestCase {

    let keyboardStrategy = KeyboardStrategy()

}

extension KS_l_Tests {
    
    func test_that_l_is_getting_transformed_to_right() {
        let transformedKeys = keyboardStrategy.l()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
}
