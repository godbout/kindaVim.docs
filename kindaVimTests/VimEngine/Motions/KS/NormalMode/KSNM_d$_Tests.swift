@testable import kindaVim
import KeyCombination
import XCTest


class KS_dDollarSign_Tests: KSNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
    }

}


extension KS_dDollarSign_Tests {
    
    func test_that_it_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "dDollarSignForTextElement()")
    }
    
    func test_that_it_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "dDollarSignForNonTextElement()")
    }
    
    func test_that_it_stays_in_NormalMode() {
        applyKeyCombinationsBeingTested()
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
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
