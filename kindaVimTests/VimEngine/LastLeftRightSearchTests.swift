import XCTest
@testable import kindaVim
import KeyCombination
import Common


// here we test that the content of the lastLeftRightSearch var
// is set properly at the proper times.
class LastLeftRightSearchTests: XCTestCase {

    let kindaVimEngine = KindaVimEngine()
        
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterNormalMode()
    }
    
}


extension LastLeftRightSearchTests {

    func test_that_at_first_the_lastLeftRightSearch_is_nil() {
        XCTAssertNil(kindaVimEngine.lastLeftRightSearch)
    }
        
    func test_that_after_calling_F_the_lastLeftRightSearch_is_correct() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .F))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .h))
        
        XCTAssertEqual(
            kindaVimEngine.lastLeftRightSearch,
            LastLeftRightSearch(motion: .F, character: "h")
        )
    }
    
    func test_that_after_calling_f_the_lastLeftRightSearch_is_correct() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .f))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l))
        
        XCTAssertEqual(
            kindaVimEngine.lastLeftRightSearch,
            LastLeftRightSearch(motion: .f, character: "l")
        )
    }
    
    func test_that_after_calling_T_the_lastLeftRightSearch_is_correct() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .T))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .z))
        
        XCTAssertEqual(
            kindaVimEngine.lastLeftRightSearch,
            LastLeftRightSearch(motion: .T, character: "z")
        )
    }
    
    func test_that_after_calling_t_the_lastLeftRightSearch_is_correct() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .t))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .o))
        
        XCTAssertEqual(
            kindaVimEngine.lastLeftRightSearch,
            LastLeftRightSearch(motion: .t, character: "o")
        )
    }
    
}
