@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_cF__Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .F))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .x))
    }
    
}


// see ct and others for why we don't test Vim mode here but in UI Tests
extension SucceedingASNM_cF__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "cF(to:on:)")
    }
    
}
