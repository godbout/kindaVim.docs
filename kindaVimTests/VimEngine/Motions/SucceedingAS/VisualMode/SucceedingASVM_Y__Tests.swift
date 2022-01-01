@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_Y__Tests: SucceedingASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested(appMode: AppMode = .auto) {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .Y), appMode: appMode)
    }
    
}


extension SucceedingASVM_Y__Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "Y(on:)")
    }
    
    func test_that_it_switches_Vim_into_NormalMode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_sets_the_LastYankStyle_to_Linewise() {
        kindaVimEngine.lastYankStyle = .characterwise
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.lastYankStyle, .linewise)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }

}
