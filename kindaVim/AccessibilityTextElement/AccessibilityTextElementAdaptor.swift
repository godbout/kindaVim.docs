import Foundation

struct AccessibilityTextElementAdaptor {
    
    // TO THINK:
    // tried to keep a static variable to the last axFocusedElement
    // to avoid querying for it again when we write to it.
    // it makes sense while using the app because we will always
    // write to the field we currently are in. but it makes testing
    // harder to understand, as you need to reset the static variable in between.
    // not sure how to handle this yet. without a static variable, we have to requery,
    // which seems actually very fast. so maybe it's safer this way.

    static func fromAXFocusedElement() -> AccessibilityTextElement? {
        guard let axFocusedElement = AXEngine.axFocusedElement() else { return nil }

        var values: CFArray?
        let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXRoleAttribute, kAXValueAttribute, kAXSelectedTextRangeAttribute, kAXSelectedTextAttribute] as CFArray, .stopOnError, &values)

        guard error == .success, let elementValues = values as NSArray? else { return nil }

        var selectedTextRange = CFRange()
        AXValueGetValue(elementValues[2] as! AXValue, .cfRange, &selectedTextRange)

        let axRole = role(for: elementValues[0] as! String)
        let axValue = elementValues[1] as! String
        let axCaretLocation = selectedTextRange.location
        let axSelectedText = elementValues[3] as! String
        var currentLine: AccessibilityTextElementLine!

        if let line = lineFor(location: axCaretLocation, on: axFocusedElement) {
            currentLine = line
        } else {
            currentLine = AccessibilityTextElementLine(fullValue: axValue, number: nil, start: nil, end: nil)
        }

        return AccessibilityTextElement(
            role: axRole,
            value: axValue,
            caretLocation: axCaretLocation,
            selectedText: axSelectedText,
            currentLine: currentLine
        )
    }

    static func lineFor(location: Int, on axFocusedElement: AXUIElement? = AXEngine.axFocusedElement()) -> AccessibilityTextElementLine? {
        guard let axFocusedElement = axFocusedElement else { return nil }
        guard let axLineNumber = AXEngine.axLineNumberFor(location: location, on: axFocusedElement) else { return nil }

        return lineFor(lineNumber: axLineNumber, on: axFocusedElement)
    }
    
    static func lineFor(lineNumber: Int, on axFocusedElement: AXUIElement? = AXEngine.axFocusedElement()) -> AccessibilityTextElementLine? {
        guard let axFocusedElement = axFocusedElement else { return nil }

        var axValue = ""
        var start: Int?
        var end: Int?

        if let axLineRange = AXEngine.axLineRangeFor(lineNumber: lineNumber, on: axFocusedElement) {
            start = axLineRange.location
            end = start! + axLineRange.length
        }

        if let elementValue = AXEngine.axValue(of: axFocusedElement) {
            axValue = elementValue
        }

        return AccessibilityTextElementLine(
            fullValue: axValue,
            number: lineNumber,
            start: start,
            end: end
        )
    }

    private static func role(for role: String) -> AccessibilityTextElementRole {
        switch role {
        case "AXTextField":
            return .textField
        case "AXTextArea":
            return .textArea
        default:
            return .someOtherShit
        }
    }

    static func toAXFocusedElememt(from accessibilityElement: AccessibilityTextElement) -> Bool {
        guard let axFocusedElement = AXEngine.axFocusedElement() else { return false }
        
        var selectedTextRange = CFRange()
        selectedTextRange.location = accessibilityElement.caretLocation
        selectedTextRange.length = accessibilityElement.selectedLength

        let newValue = AXValueCreate(.cfRange, &selectedTextRange)

        guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextRangeAttribute as CFString, newValue!) == .success else { return false }
        
        if let selectedText = accessibilityElement.selectedText {
            guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextAttribute as CFString, selectedText as CFTypeRef) == .success else { return false }
        }
        
        return true
    }

}
