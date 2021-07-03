struct AccessibilityStrategy {
    
    static func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    static func push(element: AccessibilityTextElement) -> Bool {
        print("move using Accessibility Stragety")
        
        return AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
    }
    
}
