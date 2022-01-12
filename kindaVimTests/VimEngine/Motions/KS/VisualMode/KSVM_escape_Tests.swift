@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_escape_Tests: KSVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .escape))
    }

}


extension KSVM_escape_Tests {

    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "escape(_:)")
    }
    
    func test_that_it_switches_Vim_into_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
