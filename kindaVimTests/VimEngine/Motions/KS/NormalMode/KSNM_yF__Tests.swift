@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_yF__Tests: KSNM_BaseTests {
    
    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .F))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .equal))
    }
    
}


extension KSNM_yF__Tests {
    
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
