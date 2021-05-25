import Foundation

protocol AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    static func dump(element: AccessibilityTextElement?)
}

enum BlockCursorStatus {
    case on
    case off
}

struct AccessibilityStrategy: AccessibilityStrategyProtocol {

    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if element.isNotEmpty(), element.caretIsAtTheEnd(), element.lastCharacterIsNotLinefeed() {
            element.axCaretLocation -= 1

            return element
        }

        if element.isNotEmpty(), element.caretIsNotAtTheEnd(), element.axCaretLocation > element.startOfLineLimit() {
            element.axCaretLocation -= 1
        }

        return element
    }
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if element.caretIsNotAtTheEnd(), element.axCaretLocation < element.endOfLineLimit() {
            element.axCaretLocation += 1
        }

        return element
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if element.caretIsNotAtTheEnd() {
            element.axCaretLocation = element.endOfLineLimit()
        }

        return element
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if element.caretIsNotAtTheEnd() {
            element.axCaretLocation = element.startOfLineLimit()
        }

        return element
    }

    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        switch status {
        case .on:
            element = h(on: element)!
            element.axSelectedLength = 0
        case .off:
            element.axSelectedLength = 0
        }

        return element
    }
    
    static func dump(element: AccessibilityTextElement?) {
        print("\ncaret position: \(String(describing: element?.axCaretLocation))")
        print("line start: \(String(describing: element?.axLineStart))", "line end: \(String(describing: element?.axLineEnd))")
    }

    static func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    static func push(element: AccessibilityTextElement) -> Bool {
        print("move using Accessibility Stragety")

        return AccessibilityTextElementAdaptor.toAXFocusedElememt(from: element)
    }
    
}
