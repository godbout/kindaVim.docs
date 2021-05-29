@testable import kindaVim
import XCTest

class UsingKS_o_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .o))
    }

}

extension UsingKS_o_Tests {
    
    func test_that_o_calls_the_o_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "o()")
    }
    
    func test_that_o_switches_Vim_to_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }
    
}



