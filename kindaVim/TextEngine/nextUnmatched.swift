extension TextEngine {
    
    func nextUnmatched(_ bracket: Character, after location: Int, in text: String) -> Int {
        let locationIndex = text.utf16.index(text.startIndex, offsetBy: location)
        let searchText = String(text[locationIndex...])
        
        if let rightBracketFoundLocation = findNextUnmatched(bracket, after: 0, in: searchText) {
            return location + rightBracketFoundLocation
        }
        
        return location
    }  
    
}
