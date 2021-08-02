extension TextEngine {
    
    func previousUnmatched(_ bracket: Character, before location: Int, in text: String) -> Int {
        let locationIndex = text.utf16.index(text.startIndex, offsetBy: location)
        let searchText = String(text[..<locationIndex])
        
        if let leftBracketFoundLocation = findPreviousUnmatched(bracket, before: location, in: searchText) {
            return leftBracketFoundLocation
        }
        
        return location
    }
    
}
