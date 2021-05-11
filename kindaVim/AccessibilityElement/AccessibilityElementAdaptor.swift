import Foundation

struct AccessibilityElementAdaptor {

    func toAccessibilityElement(from axUIElement: AXUIElement) -> AccessibilityElement? {
        return nil
    }

    func toAXUIElememt(from accessibilityElement: AccessibilityElement) -> Bool {
        return false
    }

}
