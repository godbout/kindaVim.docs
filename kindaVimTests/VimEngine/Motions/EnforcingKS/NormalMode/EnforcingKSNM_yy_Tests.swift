@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_yy_Tests: EnforcingKSNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y), appMode: .keyMapping)
    }

}


extension EnforcingKS_yy_Tests {

    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyKeyCombinationsBeingTested()
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "yyForTextElement()")
    }

    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyKeyCombinationsBeingTested()
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "yyForNonTextElement()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_sets_the_LastYankStyle_to_Linewise() {
        kindaVimEngine.lastYankStyle = .characterwise
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.lastYankStyle, .linewise)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}

