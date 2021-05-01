//
//  KSInsertingTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

@testable import kindaVim
import XCTest

class KSInsertingTests: XCTestCase {
    
    func test_that_I_gets_transformed_to_command_left() {
        let transformedKeys = KeyboardStrategy.I()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .left)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_a_gets_transformed_to_right() {
        let transformedKeys = KeyboardStrategy.a()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_A_gets_transformed_to_command_right() {
        let transformedKeys = KeyboardStrategy.A()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }

    func test_that_o_gets_transformed_to_command_right_and_enter() {
        let transformedKeys = KeyboardStrategy.o()

        guard transformedKeys.count == 4 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
        XCTAssertEqual(transformedKeys[2].key, .enter)
        XCTAssertEqual(transformedKeys[2].action, .press)
        XCTAssertEqual(transformedKeys[3].key, .enter)
        XCTAssertEqual(transformedKeys[3].action, .release)
    }
    
    func test_that_O_gets_transformed_to_up_command_left_and_enter() {
        let transformedKeys = KeyboardStrategy.O()
        
        guard transformedKeys.count == 6 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .up)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .up)
        XCTAssertEqual(transformedKeys[1].action, .release)
        XCTAssertEqual(transformedKeys[2].key, .right)
        XCTAssertEqual(transformedKeys[2].command, true)
        XCTAssertEqual(transformedKeys[2].action, .press)
        XCTAssertEqual(transformedKeys[3].key, .right)
        XCTAssertEqual(transformedKeys[3].command, true)
        XCTAssertEqual(transformedKeys[3].action, .release)
        XCTAssertEqual(transformedKeys[4].key, .enter)
        XCTAssertEqual(transformedKeys[4].action, .press)
        XCTAssertEqual(transformedKeys[5].key, .enter)
        XCTAssertEqual(transformedKeys[5].action, .release)
    }
    
}
