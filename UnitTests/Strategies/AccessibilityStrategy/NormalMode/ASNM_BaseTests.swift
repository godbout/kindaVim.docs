@testable import kindaVim
import XCTest

class ASNM_BaseTests: XCTestCase {
    
    var textEngine = TextEngine()
    var asNormalMode: AccessibilityStrategyNormalMode!
    
    
    override func setUp() {
        super.setUp()
                       
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngine)
        KindaVimEngine.shared.enterNormalMode()
    }    
    
}
