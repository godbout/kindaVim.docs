import AppKit

extension AccessibilityStrategyVisualMode {
    
    func y(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        
        if element.isEmpty {}
        
        if element.isNotEmpty, element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 0
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {}
        
        
        let value = element.value
        let beginningOfSelectionIndex = value.index(value.startIndex, offsetBy: element.caretLocation)
        let endOfSelectionIndex = value.index(value.startIndex, offsetBy: element.caretLocation + element.selectedLength)
        let currentSelectedText = String(value[beginningOfSelectionIndex..<endOfSelectionIndex])
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(currentSelectedText, forType: .string)
        
        if VimEngine.shared.visualStyle == .characterwise {
            VimEngine.shared.lastYankStyle = .characterwise
        } else {
            VimEngine.shared.lastYankStyle = .linewise
        }
        
        element.selectedLength = 0
        
        return element
    }
    
}
