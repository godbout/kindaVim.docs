@testable import kindaVim
import XCTest


class FailingASVM_y_Tests: FailingASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
    }
    
}


extension FailingASVM_y_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "y()")
    }
    
    func test_that_it_switches_Vim_into_NormalMode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}

