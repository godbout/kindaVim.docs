@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_p_Tests: SucceedingASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))
    }
    
}


// lastYankStyle characterwise
extension SucceedingASNM_p_Tests {
    
    func test_that_it_calls_the_correct_function_on_AS_when_lastYankStyle_is_characterwise() {
        kindaVimEngine.lastYankStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "pForLastYankStyleCharacterwise(on:)")
    }
    
}


// lastYankStyle characterwise
extension SucceedingASNM_p_Tests {
    
    func test_that_it_calls_the_correct_function_on_AS_when_lastYankStyle_is_linewise() {
        kindaVimEngine.lastYankStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "pForLastYankStyleLinewise(on:)")
    }
    
}


// both
extension SucceedingASNM_p_Tests {
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
