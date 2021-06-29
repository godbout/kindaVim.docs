import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yy(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.selectedLength = 0
        element.selectedText = nil
        
        
        if element.isEmpty {}
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {}
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {}

        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(element.currentLine.value, forType: .string)     
        
        return element
    }
    
}
