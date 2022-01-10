@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_D__Tests: KSVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .D))
    }

}


extension KSVM_D__Tests {
    
    func test_that_it_calls_the_relevant_KS_function() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "D(_:)")
    }
    
    func test_that_it_switches_Vim_to_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
