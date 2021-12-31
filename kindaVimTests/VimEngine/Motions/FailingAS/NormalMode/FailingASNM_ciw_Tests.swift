@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_ciw_Tests: FailingAS_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
    }
    
}


extension FailingASNM_ciw_Tests {
    
    func test_that_it_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "ciwForTextElement()")
    }
    
    func test_that_it_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "ciwForNonTextElement()")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        applyKeyCombinationsBeingTested()
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_sets_the_LastYankStyle_to_Characterwise() {
        kindaVimEngine.lastYankStyle = .linewise
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.lastYankStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
