@testable import kindaVim
import XCTest

class O__Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .o, shift: true))
    }

}

extension O__Tests {
    
    func test_that_O_calls_the_O_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "O()")
    }
    
    func test_that_O_switches_Vim_to_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }
    
}



