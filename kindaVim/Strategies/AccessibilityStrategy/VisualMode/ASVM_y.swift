import AppKit

extension AccessibilityStrategyVisualMode {
    
    func y(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if let selectedText = element.selectedText {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(selectedText, forType: .string)
        }
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
            KindaVimEngine.shared.lastYankStyle = .characterwise
        } else {
            KindaVimEngine.shared.lastYankStyle = .linewise
        }
        
        element.selectedLength = 1     
        element.selectedText = nil
        
        return element
    }
    
}
