@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_ip_Tests: ASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))
    }
    
}


extension SucceedingASVM_ip_Tests {
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asVisualModeMock.functionCalled, "ip(on:_:)")
    }
    
    func test_that_it_keeps_Vim_in_VisualMode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }     
    
    func test_that_it_sets_the_VisualStyle_to_Linewise() {
        kindaVimEngine.state.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.state.visualStyle, .linewise)
    }
        
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
