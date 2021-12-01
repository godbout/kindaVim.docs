@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_P__Tests: SucceedingASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested(appMode: AppMode = .auto) {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .P), appMode: appMode)
    }
        
}


// lastYankStyle characterwise
extension SucceedingASNM_P__Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off_when_LastYankStyle_is_Characterwise() {
        kindaVimEngine.lastYankStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "PForLastYankStyleCharacterwise(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on_when_LastYankStyle_is_Characterwise() {
        kindaVimEngine.lastYankStyle = .characterwise
        applyKeyCombinationsBeingTested(appMode: .pgR)
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "PForLastYankStyleCharacterwise(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, true)
    }
    
}


// lastYankStyle linewise
extension SucceedingASNM_P__Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off_when_LastYankStyle_is_Linewise() {
        kindaVimEngine.lastYankStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "PForLastYankStyleLinewise(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on_when_LastYankStyle_is_Linewise() {
        kindaVimEngine.lastYankStyle = .linewise
        applyKeyCombinationsBeingTested(appMode: .pgR)
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "PForLastYankStyleLinewise(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, true)
    }
    
}


// both
extension SucceedingASNM_P__Tests {
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
