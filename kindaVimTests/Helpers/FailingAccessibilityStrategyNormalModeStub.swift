@testable import kindaVim
import Foundation
import AccessibilityStrategy


struct FailingAccessibilityStrategyNormalModeStub: AccessibilityStrategyNormalModeProtocol {
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func b(times count: Int? = 1, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func B(times count: Int? = 1, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func C(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func caW(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func caw(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func cB(times count: Int? = 1, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func cb(times count: Int? = 1, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func cc(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func cE(times count: Int? = 1, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func ce(times count: Int? = 1, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func cF(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func cf(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func cG(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func cgg(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciW(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciw(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciB(on element: AccessibilityTextElement?, pgR: Bool, _ bipped: inout Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func cib(on element: AccessibilityTextElement?, pgR: Bool, _ bipped: inout Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciBacktick(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciDoubleQuote(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciLeftBrace(on element: AccessibilityTextElement?, pgR: Bool, _ bipped: inout Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciLeftBracket(on element: AccessibilityTextElement?, pgR: Bool, _ bipped: inout Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciLeftParenthesis(on element: AccessibilityTextElement?, pgR: Bool, _ bipped: inout Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciRightBrace(on element: AccessibilityTextElement?, pgR: Bool, _ bipped: inout Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciRightBracket(on element: AccessibilityTextElement?, pgR: Bool, _ bipped: inout Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciRightParenthesis(on element: AccessibilityTextElement?, pgR: Bool, _ bipped: inout Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciSingleQuote(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func cT(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func ct(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func cW(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func cw(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func D(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func daW(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func daw(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func dB(times count: Int? = 1, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func db(times count: Int? = 1, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func dd(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func dE(times count: Int? = 1, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func de(times count: Int? = 1, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func dF(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func df(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func dG(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func dgg(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func dh(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func diW(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func diw(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func dj(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func dk(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func dl(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func dT(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func dt(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func dW(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func dw(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func E(times count: Int? = 1, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func e(times count: Int? = 1, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func f(times count: Int? = 1, to: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func F(times count: Int? = 1, to: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gCaret(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
       
    func gDollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
       
    func gI(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
       
    func gUnderscore(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gZero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ge(times count: Int? = 1, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gg(times count: Int? = nil, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gE(times count: Int? = 1, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gj(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gk(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func G(times count: Int? = nil, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func i(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func I(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func J(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func l(times count: Int? = 1, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func O(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil        
    }
    
    func o(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil        
    }
    
    func PForLastYankStyleCharacterwise(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil        
    }
    
    func PForLastYankStyleLinewise(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil        
    }
    
    func pForLastYankStyleCharacterwise(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil        
    }
    
    func pForLastYankStyleLinewise(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil        
    }
    
    func r(times count: Int? = 1, with replacement: Character, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil        
    }
    
    func controlR(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func T(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func t(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func tilde(times count: Int? = 1, on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func u(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func v(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func w(times count: Int? = 1, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func W(times count: Int? = 1, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func X(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func x(on element: AccessibilityTextElement?, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func yF(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
        
    func yf(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiBacktick(on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiDoubleQuote(on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
        
    func yiSingleQuote(on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiLeftBrace(on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiLeftBracket(on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiLeftParenthesis(on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
        
    func yiRightBrace(on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiRightBracket(on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiRightParenthesis(on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiw(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func yT(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func yt(times count: Int? = 1, to character: Character, on element: AccessibilityTextElement?, _ vimEnginState: inout VimEngineState) -> AccessibilityTextElement? {
        return nil
    }
    
    func yy(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func caret(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func leftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func leftBracketLeftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func leftBracketLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func leftChevronLeftChevron(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func percent(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func rightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func rightBracketRightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func rightBracketRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func rightChevronRightChevron(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        return nil
    }
    
    func underscore(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
}
