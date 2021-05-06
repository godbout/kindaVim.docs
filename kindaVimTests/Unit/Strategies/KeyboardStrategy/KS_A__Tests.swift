//
//  KS__A__Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class KS_A__Tests: XCTestCase {

    let keyboardStrategy = KeyboardStrategy()

}

extension KS_A__Tests {
    
    func test_that_A_gets_transformed_to_command_right() {
        let transformedKeys = keyboardStrategy.A()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
}
