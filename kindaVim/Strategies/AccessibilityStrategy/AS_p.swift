import AppKit

extension AccessibilityStrategy {
    
    func p(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if element.role == .textField {
            return pForTextFields(on: element)
        }
        
        if element.role == .textArea {
            return pForTextAreas(on: element)
        }        
        
        return element         
    }
    
    private func pForTextFields(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        
        element.caretLocation += 1
        element.selectedText = NSPasteboard.general.string(forType: .string)
            
        return element
    }
    
    private func pForTextAreas(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            element.selectedText = NSPasteboard.general.string(forType: .string)    
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        
        if VimEngine.shared.lastYankStyle == .characterwise {
            element.caretLocation += 1
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        if VimEngine.shared.lastYankStyle == .linewise {
            element.caretLocation = element.currentLine.end!
            
            if element.currentLine.isTheLastLine {
                element.selectedLength = 0
                element.selectedText = "\n" + NSPasteboard.general.string(forType: .string)!
            } else {
                element.selectedLength = 0
                element.selectedText = NSPasteboard.general.string(forType: .string)
            }

            _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
            
            element.caretLocation += 1
            element.selectedText = nil

            return element
        }
        
        return element
    }
    
}
