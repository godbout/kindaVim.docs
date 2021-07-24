protocol AccessibilityStrategyProtocol {
        
    func focusedElement() -> AccessibilityTextElement?
    func push(element: AccessibilityTextElement) -> Bool
        
}


struct AccessibilityStrategy: AccessibilityStrategyProtocol {
    
    func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    func push(element: AccessibilityTextElement) -> Bool {
        print("move using Accessibility Stragety")
        
        return AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
    }
    
}
