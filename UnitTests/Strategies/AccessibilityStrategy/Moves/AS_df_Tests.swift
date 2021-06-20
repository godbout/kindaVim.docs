@testable import kindaVim
import XCTest


// this move just calls cf so no new tests needed
class AS_df_Tests: AS_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.df(to: character, on: element) 
    }
    
}
