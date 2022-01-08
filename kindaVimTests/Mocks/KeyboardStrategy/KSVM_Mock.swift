@testable import kindaVim
import KeyboardStrategy
import KeyCombination
import Foundation


class KeyboardStrategyVisualModeMock: KeyboardStrategyVisualModeProtocol {
    
    var functionCalled = ""
    
    
    func bForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func bForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func CForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func CForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func caretForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func caretForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func DForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func DForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dollarSignForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dollarSignForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func eForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func eForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gCaretForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gCaretForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gDollarSignForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gDollarSignForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func geForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func geForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ggForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ggForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ggForTextElementWhenInVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gIForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gIForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gjForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gjForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gkForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gkForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gZeroForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gZeroForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func GForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func GForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func GForTextElementWhenInVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func hForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func jForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func jForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
      
    func kForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
       
    func kForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
       
    func lForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func underscoreForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func underscoreForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func VForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func VForTextElementWhenEnteringFromNormalMode() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func VForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func VForTextElementWhenInVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForTextElementWhenEnteringFromNormalMode() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForTextElementWhenInVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func wForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
   
    func wForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
   
    func XForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func XForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func xForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func xForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func YForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func YForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func yForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func yForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func zeroForNonTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func zeroForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
}
