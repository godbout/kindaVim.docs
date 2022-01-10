@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_c_Tests: KSVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
    }

}


extension KSVM_c_Tests {

    func test_that_it_calls_the_relevant_KS_function() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "c(_:)")
    }
    
    
    func test_that_it_switches_Vim_to_InsertMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
