//
//  OperatorsTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 01/05/2021.
//

@testable import kindaVim
import XCTest

class OperatorsTests: XCTestCase {
    
    override func setUp() {
        VimEngineController.shared.enterCommandMode()
    }
    
}

extension OperatorsTests {
    
    func test_that_after_the_first_g_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngineController.shared.currentMode, .operatorPending)
        
        let g = KeyCombination(key: .g)
        _ = VimEngineController.shared.transform(from: g)
        
        XCTAssertEqual(VimEngineController.shared.currentMode, .operatorPending)
    }
    
    func test_that_after_the_first_c_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngineController.shared.currentMode, .operatorPending)
        
        let c = KeyCombination(key: .c)
        _ = VimEngineController.shared.transform(from: c)
        
        XCTAssertEqual(VimEngineController.shared.currentMode, .operatorPending)
    }
    
    func test_that_after_the_first_d_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngineController.shared.currentMode, .operatorPending)
        
        let d = KeyCombination(key: .d)
        _ = VimEngineController.shared.transform(from: d)
        
        XCTAssertEqual(VimEngineController.shared.currentMode, .operatorPending)
    }
    
}
