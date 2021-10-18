@testable import kindaVim
import KeyboardStrategy
import KeyCombination
import Foundation


class KeyboardStrategyVisualModeMock: KeyboardStrategyVisualModeProtocol {
    
    var functionCalled = ""
    
    func bForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func c() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func d() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dollarSignForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func eForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gDollarSignForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func geForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ggForVisualStyleCharacterwise() -> [KeyCombination] {
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
    
    func gZeroForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func GForVisualStyleCharacterwise() -> [KeyCombination] {
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
    
    func VForEnteringFromNormalMode() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func VForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func VForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForEnteringFromNormalMode() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func wForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
   
    func y() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func zeroForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
}
