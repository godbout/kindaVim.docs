//
//  KS_a_Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class KS_a_Tests: KS_BaseTests {
    
    func test_that_a_gets_transformed_to_right() {
        let transformedKeys = keyboardStrategy.a()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }

}
