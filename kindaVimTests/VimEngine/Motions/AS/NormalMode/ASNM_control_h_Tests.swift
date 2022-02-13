@testable import kindaVim
import KeyCombination
import XCTest
import SwiftUI


class SucceedingASNM_control_h_Tests: ASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .controlH))
    }
    
}


extension SucceedingASNM_control_h_Tests {
    
    // synonym
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "h(times:on:)")
    }
    
    func test_that_l_keeps_Vim_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
