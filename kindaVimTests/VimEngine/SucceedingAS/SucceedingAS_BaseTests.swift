@testable import kindaVim
import KeyCombination
import XCTest


// TODO: Auto? or should this be back as before? the structure of the tests
// is a little bit confusing now i think.
class SucceedingAS_BaseTests: XCTestCase {
    
    let kindaVimEngine = KindaVimEngine()
    
    let asNormalModeMock = AccessibilityStrategyNormalModeMock()
    let asVisualModeMock = AccessibilityStrategyVisualModeMock()
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.ksNormalMode = KeyboardStrategyNormalModeMock()
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategyMock()
        kindaVimEngine.asNormalMode = asNormalModeMock
        kindaVimEngine.asVisualMode = asVisualModeMock
    }
    
}
