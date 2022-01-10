@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_tilde_Tests: KSVM_BaseTests {
    
    override func setUp() {
        super.setUp()  
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .tilde))
    }

}


extension KSVM_tilde_Tests {
    
    func test_that_it_does_not_call_any_KS_function_because_this_move_is_not_doable_with_KS() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }
    
    func test_that_it_keeps_Vim_in_VisualMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
