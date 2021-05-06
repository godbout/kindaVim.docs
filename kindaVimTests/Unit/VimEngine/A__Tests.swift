@testable import kindaVim
import XCTest

class A__Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .a, shift: true))
    }

}

extension A__Tests {
    
    func test_that_A_calls_the_A_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "A()")
    }
    
    func test_that_A_switches_Vim_to_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }

}

