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

extension MotionsTests {

    func test_that_k_is_handled() {
        let k = KeyCombination(key: .k, shift: true, command: false, fn: true)

        let handled = VimEngineController.shared.transform(from: k)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_j_is_handled() {
        let j = KeyCombination(key: .j)
        
        let handled = VimEngineController.shared.transform(from: j)

        XCTAssertTrue(handled)
    }
    
    func test_that_h_is_handled() {
        let h = KeyCombination(key: .h)
        
        let handled = VimEngineController.shared.transform(from: h)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_l_is_handled() {
        let l = KeyCombination(key: .l)
        
        let handled = VimEngineController.shared.transform(from: l)

        XCTAssertTrue(handled)
    }
    
    func test_that_b_is_handled() {
        let b = KeyCombination(key: .b)
        
        let handled = VimEngineController.shared.transform(from: b)

        XCTAssertTrue(handled)
    }
    
    func test_that_gg_is_handled() {
        let g = KeyCombination(key: .g)

        _ = VimEngineController.shared.transform(from: g)
        let handled = VimEngineController.shared.transform(from: g)

        XCTAssertTrue(handled)
    }
    
    func test_that_G_is_handled() {
        let G = KeyCombination(key: .g, shift: true)

        let handled = VimEngineController.shared.transform(from: G)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_0_is_handled() {
        let zero = KeyCombination(key: .zero)
        
        let handled = VimEngineController.shared.transform(from: zero)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_$_is_handled() {
        let dollarSign = KeyCombination(key: .four, shift: true)
        
        let handled = VimEngineController.shared.transform(from: dollarSign)
        
        XCTAssertTrue(handled)
    }
    
    func test_that___is_handled() {
        let underscore = KeyCombination(key: .minus, shift: true)
        
        let handled = VimEngineController.shared.transform(from: underscore)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_w_is_handled() {
        let w = KeyCombination(key: .w)
        
        let handled = VimEngineController.shared.transform(from: w)
        
        XCTAssertTrue(handled)
    }
    
}

