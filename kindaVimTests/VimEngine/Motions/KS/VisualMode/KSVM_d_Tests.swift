@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_d_Tests: KSVM_BaseTests {
    
    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
    }

}


// VisualStyle Characterwise
extension KSVM_d_Tests {

    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Characterwise() {
        
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "dForTextElement()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_NonTextElements_as_a_fallback_when_in_VisualStyle_Characterwise() {
        
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "dForNonTextElement()")
    }
    
    func test_that_it_switches_Vim_to_NormalMode_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.state.visualStyle = .characterwise
        
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_sets_the_LastYankStyle_to_Characterwise_when_VisualStyle_is_Characterwise() {
        kindaVimEngine.state.visualStyle = .characterwise
        
        
        XCTAssertEqual(kindaVimEngine.state.lastYankStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count() {
        kindaVimEngine.state.visualStyle = .characterwise
        
        
        XCTAssertNil(kindaVimEngine.count)
    }

}


// VisualStyle Linewise
extension KSVM_d_Tests {

    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Linewise() {
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "dForTextElement()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_NonTextElements_as_a_fallback_when_in_VisualStyle_Linewise() {
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "dForNonTextElement()")
    }
    
    func test_that_it_switches_Vim_to_NormalMode_when_in_VisualStyle_Linewise() {
        kindaVimEngine.state.visualStyle = .linewise
        
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_sets_the_LastYankStyle_to_Linewise_when_VisualStyle_is_Linewise() {
        kindaVimEngine.state.visualStyle = .linewise
        

        XCTAssertEqual(kindaVimEngine.state.lastYankStyle, .linewise)
    }
    
    func test_that_it_resets_the_count_when_VisualStyle_is_Linewise() {
        kindaVimEngine.state.visualStyle = .linewise
        
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
