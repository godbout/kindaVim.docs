//
//  KSUndosTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

@testable import kindaVim
import XCTest

class KSUndosTests: XCTestCase {
    
    func test_that_u_gets_transformed_to_command_z() {
        let transformedKeys = VimEngineController.shared.keyboardStrategy.u()
        
        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .z)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .z)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_ctrl_r_gets_transformed_to_command_shift_z() {
        let transformedKeys = VimEngineController.shared.keyboardStrategy.controlR()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .z)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].shift, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .z)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].shift, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
}
