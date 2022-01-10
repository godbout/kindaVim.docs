@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_G__Tests: KSNM_BaseTests {

    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .G))
    }

}


extension KSNM_G__Tests {
    
    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
               
        XCTAssertEqual(ksNormalModeMock.functionCalled, "GForNonTextElement()")
    }
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "GForTextElement()")
    }
    
    func test_that_G__keeps_Vim_in_normal_mode() {
        
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        
        
        XCTAssertNil(kindaVimEngine.count)
    }

}

