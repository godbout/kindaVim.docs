@testable import kindaVim
import XCTest

class __Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .minus, shift: true))
    }

}

extension __Tests {
    
    func test_that___calls_the_underscore_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "underscore()")
    }
    
    func test_that___keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}




