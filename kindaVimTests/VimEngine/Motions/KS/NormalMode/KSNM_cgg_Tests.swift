@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_cgg_Tests: KSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
    }

}


extension KSNM_cgg_Tests {

    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "cgg()")
    }

    func test_that_cgg_switches_Vim_to_InsertMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
