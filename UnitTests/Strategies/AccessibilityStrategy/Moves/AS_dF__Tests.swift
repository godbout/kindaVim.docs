@testable import kindaVim
import XCTest


// this move just calls cF so no new tests needed
class AS_dF__Tests: AS_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.dF(to: character, on: element) 
    }
    
}
