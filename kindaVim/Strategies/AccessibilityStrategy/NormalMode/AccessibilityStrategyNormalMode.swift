import AppKit
import Foundation


protocol AccessibilityStrategyNormalModeProtocol {

    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func B(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func C(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func cc(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func cf(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func cF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciBacktick(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciLeftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciLeftBracket(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciRightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciRightBracket(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciSingleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciw(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ct(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func cT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func df(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dj(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dt(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func E(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func f(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func F(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ge(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func gE(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func i(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func I(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func O(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func p(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func P(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func r(with replacement: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func t(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func T(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func w(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func W(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func x(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yf(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yiw(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yiDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yiLeftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yiLeftBracket(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yiLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yiRightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yiRightBracket(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yiRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yt(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yy(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    func caret(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func leftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func leftBracketLeftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func leftBracketLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func leftChevronLeftChevron(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func percent(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func rightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func rightBracketRightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func rightBracketRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func rightChevronRightChevron(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func underscore(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement?
}


struct AccessibilityStrategyNormalMode: AccessibilityStrategyNormalModeProtocol {    
    
    var textEngine: TextEngineProtocol = TextEngine()
    
    
    func ciInnerBrackets(using bracket: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        let value = element.value
                
        guard let innerBracketsRange = textEngine.innerBrackets(using: bracket, startingAt: element.caretLocation, in: value) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
       
        let leftBracketIndex = value.utf16.index(value.startIndex, offsetBy: innerBracketsRange.lowerBound)
        let characterAfterLeftBracketIndex = value.utf16.index(after: leftBracketIndex)
        
        if value[characterAfterLeftBracketIndex] == "\n" {
            newElement.caretLocation = innerBracketsRange.lowerBound + AccessibilityTextElement.bracketCharacterLength + AccessibilityTextElement.linefeedCharacterLength
            newElement.selectedLength = innerBracketsRange.count - AccessibilityTextElement.bracketCharacterLength - AccessibilityTextElement.linefeedCharacterLength
        } else {
            newElement.caretLocation = innerBracketsRange.lowerBound + AccessibilityTextElement.bracketCharacterLength
            newElement.selectedLength = innerBracketsRange.count - AccessibilityTextElement.bracketCharacterLength
        }
        
        let startOfLineWhereClosingBracketIs = (textEngine.findPrevious("\n", before: innerBracketsRange.upperBound , in: value) ?? 0) + AccessibilityTextElement.linefeedCharacterLength
        let startOfLineWhereClosingBracketIsIndex = value.utf16.index(value.startIndex, offsetBy: startOfLineWhereClosingBracketIs)
        let endOfLineWhereClosingBracketIs = textEngine.findNext("\n", after: innerBracketsRange.upperBound, in: TextEngineText(from: value)) ?? element.length
        let endOfLineWhereClosingBracketIsIndex = value.utf16.index(value.startIndex, offsetBy: endOfLineWhereClosingBracketIs)
        let lineValueOfLineWhereClosingBracketIs = value[startOfLineWhereClosingBracketIsIndex..<endOfLineWhereClosingBracketIsIndex]
       
        let firstNonBlankOfLineWhereClosingBracketIs = textEngine.firstNonBlank(in: String(lineValueOfLineWhereClosingBracketIs))
        
        if startOfLineWhereClosingBracketIs + firstNonBlankOfLineWhereClosingBracketIs == innerBracketsRange.upperBound {
            newElement.selectedLength -= (firstNonBlankOfLineWhereClosingBracketIs + AccessibilityTextElement.linefeedCharacterLength)
        }

        newElement.selectedText = ""
        
        return newElement
    }
    
    func ciInnerQuotedString(using quote: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        let lineStart = element.currentLine.start             
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let quotedStringRange = textEngine.innerQuotedString(using: quote, startingAt: lineCaretLocation, in: lineText) {
            newElement.caretLocation = lineStart + quotedStringRange.lowerBound
            newElement.selectedLength = quotedStringRange.count
            newElement.selectedText = ""
            
            return newElement
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement    
    }
    
    func shiftCurrentLine4SpacesToTheRight(on element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var newElement = element
        
        guard newElement.currentLine.isNotAnEmptyLine else {
            newElement.caretLocation = element.currentLine.start
            newElement.selectedLength = 1
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.caretLocation = element.currentLine.start
        newElement.selectedLength = 0
        newElement.selectedText = "    "
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    func shiftCurrentLine4SpacesToTheLeft(on element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var newElement = element
        
        let leadingNonBlanksCount = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: element.currentLine.value))
        
        newElement.caretLocation = element.currentLine.start
        newElement.selectedLength = leadingNonBlanksCount >= 4 ? 4 : leadingNonBlanksCount
        newElement.selectedText = ""
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        print("\ncaret position: \(String(describing: element?.caretLocation))")
        print("line start: \(String(describing: element?.currentLine.start))", "line end: \(String(describing: element?.currentLine.end))")
        
        return nil
    }
    
    func yiInnerBrackets(using bracket: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        let value = element.value
        
        guard let innerBracketsRange = textEngine.innerBrackets(using: bracket, startingAt: element.caretLocation, in: value) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        let startOfRangeIndex = value.utf16.index(value.startIndex, offsetBy: (innerBracketsRange.lowerBound + AccessibilityTextElement.bracketCharacterLength))
        let endOfRangeIndex = value.utf16.index(value.startIndex, offsetBy: innerBracketsRange.upperBound)
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(String(value[startOfRangeIndex..<endOfRangeIndex]), forType: .string)
        
        newElement.caretLocation = innerBracketsRange.lowerBound + AccessibilityTextElement.bracketCharacterLength
        newElement.selectedLength = newElement.characterLength
        newElement.selectedText = nil
        
        return newElement
    }

}
