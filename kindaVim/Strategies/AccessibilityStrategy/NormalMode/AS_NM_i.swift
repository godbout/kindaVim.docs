extension AccessibilityStrategyNormalMode {
    
    func i(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        newElement.selectedLength = 0
        newElement.selectedText = nil
        
        return newElement
    }
    
}
