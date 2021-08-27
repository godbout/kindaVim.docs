@testable import kindaVim
import XCTest


class EnforcingKSVM_G__Tests: EnforcingKSVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(vimKey: .G),
            enforceKeyboardStrategy: true
        )
    }
    
}


extension EnforcingKSVM_G__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "G()")
    }
    
    func test_that_it_keeps_Vim_in_Visual_Mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
}
