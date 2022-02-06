@testable import kindaVim
import Foundation


final class HasSubscriptionMock: LicensingProtocol {

    var today: Date!
    var isActivated = true    
    
    init(today: Date?) {
        self.today = today
    }

} 
