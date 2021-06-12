extension AccessibilityStrategy {
    
    func ciw(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        let (beginningOfWordLocation, endOfWordLocation) = textEngine.innerWord(startingAt: element.caretLocation, in: element.value)
        
        element.caretLocation = beginningOfWordLocation
        element.selectedLength = endOfWordLocation - beginningOfWordLocation
        element.selectedText = ""
        
        return element
    }
    
}
