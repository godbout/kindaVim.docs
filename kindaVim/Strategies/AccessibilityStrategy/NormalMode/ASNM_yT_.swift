import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.selectedLength = 0
        element.selectedText = nil
                
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element 
        }
                
        
        if let elementFound = T(to: character, on: element), elementFound.caretLocation != element.caretLocation {
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
