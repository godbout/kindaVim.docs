@testable import kindaVim
import KeyCombination
import XCTest

class ASVM_BaseTests: XCTestCase {
    
    var asVisualMode: AccessibilityStrategyVisualMode!
    
    
    override func setUp() {
        super.setUp()
        
        asVisualMode = AccessibilityStrategyVisualMode()
        KindaVimEngine.shared.enterVisualMode()
    }    
    
}
