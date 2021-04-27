//
//  VimEngineControllerTest.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 23/04/2021.
//

@testable import kindaVim
import XCTest

class VimEngineControllerTest: XCTestCase {}

extension VimEngineControllerTest {
    
    func test_that_k_moves_up() throws {
        let k = KeyCombination(key: .k, command: false, fn: true, shift: true)

        let transformedKeys = VimEngineController.shared.transform(from: k)

        XCTAssertEqual(transformedKeys.count, 1)
        XCTAssertEqual(transformedKeys.first?.key, .up)
    }
    
    func test_that_j_moves_down() {
        let j = KeyCombination(key: .j)
        
        let transformedKeys = VimEngineController.shared.transform(from: j)
        
        XCTAssertEqual(transformedKeys.count, 1)
        XCTAssertEqual(transformedKeys.first?.key, .down)
    }
    
    func test_that_i_does_not_get_transformed() {
        let i = KeyCombination(key: .i)
        
        let transformedKeys = VimEngineController.shared.transform(from: i)
        
        XCTAssertEqual(transformedKeys.count, 0)
    }
    
}
