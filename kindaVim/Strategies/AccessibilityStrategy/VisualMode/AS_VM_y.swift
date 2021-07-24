import AppKit

extension AccessibilityStrategyVisualMode {
    
    func y(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if let selectedText = element.selectedText {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(selectedText, forType: .string)
        }
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
            KindaVimEngine.shared.lastYankStyle = .characterwise
        } else {
            KindaVimEngine.shared.lastYankStyle = .linewise
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
