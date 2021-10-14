@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_gj_Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j), enforceKeyboardStrategy: true)
    }

}


// VisualStyle Characterwise
extension EnforcingKSVM_gj_Tests {

    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Characterwise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "gj()")
    }

}


// VisualStyle Linewise
extension EnforcingKSVM_gj_Tests {

    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Linewise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "gj()")
    }

}


// Both
extension EnforcingKSVM_gj_Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
}
