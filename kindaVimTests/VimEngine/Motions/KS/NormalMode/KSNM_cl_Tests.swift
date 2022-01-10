@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_cl_Tests: KSNM_BaseTests {

    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l))
    }

}


extension KSNM_cl_Tests {

    func test_that_it_calls_the_correct_function_on_KS() {
        
        XCTAssertEqual(ksNormalModeMock.functionCalled, "clForNonTextElement()")
    }
    
    func test_that_it_calls_the_correct_function_for_TextElements_on_KS() {
        

        XCTAssertEqual(ksNormalModeMock.functionCalled, "clForTextElement(_:)")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
