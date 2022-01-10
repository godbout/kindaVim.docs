@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_C__Tests: KSVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .C))
    }

}


extension KSVM_C__Tests {
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "C(_:)")
    }
    
    func test_that_it_switches_Vim_to_InsertMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
