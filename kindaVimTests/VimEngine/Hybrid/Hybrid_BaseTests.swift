@testable import kindaVim
import KeyCombination
import XCTest


class Hybrid_BaseTests: XCTestCase {
    
    let kindaVimEngine = KindaVimEngine()
    
    let asNormalModeMock = AccessibilityStrategyNormalModeMock()
    let asVisualModeMock = AccessibilityStrategyVisualModeMock()
    let ksNormalModeMock = KeyboardStrategyNormalModeMock()
    let ksVisualModeMock = KeyboardStrategyVisualModeMock()
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategyMock()
        kindaVimEngine.asNormalMode = asNormalModeMock
        kindaVimEngine.asVisualMode = asVisualModeMock
        kindaVimEngine.ksNormalMode = ksNormalModeMock
        kindaVimEngine.ksVisualMode = ksVisualModeMock
    }
    
}
