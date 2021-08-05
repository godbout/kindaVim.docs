@testable import kindaVim
import XCTest

class UsingKS_a_Tests: UsingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .a))
    }

}

extension UsingKS_a_Tests {
    
    func test_that_a_calls_the_a_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "a()")
    }
    
    func test_that_a_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}
