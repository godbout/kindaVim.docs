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

        XCTAssertEqual(transformedKeys.count, 2)
        XCTAssertEqual(transformedKeys.first?.key, .up)
        XCTAssertEqual(transformedKeys.first?.action, .press)
        XCTAssertEqual(transformedKeys[1].key, .up)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_j_is_getting_transformed_to_down() {
        let j = KeyCombination(key: .j)
        
        let transformedKeys = VimEngineController.shared.transform(from: j)
        
        XCTAssertEqual(transformedKeys.count, 2)
        XCTAssertEqual(transformedKeys.first?.key, .down)
        XCTAssertEqual(transformedKeys.first?.action, .press)
        XCTAssertEqual(transformedKeys[1].key, .down)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_h_is_getting_transformed_to_left() {
        let h = KeyCombination(key: .h)
        
        let transformedKeys = VimEngineController.shared.transform(from: h)
        
        XCTAssertEqual(transformedKeys.count, 2)
        XCTAssertEqual(transformedKeys.first?.key, .left)
        XCTAssertEqual(transformedKeys.first?.action, .press)
        XCTAssertEqual(transformedKeys[1].key, .left)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }

}
