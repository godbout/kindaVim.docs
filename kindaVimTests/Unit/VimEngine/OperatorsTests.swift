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
    
    func test_that_gg_is_getting_transformed_to_command_up() {
        let g = KeyCombination(key: .g)

        _ = VimEngineController.shared.transform(from: g)
        let transformedKeys = VimEngineController.shared.transform(from: g)

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .up)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .up)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_after_the_first_g_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngineController.shared.currentMode, .operatorPending)
        
        let g = KeyCombination(key: .g)
        _ = VimEngineController.shared.transform(from: g)
        
        XCTAssertEqual(VimEngineController.shared.currentMode, .operatorPending)
    }
    
    func test_that_cc_is_getting_transformed_to_command_right_command_shift_left_delete() {
        let c = KeyCombination(key: .c)

        _ = VimEngineController.shared.transform(from: c)
        let transformedKeys = VimEngineController.shared.transform(from: c)

        guard transformedKeys.count == 6 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
        XCTAssertEqual(transformedKeys[2].key, .left)
        XCTAssertEqual(transformedKeys[2].command, true)
        XCTAssertEqual(transformedKeys[2].shift, true)
        XCTAssertEqual(transformedKeys[2].action, .press)
        XCTAssertEqual(transformedKeys[3].key, .left)
        XCTAssertEqual(transformedKeys[3].command, true)
        XCTAssertEqual(transformedKeys[3].shift, true)
        XCTAssertEqual(transformedKeys[3].action, .release)
        XCTAssertEqual(transformedKeys[4].key, .delete)
        XCTAssertEqual(transformedKeys[4].action, .press)
        XCTAssertEqual(transformedKeys[5].key, .delete)
        XCTAssertEqual(transformedKeys[5].action, .release)
    }
    
    func test_that_after_the_first_c_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngineController.shared.currentMode, .operatorPending)
        
        let c = KeyCombination(key: .c)
        _ = VimEngineController.shared.transform(from: c)
        
        XCTAssertEqual(VimEngineController.shared.currentMode, .operatorPending)
    }
    
}
