extension AccessibilityStrategyNormalMode {
    
    func i(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.selectedLength = 0
        element.selectedText = nil
        
        return element
    }
    
}
