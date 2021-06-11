@testable import kindaVim
import Foundation

class TextEngineMock: TextEngineProtocol {
    
    var functionCalled = ""
    
    func beginningOfWordBackward(startingAt location: Int, in text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func beginningOfWordForward(startingAt location: Int, in text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func endOfWordForward(startingAt location: Int, in text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
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
    
    func firstNonBlank(in text: String) -> Int {
        functionCalled = #function
        
        return 0
    }
    
    func innerWord(startingAt location: Int, in text: String) -> (Int, Int) {
        functionCalled = #function
        
        return (0, 0)
    }
    
    func firstLine(in text: String) -> String {
        functionCalled = #function
        
        return ""
    }
    
    func lastLine(in text: String) -> TextEngineLine {
        functionCalled = #function
        
        return TextEngineLine(start: 0, end: 0, value: "")
    }
    
    func nextLine(after location: Int, in text: String) -> String? {
        functionCalled = #function
        
        return nil
    }
    
    func previousLine(before location: Int, in text: String) -> String? {
        functionCalled = #function
        
        return nil
    }    
    
}
