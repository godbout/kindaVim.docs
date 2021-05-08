@testable import kindaVim
import XCTest

class db_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
    }

}

extension db_Tests {

    func test_that_db_calls_the_db_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "db()")
    }

    func test_that_db_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}

