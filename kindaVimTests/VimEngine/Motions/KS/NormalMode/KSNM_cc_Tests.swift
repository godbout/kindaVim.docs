@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_cc_Tests: KSNM_BaseTests {

    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
    }

}


extension KSNM_cc_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        
        XCTAssertEqual(ksNormalModeMock.functionCalled, "ccForNonTextElement()")
    }
    
    func test_that_it_calls_the_correct_function_for_TextElements_on_KS() {
        

        XCTAssertEqual(ksNormalModeMock.functionCalled, "ccForTextElement(_:)")
    }
    
    func test_that_cc_switches_Vim_to_InsertMode() {
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
