extension AccessibilityStrategyNormalMode {
    
    func percent(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        let lineText = element.currentLine.value
        let searchStartIndex = lineText.utf16.index(lineText.startIndex, offsetBy: (element.caretLocation - element.currentLine.start))
        
        if let itemIndex = lineText[searchStartIndex...].firstIndex(where: { ["(", ")", "{", "}", "[", "]"].contains($0) }) {
            let itemCharacter = lineText[itemIndex]
            let itemLocation = element.currentLine.start + lineText.utf16.distance(from: lineText.startIndex, to: itemIndex)
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
                newElement.caretLocation = matchedLocation
                newElement.selectedLength = newElement.characterLength
                newElement.selectedText = nil
                
                return newElement
            }
            
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
