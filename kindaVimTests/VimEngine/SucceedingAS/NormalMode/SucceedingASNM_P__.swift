@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_P__Tests: SucceedingASNM_BaseTests {}


// lastYankStyle characterwise
extension SucceedingASNM_P__Tests {
    
    func test_that_it_calls_the_correct_function_on_AS_when_lastYankStyle_is_characterwise() {
        kindaVimEngine.lastYankStyle = .characterwise
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .P))
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "PForLastYankStyleCharacterwise(on:)")
    }
    
}


// lastYankStyle characterwise
extension SucceedingASNM_P__Tests {
    
    func test_that_it_calls_the_correct_function_on_AS_when_lastYankStyle_is_linewise() {
        kindaVimEngine.lastYankStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .P))
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "PForLastYankStyleLinewise(on:)")
    }
    
}


// both
extension SucceedingASNM_P__Tests {
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}
