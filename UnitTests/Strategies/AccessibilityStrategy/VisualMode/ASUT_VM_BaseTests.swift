@testable import kindaVim
import XCTest

class ASVM_BaseTests: XCTestCase {
    
    var asVisualMode: AccessibilityStrategyVisualMode!
    
    
    override func setUp() {
        super.setUp()
        
        asVisualMode = AccessibilityStrategyVisualMode()
        KindaVimEngine.shared.enterVisualMode()
    }    
    
}
