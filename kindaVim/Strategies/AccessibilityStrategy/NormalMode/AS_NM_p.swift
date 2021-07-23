import AppKit

extension AccessibilityStrategyNormalMode {
    
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
    
    private func pForTextFields(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
        textToPaste.removeTrailingLinefeedIfAny()
        
        newElement.caretLocation += element.characterLength
        newElement.selectedLength = 0
        newElement.selectedText = textToPaste.value
        
        return newElement
    }
    
    private func pForTextAreas(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        let element = element
        
        if KindaVimEngine.shared.lastYankStyle == .characterwise {
            return pForTextAreasCharacterwise(on: element)
        }
        
        if KindaVimEngine.shared.lastYankStyle == .linewise {
            return pForTextAreasLinewise(on: element)
        }
        
        return element
    }
    
    private func pForTextAreasCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        guard element.currentLine.isNotAnEmptyLine else {
            newElement.selectedLength = 0
            newElement.selectedText = NSPasteboard.general.string(forType: .string)    
            
            return newElement
        }
        
        newElement.caretLocation += element.characterLength
        newElement.selectedLength = 0
        newElement.selectedText = NSPasteboard.general.string(forType: .string)
        
        return newElement
    }

    private func pForTextAreasLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        var textToPaste: TextEngineLine
        
        if element.currentLine.isTheLastLine {
            textToPaste = TextEngineLine(from: "\n" + (NSPasteboard.general.string(forType: .string) ?? ""))
            textToPaste.removeTrailingLinefeedIfAny()
        } else {
            textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
            textToPaste.addTrailingLinefeedIfNone()            
        }
        
        newElement.caretLocation = element.currentLine.end
        newElement.selectedLength = 0
        newElement.selectedText = textToPaste.value
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        
        newElement.caretLocation += 1 + textEngine.firstNonBlank(in: textToPaste.value)
        newElement.selectedLength = newElement.characterLength
        newElement.selectedText = nil
        
        return newElement    
    }
    
}
