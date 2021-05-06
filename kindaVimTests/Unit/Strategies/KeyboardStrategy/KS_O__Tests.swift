//
//  KS_O__Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class KS_O__Tests: XCTestCase {

    let keyboardStrategy = KeyboardStrategy()

}

extension KS_O__Tests {
    
    func test_that_O_gets_transformed_to_command_left_enter_up() {
        let transformedKeys = keyboardStrategy.O()
        
        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .enter)
        XCTAssertEqual(transformedKeys[1].action, .both)
        XCTAssertEqual(transformedKeys[2].key, .up)
        XCTAssertEqual(transformedKeys[2].action, .both)
    }
    
}
