extension AccessibilityStrategyNormalMode {
    
    func percent(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(on: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
            
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        
        return nil
    }
    
    private func theMove(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
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
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
