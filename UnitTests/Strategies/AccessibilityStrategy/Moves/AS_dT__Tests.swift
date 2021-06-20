@testable import kindaVim
import XCTest


// this move just calls cT, so no new tests needed
class AS_dT_Tests: AS_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.dT(to: character, on: element) 
    }
    
}
