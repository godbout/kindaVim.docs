extension AccessibilityStrategyVisualMode {
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
   
        if KindaVimEngine.shared.visualStyle == .characterwise {
            return jForVisualModeCharacterwise(on: element)
        }
        
        if KindaVimEngine.shared.visualStyle == .linewise {
            return jForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func jForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: Self.head), let lineBelowHead = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtHead.number + 1) {
            var newHeadLocation = lineBelowHead.start + (AccessibilityTextElement.globalColumnNumber - 1)
            var globalColumnNumber: Int?
            
            // if the new head is over the line limit, we set it at the line limit,
            // and we will override the setting of the globalColumnNumber
            if newHeadLocation >= lineBelowHead.end {
                newHeadLocation = lineBelowHead.end - element.characterLengthForCharacter(before: lineBelowHead.end)
                globalColumnNumber = AccessibilityTextElement.globalColumnNumber
            }
            
            // yes, + 1. check KV NM jk to see why (currently don't know how to handle colums with emojis)
            if Self.head >= Self.anchor, newHeadLocation > Self.anchor {
                newElement.selectedLength = (newHeadLocation + 1) - Self.anchor
            } else if Self.head < Self.anchor, newHeadLocation >= Self.anchor {
                newElement.caretLocation = Self.anchor
                newElement.selectedLength = (newHeadLocation + 1) - Self.anchor 
            } else if Self.head < Self.anchor, newHeadLocation < Self.anchor {
                newElement.caretLocation = newHeadLocation
                newElement.selectedLength = (Self.anchor + 1) - newHeadLocation
            }
            
            // so here we override the globalColumnNumber as when you reach the end
            // of a line through jk it should let go of the update of the globalColumnNumber
            if globalColumnNumber != nil {
                AccessibilityTextElement.globalColumnNumber = globalColumnNumber!
            }
                
            newElement.selectedText = nil
            
            return newElement
        }
        
        if Self.anchor == element.length {
            let globalColumnNumber = AccessibilityTextElement.globalColumnNumber
            
            newElement.caretLocation = element.length
            newElement.selectedLength = 0
            newElement.selectedText = nil
            
            AccessibilityTextElement.globalColumnNumber = globalColumnNumber
            
            return newElement
        } 
        
        newElement.caretLocation = Self.anchor
        newElement.selectedLength = element.length - Self.anchor 
        newElement.selectedText = nil
        
        return newElement
    }
    
    private func jForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        guard let lineAtAnchor = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement             
        }
        
        guard let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        if lineAtHead.number >= lineAtAnchor.number {
            if let lineBelowHead = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtHead.number + 1) {
                newElement.selectedLength += lineBelowHead.length
            }
        } else {
            newElement.caretLocation += lineAtHead.length
            newElement.selectedLength -= lineAtHead.length 
        }
        
        newElement.selectedText = nil
        
        return newElement
    }
}
