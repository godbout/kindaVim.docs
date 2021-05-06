//
//  KS_j_Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class KS_j_Tests: KS_BaseTests {
    
    func test_that_j_is_getting_transformed_to_down() {
        let transformedKeys = keyboardStrategy.j()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .down)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
}
