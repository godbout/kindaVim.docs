@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_yt_Tests: KSNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))     
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .t))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .k))
    }
    
}


extension KSNM_yt_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
   
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
