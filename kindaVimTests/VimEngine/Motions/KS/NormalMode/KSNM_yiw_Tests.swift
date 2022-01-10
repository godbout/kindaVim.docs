@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_yiw_Tests: KSNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
    }

}


extension KSNM_yiw_Tests {

    func test_that_the_move_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "yiw(_:)")
    }
    
    func test_that_l_keeps_Vim_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
