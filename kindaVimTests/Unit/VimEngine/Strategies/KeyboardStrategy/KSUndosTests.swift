//
//  KSUndosTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

@testable import kindaVim
import XCTest

class KSUndosTests: XCTestCase {

    let keyboardStrategy = KeyboardStrategy()
    
    func test_that_u_gets_transformed_to_command_z() {
        let transformedKeys = keyboardStrategy.u()
        
        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .z)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
    func test_that_ctrl_r_gets_transformed_to_command_shift_z() {
        let transformedKeys = keyboardStrategy.controlR()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .z)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].shift, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
}
