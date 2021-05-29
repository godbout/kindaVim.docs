@testable import kindaVim
import XCTest

class UsingAS_h_Tests: UsingAS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .h))
    }

}

extension UsingAS_h_Tests {
    
    func test_that_h_calls_the_h_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "h(on:)")
    }
    
    func test_that_h_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}
