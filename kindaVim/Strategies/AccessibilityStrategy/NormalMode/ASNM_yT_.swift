import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element 
        }
        
        
        
        if let elementFound = T(to: character, on: element), elementFound.selectedText != nil {
            let text = element.value
            let caretLocationIndex = text.index(text.startIndex, offsetBy: element.caretLocation)
            let elementFoundCaretLocationIndex = text.index(text.startIndex, offsetBy: elementFound.caretLocation)
            
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(String(text[elementFoundCaretLocationIndex..<caretLocationIndex]), forType: .string)
            
            element.caretLocation = elementFound.caretLocation
        }
        
        return element
    }
    
}
