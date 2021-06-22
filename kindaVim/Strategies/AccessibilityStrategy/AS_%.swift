extension AccessibilityStrategy {
    
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
        let searchStartIndex = lineText.index(lineText.startIndex, offsetBy: (element.caretLocation - element.currentLine.start!))
        
        if let itemIndex = lineText[searchStartIndex...].firstIndex(where: { ["(", ")", "{", "}", "[", "]"].contains($0) }) {
            let itemCharacter = lineText[itemIndex]
            let itemLocation = element.currentLine.start! + lineText.distance(from: lineText.startIndex, to: itemIndex)
            
            switch itemCharacter {
            case "(":
                element.caretLocation = textEngine.nextUnmatched(")", after: itemLocation, in: element.value)
            case "[":
                element.caretLocation = textEngine.nextUnmatched("]", after: itemLocation, in: element.value)
            case "{":
                element.caretLocation = textEngine.nextUnmatched("}", after: itemLocation, in: element.value)
            case ")":
                element.caretLocation = textEngine.previousUnmatched("(", before: itemLocation, in: element.value)
            case "]":
                element.caretLocation = textEngine.previousUnmatched("[", before: itemLocation, in: element.value)
            case "}":
                element.caretLocation = textEngine.previousUnmatched("{", before: itemLocation, in: element.value)
            default:
                ()
            }
        }
        
        return element
    }
    
}
