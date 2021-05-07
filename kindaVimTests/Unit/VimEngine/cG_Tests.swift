@testable import kindaVim
import XCTest

class cG_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .g, shift: true))
    }

}

extension cG_Tests {
    
    func test_that_cG_calls_the_cc_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "cG()")
    }
    
    func test_that_cc_switches_Vim_to_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }

}

