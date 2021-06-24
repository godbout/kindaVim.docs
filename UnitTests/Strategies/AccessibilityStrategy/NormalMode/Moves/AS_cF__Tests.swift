@testable import kindaVim
import XCTest


// this move just calls dF so no new tests needed
class AS_cF__Tests: AS_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.cF(to: character, on: element) 
    }
    
}
