extension TextEngine { 
    
    func beginningOfParagraphBackward(startingAt location: Int, in text: TextEngineText) -> Int {
        guard text.isNotEmpty else { return 0 }
        
        let value = text.value
        
        var searchEndIndex = value.utf16.index(value.startIndex, offsetBy: location)
        
        while searchEndIndex != value.startIndex, searchEndIndex != value.endIndex, value[searchEndIndex].isNewline {
            searchEndIndex = value.index(before: searchEndIndex)
        }        
        
        if let previousEmptyLineRange = value.range(of: "\n\n", options: [.backwards], range: value.startIndex..<searchEndIndex) {
            return value.utf16.distance(from: value.startIndex, to: previousEmptyLineRange.lowerBound) + 1
        }
        
        return 0
    }
    
}
