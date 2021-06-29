extension AccessibilityStrategyNormalMode {
    
    func dF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if let elementFound = F(to: character, on: element), element != elementFound {
            element.selectedLength = element.caretLocation - elementFound.caretLocation
            element.caretLocation = elementFound.caretLocation
            element.selectedText = ""
        }
        
        return element
    }
    
}
