@testable import kindaVim
import Foundation

class TextEngineMock: TextEngineProtocol {
    
    var functionCalled = ""
    
    func findFirst(_ character: Character, in text: String) -> Int? {
        functionCalled = #function
        
        return nil 
    }
    
    func findFirstNonBlank(in text: String) -> Int {
        functionCalled = #function
        
        return 0
    }
    
    func findNext(_ character: Character, after location: Int, in text: String) -> Int? {
        functionCalled = #function
        
        return nil 
    }
    
    func findPrevious(_ character: Character, before location: Int, in text: String) -> Int? {
        functionCalled = #function
        
        return nil 
    }
    
    func findSecond(_ character: Character, in text: String) -> Int? {
        functionCalled = #function
        
        return nil 
    }
    
    func wordBackward(startingAt location: Int, in text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func wordForward(startingAt location: Int, in text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
}
