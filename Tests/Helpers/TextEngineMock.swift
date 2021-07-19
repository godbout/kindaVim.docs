@testable import kindaVim
import Foundation


class TextEngineMock: TextEngineProtocol {
    
    var functionCalled = ""
    
    
    func beginningOfParagraphBackward(startingAt location: Int, in text: TextEngineText) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func beginningOfWordBackward(startingAt location: Int, in text: TextEngineText) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func beginningOfWORDBackward(startingAt location: Int, in text: TextEngineText) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func beginningOfWordForward(startingAt location: Int, in text: TextEngineText) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func beginningOfWORDForward(startingAt location: Int, in text: TextEngineText) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func endOfParagraphForward(startingAt location: Int, in text: TextEngineText) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func endOfWordBackward(startingAt location: Int, in text: TextEngineText) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func endOfWORDBackward(startingAt location: Int, in text: TextEngineText) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func endOfWordForward(startingAt location: Int, in text: TextEngineText) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func endOfWORDForward(startingAt location: Int, in text: TextEngineText) -> Int {
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
    
    func firstNonBlankWithinLineLimit(in line: TextEngineLine) -> Int {
        functionCalled = #function
        
        return 0
    }
    
    func innerQuotedString(using quote: Character, startingAt location: Int, in text: String) -> Range<Int>? {
        functionCalled = #function
        
        return nil
    }
    
    func innerWord(startingAt location: Int, in text: TextEngineText) -> Range<Int> {
        functionCalled = #function
        
        return 0..<0 
    }
        
    func nextUnmatched(_ bracket: Character, after location: Int, in text: String) -> Int {
        functionCalled = #function
        
        return 0
    }
    
    func previousUnmatched(_ bracket: Character, before location: Int, in text: String) -> Int {
        functionCalled = #function
        
        return 0 
    }    
    
}
