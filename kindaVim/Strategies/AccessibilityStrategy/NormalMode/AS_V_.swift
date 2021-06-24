extension AccessibilityStrategy {
    
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = element.currentLine.start!
        element.selectedLength = element.currentLine.length!
        
        return element
    }
    
}
