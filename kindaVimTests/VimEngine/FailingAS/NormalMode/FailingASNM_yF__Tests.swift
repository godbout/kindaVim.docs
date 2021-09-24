@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_yF__Tests: FailingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .F))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .equal))
    }
    
}


extension FailingASNM_yF__Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
}
