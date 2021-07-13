extension AccessibilityStrategyVisualMode {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if KindaVimEngine.shared.visualStyle == .characterwise, let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
            if element.caretLocation + (element.selectedLength - 1) <= Self.anchor, element.caretLocation > lineAtHead.start {
                element.caretLocation -= 1
                element.selectedLength += 1
            } else if Self.head > lineAtHead.start, element.selectedLength > 1 {
                element.selectedLength -= 1
            }
        }
        
        element.selectedText = nil
        
        return element
    }

}
