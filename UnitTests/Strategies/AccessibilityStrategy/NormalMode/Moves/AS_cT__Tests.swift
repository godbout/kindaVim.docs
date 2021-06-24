@testable import kindaVim
import XCTest


// this move just calls dT, so no new tests needed
class AS_cT_Tests: AS_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.cT(to: character, on: element) 
    }
    
}
