extension AccessibilityStrategyVisualMode {
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if VimEngine.shared.visualStyle == .characterwise, let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
            if element.caretLocation < Self.anchor, element.caretLocation <= lineAtHead.endLimit {
                element.caretLocation += 1
                element.selectedLength -= 1
            } else if element.caretLocation + element.selectedLength < lineAtHead.end {
                element.selectedLength += 1            
            }            
        }        
        
        element.selectedText = nil
        
        return element
    }
    
}
