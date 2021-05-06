//
//  KS_I__Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class KS_I__Tests: XCTestCase {

    let keyboardStrategy = KeyboardStrategy()

}

extension KS_I__Tests {
    
    func test_that_I_gets_transformed_to_command_left() {
        let transformedKeys = keyboardStrategy.I()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
}
