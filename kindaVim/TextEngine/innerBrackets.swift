extension TextEngine {
    
    func innerBrackets(using bracket: Character, startingAt location: Int, in text: String) -> Range<Int>? {
        guard !text.isEmpty else { return nil }
        
        guard let pairingBracket = pairingBracket(of: bracket) else { return nil }
        
        let previousUnmatchedBracketLocation = previousUnmatched(bracket, before: location, in: text) 
        // we're using the fact that next or previous unmatched, in Vim, will return the matched item if the
        // location is at an item. which means if we're on a {, the next unmatched will be the matching }
        let matchingBracketLocation = nextUnmatched(pairingBracket, after: previousUnmatchedBracketLocation, in: text)
        guard matchingBracketLocation != previousUnmatchedBracketLocation else { return nil }
        
        return previousUnmatchedBracketLocation..<matchingBracketLocation
    }
    
}
