//
//  KS_h_Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class KS_h_Tests: KS_BaseTests {
    
    func test_that_h_is_getting_transformed_to_left() {
        let transformedKeys = keyboardStrategy.h()
        
        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
}
