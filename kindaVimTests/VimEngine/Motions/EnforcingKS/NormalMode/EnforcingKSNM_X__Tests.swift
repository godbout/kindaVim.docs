@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_X__Tests: EnforcingKSNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .X), appMode: .keyMapping)
    }

}


extension EnforcingKS_X__Tests {
    
    func test_that_it_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "XForTextElement()")
    }
    
    func test_that_it_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "XForNonTextElement()")
    }

    func test_that_it_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
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
