@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_P__Tests: SucceedingASNM_BaseTests {
    
    private func applyMoveBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .P))
        func test_that_it_Vim_as_in_VisualMode_Characterwise_it_resets_the_count() {
            applyMoveBeingTested()
            
            XCTAssertNil(kindaVimEngine.count)
        }
}
        
}


// lastYankStyle characterwise
extension SucceedingASNM_P__Tests {
    
    func test_that_it_calls_the_correct_function_on_AS_when_lastYankStyle_is_characterwise() {
        kindaVimEngine.lastYankStyle = .characterwise
        applyMoveBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "PForLastYankStyleCharacterwise(on:)")
    }
    
}


// lastYankStyle characterwise
extension SucceedingASNM_P__Tests {
    
    func test_that_it_calls_the_correct_function_on_AS_when_lastYankStyle_is_linewise() {
        kindaVimEngine.lastYankStyle = .linewise
        applyMoveBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "PForLastYankStyleLinewise(on:)")
    }
    
}


// both
extension SucceedingASNM_P__Tests {
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyMoveBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
