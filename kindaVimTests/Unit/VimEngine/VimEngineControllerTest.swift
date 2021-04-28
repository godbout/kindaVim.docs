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
    
    func test_that_i_does_not_get_transformed() {
        let i = KeyCombination(key: .i)
        
        let transformedKeys = VimEngineController.shared.transform(from: i)
        
        XCTAssertEqual(transformedKeys.count, 0)
    }
        
}
