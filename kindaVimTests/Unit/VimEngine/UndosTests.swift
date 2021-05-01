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
    
    func test_that_u_gets_transformed_to_command_z() {
        let u = KeyCombination(key: .u)

        let transformedKeys = VimEngineController.shared.transform(from: u)
        
        XCTAssertEqual(
            transformedKeys,
            VimEngineController.shared.keyboardStrategy.u()
        )
    }
    
    func test_that_ctrl_r_gets_transformed_to_command_shift_z() {
        let controlR = KeyCombination(key: .r, control: true)

        let transformedKeys = VimEngineController.shared.transform(from: controlR)

        XCTAssertEqual(
            transformedKeys,
            VimEngineController.shared.keyboardStrategy.controlR()
        )
    }
    
}
