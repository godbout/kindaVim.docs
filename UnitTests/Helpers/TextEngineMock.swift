@testable import kindaVim
import Foundation

class TextEngineMock: TextEngineProtocol {
    
    var functionCalled = ""
    
    func wordBackward(for location: Int, playground text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func wordForward(for location: Int, playground text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
}
