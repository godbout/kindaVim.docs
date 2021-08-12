extension TextEngine {
    
    func innerBrackets(using bracket: Character, startingAt location: Int, in text: String) -> Range<Int>? {
        guard !text.isEmpty else { return nil }
        
        let characterAtLocationIndex = text.utf16.index(text.startIndex, offsetBy: location)
        let characterAtLocationText = text[characterAtLocationIndex]
                
        let previousUnmatchedBracketLocation: Int
        
        // if the caret is at an opening bracket, we need to start the search AFTER that bracket
        // else we would match the outer bracket range. tricky situation.
        switch characterAtLocationText {
        case "(", "[", "{":
            previousUnmatchedBracketLocation = previousUnmatched(bracket, before: (location + Character.bracketCharacterLength), in: text)
        default:
            previousUnmatchedBracketLocation = previousUnmatched(bracket, before: location, in: text)
        }

        guard let pairingBracket = pairingBracket(of: bracket) else { return nil }
        // we're using the fact that next or previous unmatched, in Vim, will return the matched item if the
        // location is at an item. which means if we're on a {, the next unmatched will be the matching }
        let matchingBracketLocation = nextUnmatched(pairingBracket, after: previousUnmatchedBracketLocation, in: text)
        guard matchingBracketLocation != previousUnmatchedBracketLocation else { return nil }
        
        return previousUnmatchedBracketLocation..<matchingBracketLocation
    }

}
