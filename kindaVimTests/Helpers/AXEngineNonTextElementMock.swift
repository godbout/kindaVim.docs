import Foundation
import AXEngine


struct AXEngineNonTextElementMock: AXEngineProtocol {

    func axRole(of axFocusedElement: AXUIElement?) -> AXElementRole? {
        return .someOtherShit
    }
    
}
