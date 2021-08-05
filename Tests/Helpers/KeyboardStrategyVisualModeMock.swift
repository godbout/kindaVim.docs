@testable import kindaVim
import Foundation


class KeyboardStrategyVisualModeMock: KeyboardStrategyVisualModeProtocol {
    
    var functionCalled = ""
    

    func j() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func k() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
}
