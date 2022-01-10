@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_dk_Tests: KSNM_BaseTests {

    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .k))
    }

}


extension KSNM_dk_Tests {
    
    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
               
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dkForNonTextElement()")
    }
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dkForTextElement(_:)")
    }
    
    func test_that_dk_keeps_Vim_in_NormalMode() {
        
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}

