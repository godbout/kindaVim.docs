@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_yy_Tests: KSNM_BaseTests {
    
    override func setUp() {
super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
    }

}


extension KSNM_yy_Tests {

    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
               
        XCTAssertEqual(ksNormalModeMock.functionCalled, "yyForNonTextElement()")
    }
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "yyForTextElement(_:)")
    }

    func test_that_it_keeps_Vim_in_NormalMode() {
        
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}

