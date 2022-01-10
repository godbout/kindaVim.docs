import XCTest
@testable import kindaVim
import KeyCombination


// here we test that if the Accessibility Strategy can't read the
// text of the current input field, it falls back to the Keyboard Strategy
class AutoFallbackTests: XCTestCase {

    let kindaVimEngine = KindaVimEngine()    
    let asNormalMode = AccessibilityStrategyNormalModeMock()
    let asVisualMode = AccessibilityStrategyVisualModeMock()
    let ksNormalMode = KeyboardStrategyNormalModeMock()
    let ksVisualMode = KeyboardStrategyVisualModeMock()
        
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategyFailingMock()
        kindaVimEngine.asNormalMode = asNormalMode
        kindaVimEngine.asVisualMode = asVisualMode
        kindaVimEngine.ksNormalMode = ksNormalMode
        kindaVimEngine.ksVisualMode = ksVisualMode           
        kindaVimEngine.state.visualStyle = .characterwise
    }
    
}


extension AutoFallbackTests {
    
    func test_that_in_NormalMode_it_falls_back_to_the_KeyboardStrategy() {
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l))
        
        XCTAssertEqual(asNormalMode.functionCalled, "")
        XCTAssertEqual(ksNormalMode.functionCalled, "l(times:)")
    }
    
    func test_that_in_OperatorPendingMode_for_NormalMode_it_falls_back_to_the_KeyboardStrategy() {
        kindaVimEngine.enterNormalMode()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        
        XCTAssertEqual(asNormalMode.functionCalled, "")
        XCTAssertEqual(ksNormalMode.functionCalled, "dd(_:)")
    }
    
    func test_that_in_VisualMode_it_falls_back_to_the_KeyboardStrategy() {
        kindaVimEngine.enterVisualMode()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l))
        
        XCTAssertEqual(asVisualMode.functionCalled, "")
        XCTAssertEqual(ksVisualMode.functionCalled, "l(_:)")
    }
    
    func test_that_in_OperatorPendingMode_for_VisualMode_it_falls_back_to_the_KeyboardStrategy() {
        kindaVimEngine.enterVisualMode()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        
        XCTAssertEqual(asVisualMode.functionCalled, "")
        XCTAssertEqual(ksVisualMode.functionCalled, "gg(_:)")
    }
        
}
