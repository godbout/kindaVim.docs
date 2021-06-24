@testable import kindaVim
import XCTest

class UsingAS_BaseTests: XCTestCase {
    
    let asNormalModeMock = AccessibilityStrategyNormalModeMock()
    let asVisualModeMock = AccessibilityStrategyVisualModeMock()
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.keyboardStrategy = KeyboardStrategyMock()
        VimEngine.shared.asNormalMode = asNormalModeMock
        VimEngine.shared.asVisualMode = asVisualModeMock
    }
    
}
