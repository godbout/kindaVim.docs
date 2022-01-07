@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingASNM_daw_Tests: KSNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w), appMode: .keyMapping)
    }
    
}


extension EnforcingASNM_daw_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
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
