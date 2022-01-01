@testable import kindaVim
import Foundation
import AccessibilityStrategy


class AccessibilityStrategyVisualModeMock: AccessibilityStrategyVisualModeProtocol {
    
    var functionCalled = ""
    var pgRPassed = false
    
    
    func BForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func bForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func C(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func caretForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func cForVisualStyleCharacterwise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func cForVisualStyleLinewise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func dForVisualStyleCharacterwise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func dForVisualStyleLinewise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func dollarSignForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func EForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func eForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func escape(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func FForVisualStyleCharacterwise(times count: Int?, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func fForVisualStyleCharacterwise(times count: Int?, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gCaretForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gDollarSignForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func ggForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func ggForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gIForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gjForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gjForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gkForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gkForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gZeroForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func GForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func GForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gEForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func geForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func hForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func iWForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func iwForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func jForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func jForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func kForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func kForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func lForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func TForVisualStyleCharacterwise(times count: Int?, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func tForVisualStyleCharacterwise(times count: Int?, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func underscoreForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func vForEnteringFromNormalMode(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func vForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func vForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func VForEnteringFromNormalMode(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func VForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func VForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func wForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }
    
    func WForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }

    func xForVisualStyleCharacterwise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func xForVisualStyleLinewise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func Y(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yForVisualStyleCharacterwise(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yForVisualStyleLinewise(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func zeroForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }   
    
}
