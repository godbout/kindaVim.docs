extension AccessibilityStrategyNormalMode {
    
    func percent(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
            
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
    
        let lineText = element.currentLine.value
        let searchStartIndex = lineText.index(lineText.startIndex, offsetBy: (element.caretLocation - element.currentLine.start))
        
        if let itemIndex = lineText[searchStartIndex...].firstIndex(where: { ["(", ")", "{", "}", "[", "]"].contains($0) }) {
            let itemCharacter = lineText[itemIndex]
            let itemLocation = element.currentLine.start + lineText.distance(from: lineText.startIndex, to: itemIndex)
            var matchedLocation: Int!
            
            // next or previous unmatched, in Vim, will return the matched item if the location is at an item
            // which is why we're using those functions here. naughty
            switch itemCharacter {
            case "(":
                matchedLocation = textEngine.nextUnmatched(")", after: itemLocation, in: element.value)
            case "[":
                matchedLocation = textEngine.nextUnmatched("]", after: itemLocation, in: element.value)
            case "{":
                matchedLocation = textEngine.nextUnmatched("}", after: itemLocation, in: element.value)
            case ")":
                matchedLocation = textEngine.previousUnmatched("(", before: itemLocation, in: element.value)
            case "]":
                matchedLocation = textEngine.previousUnmatched("[", before: itemLocation, in: element.value)
            case "}":
                matchedLocation = textEngine.previousUnmatched("{", before: itemLocation, in: element.value)
            default:
                ()
            }
            
            // if we got the same location than we gave that means the function couldn't find a match
            // only if we found a match we set the new caret location 
            if itemLocation != matchedLocation {
                element.caretLocation = matchedLocation
            }
        }
        
        return element
    }
    
}
