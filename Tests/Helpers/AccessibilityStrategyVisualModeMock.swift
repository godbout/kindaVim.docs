@testable import kindaVim
import Foundation
import AccessibilityStrategy


class AccessibilityStrategyVisualModeMock: AccessibilityStrategyVisualModeProtocol {
    
    var functionCalled = ""

    
    func bForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func cForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func cForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func dForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func dForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func eForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
    
    func GForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func GForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func hForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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

    func yForVisualStyleCharacterwise(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yForVisualStyleLinewise(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func dollarSignForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func zeroForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }   
    
    func escape(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
}
