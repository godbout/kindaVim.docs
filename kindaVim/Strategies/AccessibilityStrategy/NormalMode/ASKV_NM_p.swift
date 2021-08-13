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
        
        newElement.caretLocation = element.caretLocation + element.characterLength
        newElement.selectedLength = 0
        newElement.selectedText = textToPaste.value
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        
        guard var updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else {
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement    
        } 
        
        updatedElement.caretLocation -= updatedElement.characterLengthForCharacter(before: updatedElement.caretLocation)
        updatedElement.selectedLength = updatedElement.characterLength
        updatedElement.selectedText = nil
        
        return updatedElement
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
        
        let textToPaste = NSPasteboard.general.string(forType: .string) ?? ""
        
        if element.currentLine.isAnEmptyLine {
            newElement.caretLocation = element.caretLocation
        } else {
            newElement.caretLocation = element.caretLocation + element.characterLength
        }
                
        newElement.selectedLength = 0
        newElement.selectedText = textToPaste
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        
        guard var updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else {
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        guard textToPaste.contains("\n") == false else {
            updatedElement.caretLocation = newElement.caretLocation
            updatedElement.selectedLength = updatedElement.characterLength
            updatedElement.selectedText = nil
            
            return updatedElement
        }
        
        updatedElement.caretLocation -= updatedElement.characterLengthForCharacter(before: updatedElement.caretLocation)
        updatedElement.selectedLength = updatedElement.characterLength
        updatedElement.selectedText = nil
        
        return updatedElement        
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
        
        guard var updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else {
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        if element.currentLine.isTheLastLine {
            updatedElement.caretLocation = (newElement.caretLocation + Character.linefeedCharacterLength) + textEngine.firstNonBlank(in: textToPaste.value) 
        } else {
            updatedElement.caretLocation = newElement.caretLocation + textEngine.firstNonBlank(in: textToPaste.value)
        }
        
        updatedElement.selectedLength = updatedElement.characterLength
        updatedElement.selectedText = nil
        
        return updatedElement
    }
    
}
