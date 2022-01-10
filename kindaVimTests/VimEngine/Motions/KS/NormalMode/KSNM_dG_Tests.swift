@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_dG_Tests: KSNM_BaseTests {

    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .G))
    }

}


extension KSNM_dG_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dGForNonTextElement()")
    }

    func test_that_it_calls_the_correct_function_for_TextElements_on_KS() {
        

        XCTAssertEqual(ksNormalModeMock.functionCalled, "dGForTextElement(_:)")
    }
    
    func test_that_dG_keeps_Vim_in_NormalMode() {
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
