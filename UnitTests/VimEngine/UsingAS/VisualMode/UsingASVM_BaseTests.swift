@testable import kindaVim
import XCTest

class UsingASVM_BaseTests: XCTestCase {
    
    let asNormalModeMock = AccessibilityStrategyNormalModeMock()
    let asVisualModeMock = AccessibilityStrategyVisualModeMock()
    
    override func setUp() {
        VimEngine.shared.keyboardStrategy = KeyboardStrategyMock()
        VimEngine.shared.asNormalMode = asNormalModeMock
        VimEngine.shared.asVisualMode = asVisualModeMock
        VimEngine.shared.enterVisualMode()
    }
    
}
