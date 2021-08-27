@testable import kindaVim
import XCTest


class UsingKSVM_y_Tests: UsingKSVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(key: .y),
            enforceKeyboardStrategy: true
        )
    }
    
}


extension UsingKSVM_y_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "y()")
    }
    
    func test_that_it_switches_Vim_into_NormalMode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}

