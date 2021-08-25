@testable import kindaVim
import Foundation


class AccessibilityStrategyVisualModeMock: AccessibilityStrategyVisualModeProtocol {
    
    var functionCalled = ""
    
    
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }       
    
    func c(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }     
    
    func d(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }    

    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }      
    
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }      
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }   
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }  
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }  
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }    
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }  
    
    func v(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func y(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func escape(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
}
