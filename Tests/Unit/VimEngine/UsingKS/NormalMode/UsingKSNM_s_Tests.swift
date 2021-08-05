@testable import kindaVim
import XCTest

class UsingKS_s_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .s))
    }

}

extension UsingKS_s_Tests {

    func test_that_s_calls_the_s_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "s()")
    }

    func test_that_s_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}
