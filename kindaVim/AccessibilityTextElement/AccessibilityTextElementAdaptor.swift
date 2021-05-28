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
        var accessibilityElement: AccessibilityTextElement?

        if let axFocusedElement = AXEngine.axFocusedElement() {
            var values: CFArray?
            let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXRoleAttribute, kAXValueAttribute, kAXSelectedTextRangeAttribute] as CFArray, .stopOnError, &values)

            if error == .success, let values = values as NSArray? {
                var selectedTextRange = CFRange()
                AXValueGetValue(values[2] as! AXValue, .cfRange, &selectedTextRange)

                let axRole = role(for: values[0] as! String)
                let axValue = values[1] as! String
                let axCaretLocation = selectedTextRange.location
                var currentLine: AccessibilityTextElementLine!

                if let axLineNumber = AXEngine.axLineNumberFor(location: axCaretLocation, on: axFocusedElement), let line = lineFor(lineNumber: axLineNumber, on: axFocusedElement) {
                    currentLine = line
                } else {
                    currentLine = AccessibilityTextElementLine(axValue: axValue, number: nil, start: nil, end: nil)
                }

                accessibilityElement = AccessibilityTextElement(
                    axRole: axRole,
                    axValue: axValue,
                    axCaretLocation: axCaretLocation,
                    currentLine: currentLine
                )
            }
        }

        return accessibilityElement
    }
    
    static func lineFor(lineNumber: Int, on axFocusedElement: AXUIElement? = AXEngine.axFocusedElement()) -> AccessibilityTextElementLine? {
        if let axFocusedElement = axFocusedElement {
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
                axValue: axValue,
                number: lineNumber,
                start: start,
                end: end
            )
        }

        return nil
    }

    static func lineFor(location: Int, on axFocusedElement: AXUIElement? = AXEngine.axFocusedElement()) -> AccessibilityTextElementLine? {
        if let axLineNumber = AXEngine.axLineNumberFor(location: location, on: axFocusedElement), let line = lineFor(lineNumber: axLineNumber, on: axFocusedElement) {
            return line
        } else {
            let axValue = AXEngine.axValue(of: axFocusedElement) ?? ""

            return AccessibilityTextElementLine(axValue: axValue, number: nil, start: nil, end: nil)
        }
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
        selectedTextRange.location = accessibilityElement.axCaretLocation
        selectedTextRange.length = accessibilityElement.axSelectedLength

        let newValue = AXValueCreate(.cfRange, &selectedTextRange)

        guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextRangeAttribute as CFString, newValue!) == .success else { return false }
        
        return true
    }

}
