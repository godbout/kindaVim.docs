import XCTest
@testable import kindaVim
import KeyCombination


// here we test that if Key Mapping is enforced it doesn't go
// to Accessibility Strategy first.
class KeyMappingTests: XCTestCase {

    let kindaVimEngine = KindaVimEngine()    
    let asNormalMode = AccessibilityStrategyNormalModeMock()
    let asVisualMode = AccessibilityStrategyVisualModeMock()
    let ksNormalMode = KeyboardStrategyNormalModeMock()
    let ksVisualMode = KeyboardStrategyVisualModeMock()
        
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingMock()
        kindaVimEngine.asNormalMode = asNormalMode
        kindaVimEngine.asVisualMode = asVisualMode
        kindaVimEngine.ksNormalMode = ksNormalMode
        kindaVimEngine.ksVisualMode = ksVisualMode           
        kindaVimEngine.state.visualStyle = .characterwise
    }
    
}


extension KeyMappingTests {
    
    func test_that_in_NormalMode_it_goes_straight_to_the_KeyboardStrategy() {
        kindaVimEngine.enterNormalMode(appFamily: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l), appFamily: .keyMapping)
        
        XCTAssertEqual(asNormalMode.functionCalled, "")
        XCTAssertEqual(ksNormalMode.functionCalled, "l(times:)")
    }
    
    func test_that_in_OperatorPendingMode_for_NormalMode_it_goes_straight_to_the_KeyboardStrategy() {
        kindaVimEngine.enterNormalMode(appFamily: .keyMapping)
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), appFamily: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), appFamily: .keyMapping)
        
        XCTAssertEqual(asNormalMode.functionCalled, "")
        XCTAssertEqual(ksNormalMode.functionCalled, "dd(_:)")
    }
    
    func test_that_in_VisualMode_it_goes_straight_to_the_KeyboardStrategy() {
        kindaVimEngine.enterVisualMode()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l), appFamily: .keyMapping)
        
        XCTAssertEqual(asVisualMode.functionCalled, "")
        XCTAssertEqual(ksVisualMode.functionCalled, "l(times:_:)")
    }
    
    func test_that_in_OperatorPendingMode_for_VisualMode_it_goes_straight_to_the_KeyboardStrategy() {
        kindaVimEngine.enterVisualMode()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g), appFamily: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g), appFamily: .keyMapping)
        
        XCTAssertEqual(asVisualMode.functionCalled, "")
        XCTAssertEqual(ksVisualMode.functionCalled, "gg(_:)")
    }
        
}
