@testable import kindaVim
import XCTest


class ASVMC_0_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.visualStyle = .characterwise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.zero(on: element) 
    }
    
}




// Both
extension ASVMC_0_Tests {
    
    
    
}
