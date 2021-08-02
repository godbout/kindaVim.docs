extension TextEngine {
    
    func innerWord(startingAt location: Int, in text: String) -> Range<Int> {
        guard !text.isEmpty else { return 0..<0 }
        
        // weird Vim move for that one: if on last empty line, iw selects the linefeed and last character of the previous line before the linefeed
        guard let characterAtLocationIndex = text.utf16.index(text.startIndex, offsetBy: location, limitedBy: text.index(before: text.endIndex)) else { return ((text.utf16.count - 1) - text.characterLengthForCharacter(before: location - 1))..<text.utf16.count }
        let characterAtLocationText = text[characterAtLocationIndex]
        
        if characterAtLocationText == " " {
            let previousNonBlankLocation = findPreviousNonBlank(startingAt: location, in: text) ?? 0
            let nextNonBlankLocation = findNextNonBlank(after: location, in: text) ?? text.utf16.count  
            
            guard previousNonBlankLocation != 0 else { return 0..<nextNonBlankLocation }
            
            return (previousNonBlankLocation + text.characterLengthForCharacter(at: previousNonBlankLocation))..<nextNonBlankLocation
        }
        
        let beginningOfWordLocation = beginningOfWordBackward(startingAt: location + text.characterLengthForCharacter(at: location), in: TextEngineText(from: text))
        let endOfWordLocation = endOfWordForward(startingAt: location - text.characterLengthForCharacter(before: location), in: TextEngineText(from: text))
        
        return beginningOfWordLocation..<(endOfWordLocation + text.characterLengthForCharacter(at: endOfWordLocation))
    }
    
}
