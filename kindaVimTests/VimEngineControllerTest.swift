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
    
    func test_that_k_moves_up() {
        let k = KeyCombination(key: .k, command: false, fn: true, shift: true)

        let transformedKey = VimEngineController.shared.transform(from: k)
        
        XCTAssertEqual(transformedKey.key, .up)
    }
    
    func test_that_j_moves_down() {
        let j = KeyCombination(key: .j)
        
        let transformedKey = VimEngineController.shared.transform(from: j)
        
        XCTAssertEqual(transformedKey.key, .down)
    }
    
}
