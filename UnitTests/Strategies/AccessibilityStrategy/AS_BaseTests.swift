@testable import kindaVim
import XCTest

class AS_BaseTests: XCTestCase {
    
    var textEngineMock = TextEngineMock()
    var accessibilityStrategy: AccessibilityStrategy!
    
    
    override func setUp() {
        super.setUp()
                       
        accessibilityStrategy = AccessibilityStrategy(textEngine: textEngineMock)
    }    
    
}
