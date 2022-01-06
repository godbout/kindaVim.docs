@testable import kindaVim
import KeyCombination
import XCTest


class KS_cDollarSign_Tests: KSNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .c), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .dollarSign), appMode: .keyMapping)
    }

}


extension KS_cDollarSign_Tests {
    
    func test_that_it_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "cDollarSignForTextElement()")
    }
    
    func test_that_it_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "cDollarSignForNonTextElement()")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        applyKeyCombinationsBeingTested()
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    // TODO: i think this will move within KS like we do for AS
    func test_that_it_sets_the_LastYankStyle_to_Characterwise() {
        kindaVimEngine.state.lastYankStyle = .linewise
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.state.lastYankStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
