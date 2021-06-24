@testable import kindaVim
import XCTest

class ASNM_BaseTests: XCTestCase {
    
    var textEngine = TextEngine()
    var accessibilityStrategy: AccessibilityStrategy!
    
    
    override func setUp() {
        super.setUp()
                       
        accessibilityStrategy = AccessibilityStrategy(textEngine: textEngine)
    }    
    
}
