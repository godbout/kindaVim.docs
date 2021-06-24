@testable import kindaVim
import XCTest


// this move just calls df so no new tests needed
class ASNM_cf_Tests: ASNM_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.cf(to: character, on: element) 
    }
    
}
