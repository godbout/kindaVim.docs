@testable import kindaVim
import XCTest


// this move just calls dT, so no new tests needed
class ASNM_cT_Tests: ASNM_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.cT(to: character, on: element) 
    }
    
}
