@testable import kindaVim
import XCTest

class UsingKS_yy_Tests: UsingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
    }

}

extension UsingKS_yy_Tests {

    func test_that_yy_calls_the_yy_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "yy()")
    }

    func test_that_yy_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}

