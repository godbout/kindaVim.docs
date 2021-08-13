extension AccessibilityStrategyNormalMode {
    
    // currently AS u does nothing. we just use it so that we can
    // set a block cursor only for the right AXElements
    func u(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return element
    }
    
}
