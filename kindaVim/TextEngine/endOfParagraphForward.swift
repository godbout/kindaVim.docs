extension TextEngine {
    
    func endOfParagraphForward(startingAt location: Int, in text: TextEngineText) -> Int {
        let value = text.value
        
        guard !value.isEmpty else { return 0 }
        
        var searchStartIndex = value.index(value.startIndex, offsetBy: location)
        
        while searchStartIndex != value.endIndex, value[searchStartIndex].isNewline {
            searchStartIndex = value.index(after: searchStartIndex)
        }        
        
        if let nextEmptyLineRange = value.range(of: "\n\n", options: [], range: searchStartIndex..<value.endIndex) {
            return value.distance(from: value.startIndex, to: nextEmptyLineRange.lowerBound) + 1
        }
        
        return text.endLimit
    }
    
}
