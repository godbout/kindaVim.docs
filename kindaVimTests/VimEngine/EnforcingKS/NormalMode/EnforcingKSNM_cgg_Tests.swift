@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_cgg_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g), appMode: .keyMapping)
    }

}


extension EnforcingKS_cgg_Tests {

    func test_that_cgg_calls_the_cgg_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "cgg()")
    }

    func test_that_cgg_switches_Vim_to_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
