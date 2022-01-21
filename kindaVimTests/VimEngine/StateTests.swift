import XCTest
@testable import kindaVim
import KeyCombination


// here we're testing all the things related to the State.
// this is very important because this State will be passed down to the moves.
// the state will contain:
// - the lastMoveBipped to be changed by the moves
// - the appFamily to be read by the moves
// - the lastYankStyle to be changed by the moves
// - the visualStyle to be read by the moves

class StateTests: XCTestCase {

    let kindaVimEngine = KindaVimEngine()
        
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterNormalMode()
    }
    
}


// App Family
extension StateTests {
    
    func test_that_the_AppFamily_Auto_is_passed_correctly_to_the_kVE_State() {        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six), appFamily: .auto)
        
        XCTAssertEqual(kindaVimEngine.state.appFamily, .auto)
    }
        
    func test_that_the_AppFamily_PGR_is_passed_correctly_to_the_kVE_State() {        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six), appFamily: .pgR)
        
        XCTAssertEqual(kindaVimEngine.state.appFamily, .pgR)
    }
        
    func test_that_the_AppFamily_Electron_is_passed_correctly_to_the_kVE_State() {        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six), appFamily: .electron)
        
        XCTAssertEqual(kindaVimEngine.state.appFamily, .electron)
    }
        
    func test_that_the_AppFamily_KeyMapping_is_passed_correctly_to_the_kVE_State() {        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six), appFamily: .keyMapping)
        
        XCTAssertEqual(kindaVimEngine.state.appFamily, .keyMapping)
    }
        
    func test_that_the_AppFamily_NineOneOne_is_passed_correctly_to_the_kVE_State() {        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six), appFamily: .nineOneOne)
        
        XCTAssertEqual(kindaVimEngine.state.appFamily, .nineOneOne)
    }
        
}
