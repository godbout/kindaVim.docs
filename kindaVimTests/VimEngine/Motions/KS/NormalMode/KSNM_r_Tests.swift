@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_r_Tests: KSNM_BaseTests {
    
    override func setUp() {
super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .r))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
    }

}


extension KSNM_r_Tests {

    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
        
        XCTAssertEqual(ksNormalModeMock.functionCalled, "rForNonTextElement(with:)")
    }
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        

        XCTAssertEqual(ksNormalModeMock.functionCalled, "rForTextElement(with:)")
    }
    
    func test_that_dj_keeps_Vim_in_normal_mode() {
        
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
