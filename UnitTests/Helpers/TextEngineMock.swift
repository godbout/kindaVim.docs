@testable import kindaVim
import Foundation

class TextEngineMock: TextEngineProtocol {
    
    var functionCalled = ""
    
    func wordBackward(count: Int = 1, for location: Int, playground text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func wordForward(count: Int = 1, for location: Int, playground text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
}
