import Foundation

struct AccessibilityElementAdaptor {
    
    // TO THINK:
    // tried to keep a static variable to the last axFocusedElement
    // to avoid querying for it again when we write to it.
    // it makes sense while using the app because we will always
    // write to the field we currently are in. but it makes testing
    // harder to understand, as you need to reset the static variable in between.
    // not sure how to handle this yet. without a static variable, we have to requery,
    // which seems actually very fast. so maybe it's safer this way.

    static func fromAXFocusedElement() -> AccessibilityElement? {
        var accessibilityElement: AccessibilityElement?

        if let axFocusedElement = axFocusedElement() {
            var values: CFArray?
            let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXValueAttribute, kAXSelectedTextRangeAttribute, kAXNumberOfCharactersAttribute] as CFArray, .stopOnError, &values)

            if error == .success, let values = values as NSArray? {
                let text = values[0] as! String
                let numberOfCharacters = values[2] as! Int
                var lineStart = 0

                var selectedTextRange = CFRange()
                AXValueGetValue(values[1] as! AXValue, .cfRange, &selectedTextRange)

                lineStart = self.lineStart(for: axFocusedElement, at: selectedTextRange.location, having: numberOfCharacters)

                print(selectedTextRange.location)

                accessibilityElement = AccessibilityElement(
                    internalText: text,
                    caretLocation: selectedTextRange.location,
                    lineStart: lineStart
                )
            }
        }

        return accessibilityElement
    }

    private static func lineStart(for element: AXUIElement, at location: Int, having numberOfCharacters: Int) -> Int {
        var lineStart = 0
        var axLineNumber: AnyObject?

        switch numberOfCharacters {
        case 0:
            lineStart = 0
        case location:
            AXUIElementCopyParameterizedAttributeValue(element, kAXLineForIndexParameterizedAttribute as CFString, location - 1 as CFTypeRef, &axLineNumber)

            var lineRangeValue: AnyObject?
            AXUIElementCopyParameterizedAttributeValue(element, kAXRangeForLineParameterizedAttribute as CFString, axLineNumber as CFTypeRef, &lineRangeValue)

            var lineRange = CFRange()
            AXValueGetValue(lineRangeValue as! AXValue, .cfRange, &lineRange)

            lineStart = lineRange.location
        default:
            AXUIElementCopyParameterizedAttributeValue(element, kAXLineForIndexParameterizedAttribute as CFString, location as CFTypeRef, &axLineNumber)

            var lineRangeValue: AnyObject?
            AXUIElementCopyParameterizedAttributeValue(element, kAXRangeForLineParameterizedAttribute as CFString, axLineNumber as CFTypeRef, &lineRangeValue)

            var lineRange = CFRange()
            AXValueGetValue(lineRangeValue as! AXValue, .cfRange, &lineRange)

            lineStart = lineRange.location
        }

        return lineStart
    }

    private static func axFocusedElement() -> AXUIElement? {
        let axSystemWideElement = AXUIElementCreateSystemWide()

        var axFocusedElement: AnyObject?
        guard AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success else { return nil }

        return axFocusedElement as! AXUIElement?
    }

    static func toAXFocusedElememt(from accessibilityElement: AccessibilityElement) -> Bool {
        guard let axFocusedElement = axFocusedElement() else { return false }
        
        var selectedTextRange = CFRange()
        selectedTextRange.location = accessibilityElement.caretLocation

        if caretIsNotAtTheEndOfText(caretLocation: selectedTextRange.location, text: accessibilityElement.internalText) {
            selectedTextRange.length = 1
        }

        let newValue = AXValueCreate(.cfRange, &selectedTextRange)

        guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextRangeAttribute as CFString, newValue!) == .success else { return false }
        
        return true
    }

    private static func caretIsNotAtTheEndOfText(caretLocation: Int, text: String) -> Bool {
        return text.count != caretLocation
    }
}
