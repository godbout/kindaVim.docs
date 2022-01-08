@testable import kindaVim
import KeyCombination
import XCTest


class AS_BaseTests: XCTestCase {
    
    let kindaVimEngine = KindaVimEngine()
    
    let asNormalModeMock = AccessibilityStrategyNormalModeMock()
    let asVisualModeMock = AccessibilityStrategyVisualModeMock()
    let ksNormalModeMock = KeyboardStrategyNormalModeMock()
    let ksVisualModeMock = KeyboardStrategyVisualModeMock()
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingMock()
        kindaVimEngine.asNormalMode = asNormalModeMock
        kindaVimEngine.asVisualMode = asVisualModeMock
        kindaVimEngine.ksNormalMode = ksNormalModeMock
        kindaVimEngine.ksVisualMode = ksVisualModeMock
    }
    
}
