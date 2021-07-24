extension AccessibilityStrategyVisualMode {
    
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if KindaVimEngine.shared.visualStyle == .characterwise, let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
            if lineAtHead.start <= Self.anchor || Self.head <= Self.anchor {
                element.caretLocation = lineAtHead.start
                element.selectedLength = (Self.anchor + 1) - lineAtHead.start
            } else {
                element.selectedLength = (lineAtHead.start + 1) - Self.anchor
            }
        }
       
        element.selectedText = nil
        
        return element
    }

}
