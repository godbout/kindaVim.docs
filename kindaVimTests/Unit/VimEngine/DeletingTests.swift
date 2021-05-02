//
//  DeletingTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

@testable import kindaVim
import XCTest

class DeletingTests: XCTestCase {
    
    override func setUp() {
        VimEngineController.shared.enterCommandMode()
    }

}

extension DeletingTests {
    
    func test_that_x_is_handled() {
        let x = KeyCombination(key: .x)

        let handled = VimEngineController.shared.transform(from: x)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_X_is_handled() {
        let X = KeyCombination(key: .x, shift: true)

        let handled = VimEngineController.shared.transform(from: X)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_dd_is_handled() {
        let d = KeyCombination(key: .d)

        _ = VimEngineController.shared.transform(from: d)
        let handled = VimEngineController.shared.transform(from: d)
        
        XCTAssertTrue(handled)
    }
    
}
