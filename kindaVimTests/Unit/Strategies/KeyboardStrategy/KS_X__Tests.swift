//
//  KS_X__Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class KS_X__Tests: XCTestCase {

    let keyboardStrategy = KeyboardStrategy()

}

extension KS_X__Tests {
    
    func test_that_X_is_getting_transformed_to_delete() {
        let transformedKeys = keyboardStrategy.X()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .delete)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
}


