@testable import kindaVim
import XCTest


class ASUT_VML_G__Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.visualStyle = .linewise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.G(on: element)
    }
    
}


// Both
extension ASUT_VML_G__Tests {

    
    
}
