@testable import kindaVim
import XCTest

class UsingKS_O__Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .O))
    }

}

extension UsingKS_O__Tests {
    
    func test_that_O_calls_the_O_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "O()")
    }
    
    func test_that_O_switches_Vim_to_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }
    
}



