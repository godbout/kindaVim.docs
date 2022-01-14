@testable import kindaVim
import Commands
import KeyCombination


class CommandsMock: CommandsProtocol {
    
    var functionCalled = ""
        
    
    func colonq() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func colonqBang() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func colonw() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func colonwq() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func colonx() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ZZ() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
} 
