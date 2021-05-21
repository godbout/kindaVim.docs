import Foundation

struct AXEngine {

    static func axFocusedElement() -> AXUIElement? {
        let axSystemWideElement = AXUIElementCreateSystemWide()

        var axFocusedElement: AnyObject?
        guard AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success else { return nil }

        return axFocusedElement as! AXUIElement?
    }

    static func axLineNumberFor(location: Int) -> Int? {
        if let axFocusedElement = AXEngine.axFocusedElement() {
            var currentLine: AnyObject?
            var error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXLineForIndexParameterizedAttribute as CFString, location as CFTypeRef, &currentLine)

            if error == .success {
                return (currentLine as! Int)
            } else {
                error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXLineForIndexParameterizedAttribute as CFString, location - 1 as CFTypeRef, &currentLine)

                if error == .success {
                    return (currentLine as! Int)
                }
            }
        }

        return nil
    }

    static func axLineRangeFor(lineNumber: Int) -> CFRange? {
        if let axFocusedElement = AXEngine.axFocusedElement() {
            var lineRangeValue: AnyObject?
            let error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXRangeForLineParameterizedAttribute as CFString, lineNumber as CFTypeRef, &lineRangeValue)

            if error == .success {
                var lineRange = CFRange()
                AXValueGetValue(lineRangeValue as! AXValue, .cfRange, &lineRange)

                return lineRange
            }
        }

        return nil
    }

}
