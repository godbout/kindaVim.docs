import SwiftUI
import AXEngine


struct AXEngineTextElementMock: AXEngineProtocol {

    func axRole(of axFocusedElement: AXUIElement?) -> AXElementRole? {
        return .webArea
    }
    
}
