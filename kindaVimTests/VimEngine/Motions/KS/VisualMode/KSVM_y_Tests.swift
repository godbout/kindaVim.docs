@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_y_Tests: KSVM_BaseTests {
    
    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
    }

}


// VisualStyle Characterwise
extension KSVM_y_Tests {

    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Characterwise() {
        
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "yForNonTextElement()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Characterwise() {
        
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "yForTextElement()")
    }
    
    func test_that_it_switches_Vim_to_NormalMode_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.state.visualStyle = .characterwise
        
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        kindaVimEngine.state.visualStyle = .characterwise
        
        
        XCTAssertNil(kindaVimEngine.count)
    }

}


// VisualStyle Linewise
extension KSVM_y_Tests {

    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Linewise() {
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "yForNonTextElement()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Linewise() {
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "yForTextElement()")
    }
    
    func test_that_it_switches_Vim_in_NormalMode_when_VisualStyle_is_Linewise() {
        kindaVimEngine.state.visualStyle = .linewise
        
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }     
    
    func test_that_it_resets_the_count_when_VisualStyle_is_Linewise() {
        kindaVimEngine.state.visualStyle = .linewise
        
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
