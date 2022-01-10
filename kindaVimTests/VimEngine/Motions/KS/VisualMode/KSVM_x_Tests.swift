@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_x_Tests: KSVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .x))
    }

}


// VisualStyle Characterwise
extension KSVM_x_Tests {

    func test_that_it_calls_the_relevant_KS_function_as_a_fallback() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "d(_:)")
    }
    
    func test_that_it_switches_Vim_to_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
