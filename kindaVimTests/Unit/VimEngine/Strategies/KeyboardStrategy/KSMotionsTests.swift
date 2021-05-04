//
//  KeyboardStrategyTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

@testable import kindaVim
import XCTest

class KSMotionsTests: XCTestCase {
    
    func test_that_h_is_getting_transformed_to_left() {
        let transformedKeys = KeyboardStrategy.h()
        
        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
    func test_that_j_is_getting_transformed_to_down() {
        let transformedKeys = KeyboardStrategy.j()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .down)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
    func test_that_k_is_getting_transformed_to_up() {
        let transformedKeys = KeyboardStrategy.k()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .up)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }

    func test_that_l_is_getting_transformed_to_right() {
        let transformedKeys = KeyboardStrategy.l()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
    func test_that_b_is_getting_transformed_to_alt_left() {
        let transformedKeys = KeyboardStrategy.b()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].option, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
    func test_that_gg_is_getting_transformed_to_command_up() {
        let transformedKeys = KeyboardStrategy.gg()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .up)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
    func test_that_G_is_getting_transformed_to_command_down() {
        let transformedKeys = KeyboardStrategy.G()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .down)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
    func test_that_0_is_getting_transformed_to_control_a() {
        let transformedKeys = KeyboardStrategy.zero()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .a)
        XCTAssertEqual(transformedKeys[0].control, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
    func test_that_$_is_getting_transformed_to_control_a() {
        let transformedKeys = KeyboardStrategy.dollarSign()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
    }
    
    func test_that___is_getting_transformed_to_control_a_option_right_option_left() {
        let transformedKeys = KeyboardStrategy.underscore()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .a)
        XCTAssertEqual(transformedKeys[0].control, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].option, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
        XCTAssertEqual(transformedKeys[2].key, .left)
        XCTAssertEqual(transformedKeys[2].option, true)
        XCTAssertEqual(transformedKeys[2].action, .both)
    }
    
    func test_that_w_is_getting_transformed_to_option_right_option_right_option_left() {
        let transformedKeys = KeyboardStrategy.w()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].option, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].option, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
        XCTAssertEqual(transformedKeys[2].key, .left)
        XCTAssertEqual(transformedKeys[2].option, true)
        XCTAssertEqual(transformedKeys[2].action, .both)
    }

}
