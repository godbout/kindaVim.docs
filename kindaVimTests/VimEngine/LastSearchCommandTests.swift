import XCTest
@testable import kindaVim
import KeyCombination
import Common


// see LastLeftRightSearchTests for blah blah
// same here but for LastSearchCommand. 
class LastSearchCommandTests: XCTestCase {

    let kindaVimEngine = KindaVimEngine()
        
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterNormalMode()
    }
    
}


extension LastSearchCommandTests {

    func test_that_at_first_the_lastSearchCommand_is_nil() {
        XCTAssertNil(kindaVimEngine.lastSearchCommand)
    }
        
    func test_that_after_calling_interrogationMark_the_lastSearchCommand_is_correct() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .interrogationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .h))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .e))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        XCTAssertEqual(
            kindaVimEngine.lastSearchCommand,
            LastSearchCommand(motion: .interrogationMark, searchString: "hel")
        )
    }
    
    func test_that_after_calling_slash_the_lastSearchCommand_is_correct() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .k))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        XCTAssertEqual(
            kindaVimEngine.lastSearchCommand,
            LastSearchCommand(motion: .slash, searchString: "lick")
        )
    }
    
}
