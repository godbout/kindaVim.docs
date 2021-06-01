@testable import kindaVim
import Foundation

class TextEngineMock: TextEngineProtocol {
    
    var functionCalled = ""
    
    func findFirst(_ character: Character, in text: String) -> Int? {
        functionCalled = #function
        
        return nil 
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
    
    func wordBackward(for location: Int, playground text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func wordForward(for location: Int, playground text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
}
