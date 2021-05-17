import Foundation

protocol AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityElement?) -> AccessibilityElement?
    func l(on element: AccessibilityElement?) -> AccessibilityElement?

}

struct AccessibilityStrategy: AccessibilityStrategyProtocol {

    func h(on element: AccessibilityElement?) -> AccessibilityElement? {
        guard var element = element else { return nil }

        if element.caretLocation > element.lineStart {
            element.caretLocation -= 1
        }
        
        return element
    }
    
    func l(on element: AccessibilityElement?) -> AccessibilityElement? {
        guard var element = element else { return nil }

        // TODO
        // this will need to be refactored.
        // TextEngine... engine?
        let lineStart = element.internalText.index(element.internalText.startIndex, offsetBy: element.lineStart)
        let lineEnd = element.internalText.index(lineStart, offsetBy: element.lineEnd - element.lineStart)
        
        let limit = element.internalText[lineStart..<lineEnd].hasSuffix("\n") ? element.lineEnd - 2 : element.lineEnd - 1

        if element.caretLocation < limit {
            element.caretLocation += 1
        }

        return element
    }

    static func focusedElement() -> AccessibilityElement? {
        return AccessibilityElementAdaptor.fromAXFocusedElement()
    }
    
    static func write(element: AccessibilityElement) -> Bool {
        print("move using Accessibility Stragety")

        return AccessibilityElementAdaptor.toAXFocusedElememt(from: element)
    }
    
}
