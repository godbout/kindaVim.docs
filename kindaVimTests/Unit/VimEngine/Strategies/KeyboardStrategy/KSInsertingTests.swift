//
//  KSInsertingTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

@testable import kindaVim
import XCTest

class KSInsertingTests: XCTestCase {

    let keyboardStrategy = KeyboardStrategy()
    
    func test_that_I_gets_transformed_to_command_left() {
        let transformedKeys = keyboardStrategy.I()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
    func test_that_a_gets_transformed_to_right() {
        let transformedKeys = keyboardStrategy.a()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
    func test_that_A_gets_transformed_to_command_right() {
        let transformedKeys = keyboardStrategy.A()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }

    func test_that_o_gets_transformed_to_command_right_and_enter() {
        let transformedKeys = keyboardStrategy.o()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .enter)
        XCTAssertEqual(transformedKeys[1].action, .both)
    }
    
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
