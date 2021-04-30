//
//  MotionsTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 28/04/2021.
//

@testable import kindaVim
import XCTest

class MotionsTests: XCTestCase {

    func test_that_k_is_getting_transformed_to_up() {
        let k = KeyCombination(key: .k, command: false, fn: true, shift: true)

        let transformedKeys = VimEngineController.shared.transform(from: k)

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .up)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .up)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_j_is_getting_transformed_to_down() {
        let j = KeyCombination(key: .j)
        
        let transformedKeys = VimEngineController.shared.transform(from: j)

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .down)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .down)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_h_is_getting_transformed_to_left() {
        let h = KeyCombination(key: .h)
        
        let transformedKeys = VimEngineController.shared.transform(from: h)
        
        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .left)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_l_is_getting_transformed_to_right() {
        let l = KeyCombination(key: .l)
        
        let transformedKeys = VimEngineController.shared.transform(from: l)

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_b_is_getting_transformed_to_alt_left() {
        let b = KeyCombination(key: .b)
        
        let transformedKeys = VimEngineController.shared.transform(from: b)

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].option, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .left)
        XCTAssertEqual(transformedKeys[1].option, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
}

