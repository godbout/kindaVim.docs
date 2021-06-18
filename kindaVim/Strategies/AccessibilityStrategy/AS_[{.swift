extension AccessibilityStrategy {
    
    func leftBracketLeftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        
        
        if let unmatchedLeftBraceFoundLocation = textEngine.findPreviousUnmatched("{", before: element.caretLocation, in: element.value) {
            element.caretLocation = unmatchedLeftBraceFoundLocation
        }
        
        print("searched for unmatched {")
        
        return element
    }
    
}
