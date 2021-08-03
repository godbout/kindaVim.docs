protocol AccessibilityStrategyProtocol {
        
    func focusedTextElement() -> AccessibilityTextElement?
    func push(element: AccessibilityTextElement) -> Bool
        
}


struct AccessibilityStrategy: AccessibilityStrategyProtocol {
    
    func focusedTextElement() -> AccessibilityTextElement? {
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    func push(element: AccessibilityTextElement) -> Bool {
        print("move using Accessibility Stragety")
        
        return AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
    }
    
}
