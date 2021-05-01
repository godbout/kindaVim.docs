//
//  MotionsTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 28/04/2021.
//

@testable import kindaVim
import XCTest

class MotionsTests: XCTestCase {
    
    override func setUp() {
        VimEngineController.shared.enterCommandMode()
    }
    
}

// TODO: this will not be useful later
// as it will depend on which strategy is used
// so it will not always send back [KeyCombination]
// but for now the tests are more cleverly updated

extension MotionsTests {

    func test_that_k_is_getting_transformed_to_up() {
        let k = KeyCombination(key: .k, command: false, fn: true, shift: true)

        let transformedKeys = VimEngineController.shared.transform(from: k)
        
        XCTAssertEqual(
            transformedKeys,
            KeyboardStrategy.k()
        )
    }
    
    func test_that_j_is_getting_transformed_to_down() {
        let j = KeyCombination(key: .j)
        
        let transformedKeys = VimEngineController.shared.transform(from: j)

        XCTAssertEqual(
            transformedKeys,
            KeyboardStrategy.j()
        )
    }
    
    func test_that_h_is_getting_transformed_to_left() {
        let h = KeyCombination(key: .h)
        
        let transformedKeys = VimEngineController.shared.transform(from: h)
        
        XCTAssertEqual(
            transformedKeys,
            KeyboardStrategy.h()
        )
    }
    
    func test_that_l_is_getting_transformed_to_right() {
        let l = KeyCombination(key: .l)
        
        let transformedKeys = VimEngineController.shared.transform(from: l)

        XCTAssertEqual(
            transformedKeys,
            KeyboardStrategy.l()
        )
    }
    
    func test_that_b_is_getting_transformed_to_alt_left() {
        let b = KeyCombination(key: .b)
        
        let transformedKeys = VimEngineController.shared.transform(from: b)

        XCTAssertEqual(
            transformedKeys,
            KeyboardStrategy.b()
        )
    }
    
    func test_that_gg_is_getting_transformed_to_command_up() {
        let g = KeyCombination(key: .g)

        _ = VimEngineController.shared.transform(from: g)
        let transformedKeys = VimEngineController.shared.transform(from: g)

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .up)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .up)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_G_is_getting_transformed_to_command_down() {
        let G = KeyCombination(key: .g, shift: true)

        let transformedKeys = VimEngineController.shared.transform(from: G)

        XCTAssertEqual(
            transformedKeys,
            KeyboardStrategy.G()
        )
    }
    
}

