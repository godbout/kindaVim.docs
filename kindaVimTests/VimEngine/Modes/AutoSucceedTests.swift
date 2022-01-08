import XCTest
@testable import kindaVim
import KeyCombination


// here we test that in Auto Mode when it succeeds it calls the Accessibility Strategy.
// failure is tested in FallbackTests.
class AutoSucceedTests: XCTestCase {

    let kindaVimEngine = KindaVimEngine()    
    let asNormalMode = AccessibilityStrategyNormalModeMock()
    let asVisualMode = AccessibilityStrategyVisualModeMock()
    let ksNormalMode = KeyboardStrategyNormalModeMock()
    let ksVisualMode = KeyboardStrategyVisualModeMock()
        
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingMock()
        kindaVimEngine.asNormalMode = asNormalMode
        kindaVimEngine.asVisualMode = asVisualMode
        kindaVimEngine.ksNormalMode = ksNormalMode
        kindaVimEngine.ksVisualMode = ksVisualMode           
        kindaVimEngine.state.visualStyle = .characterwise
    }
    
}


extension AutoSucceedTests {
    
    func test_that_in_NormalMode_it_ends_on_the_AccessibilityStrategy() {
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l))
        
        XCTAssertEqual(asNormalMode.functionCalled, "l(times:on:)")
        XCTAssertEqual(ksNormalMode.functionCalled, "")
    }
    
    func test_that_in_OperatorPendingMode_for_NormalMode_it_ends_on_the_AccessibilityStrategy() {
        kindaVimEngine.enterNormalMode()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        
        XCTAssertEqual(asNormalMode.functionCalled, "dd(on:_:)")
        XCTAssertEqual(ksNormalMode.functionCalled, "")
    }
    
    func test_that_in_VisualMode_it_ends_on_the_AccessibilityStrategy() {
        kindaVimEngine.enterVisualMode()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l))
        
        XCTAssertEqual(asVisualMode.functionCalled, "l(on:_:)")
        XCTAssertEqual(ksVisualMode.functionCalled, "")
    }
    
    func test_that_in_OperatorPendingMode_for_VisualMode_it_ends_on_the_AccessibilityStrategy() {
        kindaVimEngine.enterVisualMode()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        
        XCTAssertEqual(asVisualMode.functionCalled, "gg(on:_:)")
        XCTAssertEqual(ksVisualMode.functionCalled, "")
    }
        
}
