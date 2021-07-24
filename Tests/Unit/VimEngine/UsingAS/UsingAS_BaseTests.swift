@testable import kindaVim
import XCTest

class UsingAS_BaseTests: XCTestCase {
    
    let asNormalModeMock = AccessibilityStrategyNormalModeMock()
    let asVisualModeMock = AccessibilityStrategyVisualModeMock()
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.keyboardStrategy = KeyboardStrategyMock()
        KindaVimEngine.shared.accessibilityStrategy = AccessibilityStrategyMock()
        KindaVimEngine.shared.asNormalMode = asNormalModeMock
        KindaVimEngine.shared.asVisualMode = asVisualModeMock
    }
    
}
