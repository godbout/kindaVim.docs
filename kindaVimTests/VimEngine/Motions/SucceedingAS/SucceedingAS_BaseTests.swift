@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingAS_BaseTests: XCTestCase {
    
    let kindaVimEngine = KindaVimEngine()
    
    let asNormalModeMock = AccessibilityStrategyNormalModeMock()
    let asVisualModeMock = AccessibilityStrategyVisualModeMock()
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.asNormalMode = asNormalModeMock
        kindaVimEngine.asVisualMode = asVisualModeMock
    }
    
}
