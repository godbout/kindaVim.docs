@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_dB__Tests: KSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .B))
    }

}


extension KSNM_dB__Tests {

    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }

    func test_that_db_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
