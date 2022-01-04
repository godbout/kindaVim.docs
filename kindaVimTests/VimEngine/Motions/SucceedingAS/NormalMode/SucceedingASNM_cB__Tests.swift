@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_cB__Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .B))
    }
    
}


// no test for going back to Insert Mode here because sometimes it will, sometimes it will not.
// if the text is empty or we're on the first character, it will not. all this is then
// tested in UI.
extension SucceedingASNM_cB__Tests {
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "cB(times:on:_:)")
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
 
}
