@testable import kindaVim


class CommandLineModeMock: CommandLineModeProtocol {
    
    var functionCalled = ""
    
        
    func AForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
