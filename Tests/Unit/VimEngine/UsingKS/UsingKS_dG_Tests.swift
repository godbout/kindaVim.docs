@testable import kindaVim
import XCTest

class UsingKS_dG_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .G))
    }

}

extension UsingKS_dG_Tests {

    func test_that_dG_calls_the_dG_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dG()")
    }

    func test_that_dG_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}

