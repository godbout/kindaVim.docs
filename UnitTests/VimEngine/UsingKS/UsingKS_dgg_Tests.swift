@testable import kindaVim
import XCTest

class UsingKS_dgg_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
    }

}

extension UsingKS_dgg_Tests {

    func test_that_dgg_calls_the_dgg_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "dgg()")
    }

    func test_that_dgg_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}

