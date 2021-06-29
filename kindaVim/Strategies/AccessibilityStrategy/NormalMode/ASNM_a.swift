extension AccessibilityStrategyNormalMode {
    
    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        guard element.currentLine.isNotAnEmptyLine else { return element }
        
        element.caretLocation += 1
        
        return element
    }
    
}
