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
    
    func test_that_gg_is_getting_transformed_command_up() {
        VimEngineController.shared.enterCommandMode()
        
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
    
}
