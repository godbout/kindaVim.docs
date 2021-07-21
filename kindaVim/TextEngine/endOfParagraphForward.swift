extension TextEngine {
    
    func endOfParagraphForward(startingAt location: Int, in text: TextEngineText) -> Int {
        guard text.isNotEmpty else { return 0 }
        
        let value = text.value
                
        var searchStartIndex = value.utf16.index(value.startIndex, offsetBy: location)
        
        while searchStartIndex != value.endIndex, value[searchStartIndex].isNewline {
            searchStartIndex = value.index(after: searchStartIndex)
        }        
        
        if let nextEmptyLineRange = value.range(of: "\n\n", options: [], range: searchStartIndex..<value.endIndex) {
            return value.utf16.distance(from: value.startIndex, to: nextEmptyLineRange.lowerBound) + 1
        }
        
        return text.endLimit
    }
    
}
