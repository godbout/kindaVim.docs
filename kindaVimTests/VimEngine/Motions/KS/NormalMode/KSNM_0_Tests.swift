@testable import kindaVim
import KeyCombination
import XCTest


// see Succeeding AS NM 0 for blah blah
class EnforcingKS_0_Tests: KSNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        // TODO: not sure i'm gonna need to force the .keyMapping anymore. this should be tested on its own! coz new structure
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .zero), appMode: .keyMapping)
    }

}


extension EnforcingKS_0_Tests {
    
    func test_that_it_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "zeroForNonTextElement()")
    }
    
    func test_that_it_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "zeroForTextElement()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
