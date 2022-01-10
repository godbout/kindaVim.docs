@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_v_Tests: KSVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
    }
}


// visualStyle character
extension KSVM_v_Tests {    
        
    func test_that_it_calls_the_correct_function_on_KS() {
        kindaVimEngine.state.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vFromVisualMode(_:)")
    }
    
    func test_that_if_Vim_was_in_VisualMode_Characterwise_it_switches_into_NormalMode() {
        kindaVimEngine.state.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_Vim_as_in_VisualMode_Characterwise_it_resets_the_count() {
        kindaVimEngine.state.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}


// visualStyle linewise
extension KSVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_VisualStyle_is_Linewise() {
        kindaVimEngine.state.visualStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vFromVisualMode(_:)")
    }
    
    func test_that_if_Vim_was_in_VisualMode_linewise_it_switches_into_VisualMode_Characterwise() {
        kindaVimEngine.state.visualStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.state.visualStyle, .characterwise)
    }
    
    func test_that_it_Vim_as_in_VisualMode_Linewise_it_resets_the_count() {
        kindaVimEngine.state.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
