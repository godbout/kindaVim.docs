@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_k_Tests: ASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .k))
    }
    
}


extension SucceedingASNM_k_Tests {
    
    func test_that_if_it_is_not_remap_it_calls_k_on_AS() {
        kindaVimEngine.jkMapping = false
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "k(on:)")
    }
        
    func test_that_if_it_is_remapped_it_calls_gk_on_AS() {
        kindaVimEngine.jkMapping = true
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "gk(on:)")
    }

}


// both
extension SucceedingASNM_k_Tests {
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.state.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()

        XCTAssertNil(kindaVimEngine.count)
    }

}
