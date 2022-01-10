@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_X__Tests: KSNM_BaseTests {
    
    override func setUp() {
super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .X))
    }

}


extension KSNM_X__Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dhForNonTextElement()")
    }

    func test_that_it_calls_the_correct_function_for_TextElements_on_KS() {
        

        XCTAssertEqual(ksNormalModeMock.functionCalled, "dhForTextElement(_:)")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
