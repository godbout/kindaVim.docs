@testable import kindaVim
import Foundation
import AccessibilityStrategy
import VimEngineState


class AccessibilityStrategyVisualModeMock: AccessibilityStrategyVisualModeProtocol {
    
    var functionCalled = ""
    
    
    func B(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func b(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func C(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func c(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func caret(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func D(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }    
    
    func d(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dollarSign(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func E(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func e(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func escape(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func F(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func f(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gCaret(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gDollarSign(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gg(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gI(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gj(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gk(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gZero(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func G(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gE(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ge(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func h(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func iW(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func iw(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func j(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func k(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func l(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func o(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func R(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func S(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func T(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func t(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func tilde(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func underscore(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func VFromNormalMode(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func VFromVisualMode(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func vFromNormalMode(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func vFromVisualMode(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func w(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func W(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }

    func X(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func x(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func Y(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func y(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func zero(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }   
    
}
