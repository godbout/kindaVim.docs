@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_control_h_Tests: KSVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .controlH))
    }

}


extension KSVM_control_h_Tests {

    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "h(_:)")
    }
    
    func test_that_it_keeps_Vim_in_VisualMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
