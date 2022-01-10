@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_V__Tests: KSVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
    }
}


// visualStyle characterwise
extension KSVM_V__Tests {    

    func test_that_it_calls_the_correct_function_on_KS_when_VisualSyle_is_Characterwise() {
        kindaVimEngine.state.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VFromVisualMode(_:)")
    }
    
    func test_that_if_Vim_was_in_VisualMode_Characterwise_it_switches_into_VisualMode_Linewise() {
        kindaVimEngine.state.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.state.visualStyle, .linewise)
    }
    
    func test_that_it_Vim_as_in_VisualMode_Characterwise_it_resets_the_count() {
        kindaVimEngine.state.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}


// visualStyle linewise
extension KSVM_V__Tests {    
    
    func test_that_it_calls_the_correct_function_on_KS_when_VisualSyle_is_Linewise() {
        kindaVimEngine.state.visualStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VFromVisualMode(_:)")
    }
    
    func test_that_if_Vim_was_in_VisualMode_Linewise_it_switches_into_NormalMode() {
        kindaVimEngine.state.visualStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_Vim_as_in_VisualMode_Linewise_it_resets_the_count() {
        kindaVimEngine.state.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
