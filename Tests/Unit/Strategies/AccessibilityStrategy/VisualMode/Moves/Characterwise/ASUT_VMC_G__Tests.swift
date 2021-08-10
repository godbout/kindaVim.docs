@testable import kindaVim
import XCTest


class ASUT_VMC_G__Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.visualStyle = .characterwise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.G(on: element)
    }
    
}


// Both
extension ASUT_VMC_G__Tests {

    
    
}
