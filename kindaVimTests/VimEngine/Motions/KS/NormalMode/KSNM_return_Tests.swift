@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_return_Tests: KSNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
    }

}


// KS return is very special. if we are dealing with NTE, we make it a special move.
// we "return" the selection and switch to IM. that is to select items in dropdowns, etc.
// like in Alfred, Xcode func lists, etc. we differentiate NTE from TE by what the KS return
// func do with the lastMoveBipped. if true, then we use the non standard way for return, so we go IM.
// else, we stay NM.
extension KSNM_return_Tests {
    
    func test_that_if_KS_return_set_the_lastMoveBipped_to_true_then_it_goes_to_InsertMode() {
        kindaVimEngine.state.lastMoveBipped = true
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
        
    func test_that_if_KS_return_set_the_lastMoveBipped_to_false_then_it_stays_in_NormalMode() {
        kindaVimEngine.state.lastMoveBipped = false
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}


extension KSNM_return_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(ksNormalModeMock.functionCalled, "return(times:_:)")
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
