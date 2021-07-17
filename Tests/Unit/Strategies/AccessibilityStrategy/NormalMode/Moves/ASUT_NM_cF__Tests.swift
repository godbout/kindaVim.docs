@testable import kindaVim
import XCTest


// this move just calls dF so no new tests needed
class ASNM_cF__Tests: ASNM_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.cF(to: character, on: element) 
    }
    
}
