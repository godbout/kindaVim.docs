import XCTest
@testable import kindaVim
import KeyCombination


// here we're testing all the things related to the State.
// this is very important because this State will be passed down to the moves.
// the state will contain:
// - the PGR to be read by the moves
// - the lastYankStyle to be changed by the moves
// - the lastMoveBipped to be changed by the moves
class StateTests: XCTestCase {

    let kindaVimEngine = KindaVimEngine()
        
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterNormalMode()
    }
    
}


// PGR
extension StateTests {
    
    func test_that_if_the_AppMode_is_Auto_then_PGR_is_false() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six), appMode: .auto)
        
        XCTAssertFalse(kindaVimEngine.state.pgR)
    }
        
    func test_that_if_the_AppMode_is_KeyMapping_then_PGR_is_false() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .nine), appMode: .keyMapping)
        
        XCTAssertFalse(kindaVimEngine.state.pgR)
    }
    
    func test_that_if_the_AppMode_is_PGR_then_PGR_is_true_LOL() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .two), appMode: .pgR)
        
        XCTAssertTrue(kindaVimEngine.state.pgR)
    }
        
}
