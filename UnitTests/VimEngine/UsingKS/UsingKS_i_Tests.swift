@testable import kindaVim
import XCTest

class UsingKS_i_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
    }

}

extension UsingKS_i_Tests {
    
    func test_that_i_does_not_call_any_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    func test_that_i_switches_Vim_to_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }

}

