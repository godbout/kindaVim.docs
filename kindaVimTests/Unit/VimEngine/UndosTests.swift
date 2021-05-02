//
//  UndosTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 28/04/2021.
//

@testable import kindaVim
import XCTest

class UndosTests: XCTestCase {
    
    override func setUp() {
        VimEngineController.shared.enterCommandMode()
    }
    
}

extension UndosTests {
    
    func test_that_u_is_handled() {
        let u = KeyCombination(key: .u)

        let handled = VimEngineController.shared.transform(from: u)
        
        XCTAssertTrue(handled)
    }
    
    func test_that_ctrl_r_is_handled() {
        let controlR = KeyCombination(key: .r, control: true)

        let handled = VimEngineController.shared.transform(from: controlR)
        
        XCTAssertTrue(handled)
    }
    
}
