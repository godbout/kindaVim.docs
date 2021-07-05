@testable import kindaVim
import XCTest

class UsingKS_C__Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .C))
    }

}

extension UsingKS_C__Tests {
    
    func test_that_C_calls_the_C_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "C()")
    }
    
    func test_that_C_switches_Vim_to_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }

}

