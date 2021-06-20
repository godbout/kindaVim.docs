@testable import kindaVim
import XCTest


// this move just calls df so no new tests needed
class AS_cf_Tests: AS_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.cf(to: character, on: element) 
    }
    
}
