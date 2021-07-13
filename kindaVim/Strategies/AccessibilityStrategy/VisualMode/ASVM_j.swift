extension AccessibilityStrategyVisualMode {
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
   
        if VimEngine.shared.visualStyle == .characterwise {
            return jForVisualModeCharacterwise(on: element)
        }
        
        if VimEngine.shared.visualStyle == .linewise {
            return jForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func jForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: Self.head), let lineBelowHead = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtHead.number + 1) {
            var newHeadLocation = lineBelowHead.start + (AccessibilityTextElement.globalColumnNumber - 1)
            var globalColumnNumber: Int?
            
            // if the new head is over the line limit, we set it at the line limit,
            // and we will override the setting of the globalColumnNumber
            if newHeadLocation >= lineBelowHead.end {
                newHeadLocation = lineBelowHead.end - 1
                globalColumnNumber = AccessibilityTextElement.globalColumnNumber
            }
            
            if Self.head >= Self.anchor, newHeadLocation > Self.anchor {
                element.selectedLength += newHeadLocation - Self.head
            } else if Self.head < Self.anchor, newHeadLocation >= Self.anchor {
                element.caretLocation = Self.anchor
                element.selectedLength += (Self.head - Self.anchor) + (newHeadLocation - Self.anchor)
            } else if Self.head < Self.anchor, newHeadLocation < Self.anchor {
                element.caretLocation = newHeadLocation
                element.selectedLength -= newHeadLocation - Self.head
            }
            
            // so here we override the globalColumnNumber as when you reach the end
            // of a line through jk it should let go of the update of the globalColumnNumber
            if globalColumnNumber != nil {
                AccessibilityTextElement.globalColumnNumber = globalColumnNumber!
            }
                
            element.selectedText = nil
            
            return element
        }
        
        if Self.anchor == element.length {
            let globalColumnNumber = AccessibilityTextElement.globalColumnNumber
            
            element.caretLocation = element.length
            element.selectedLength = 0
            element.selectedText = nil
            
            AccessibilityTextElement.globalColumnNumber = globalColumnNumber
            
            return element
        } 
        
        element.selectedLength += (element.length - Self.head) - 1
        element.selectedText = nil
        
        return element
    }
    
    private func jForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        guard let lineAtAnchor = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor) else {
            element.selectedLength = 1
            element.selectedText = nil
            
            return element             
        }
        
        guard let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) else {
            element.selectedLength = 1
            element.selectedText = nil
            
            return element
        }
        
        if lineAtHead.number >= lineAtAnchor.number {
            if let lineBelowHead = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtHead.number + 1) {
                element.selectedLength += lineBelowHead.length
            }
        } else {
            element.caretLocation += lineAtHead.length
            element.selectedLength -= lineAtHead.length 
        }
        
        element.selectedText = nil
        
        return element
    }
}
