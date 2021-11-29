@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_db_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .b), appMode: .keyMapping)
    }

}


extension EnforcingKS_db_Tests {

    func test_that_db_calls_the_db_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "db()")
    }

    func test_that_db_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}

