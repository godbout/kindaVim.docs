@testable import kindaVim
import Foundation
import AccessibilityStrategy


struct FailingAccessibilityStrategyVisualModeStub: AccessibilityStrategyVisualModeProtocol {
    
    func BForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func bForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func caretForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func cForVisualStyleCharacterwise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil 
    }
    
    func cForVisualStyleLinewise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil 
    }
    
    func dForVisualStyleCharacterwise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil 
    }
    
    func dForVisualStyleLinewise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil 
    }
    
    func eForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func EForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func FForVisualStyleCharacterwise(times count: Int?, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func fForVisualStyleCharacterwise(times count: Int?, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gCaretForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func gDollarSignForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func ggForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func ggForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func gZeroForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func GForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func GForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func gEForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func geForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gIForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gjForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func gjForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func gkForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func gkForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func hForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func iWForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func iwForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func jForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func jForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func kForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func kForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
        
    func lForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func TForVisualStyleCharacterwise(times count: Int?, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func tForVisualStyleCharacterwise(times count: Int?, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func underscoreForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func vForEnteringFromNormalMode(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func vForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func vForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func VForEnteringFromNormalMode(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func VForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func VForVisualStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func wForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func WForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func yForVisualStyleCharacterwise(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        return nil 
    }
    
    func yForVisualStyleLinewise(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        return nil 
    }
        
    func dollarSignForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func escape(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }
    
    func zeroForVisualStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil 
    }

}
