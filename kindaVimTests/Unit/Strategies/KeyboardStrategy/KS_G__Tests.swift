//
//  KS_G__Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class KS_G__Tests: XCTestCase {

    let keyboardStrategy = KeyboardStrategy()

}

extension KS_G__Tests {
    
    func test_that_G_is_getting_transformed_to_command_down() {
        let transformedKeys = keyboardStrategy.G()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .down)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
}
