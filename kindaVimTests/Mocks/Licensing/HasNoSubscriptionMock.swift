@testable import kindaVim
import Foundation


final class HasNoSubscriptionMock: LicensingProtocol {
    
    var today: Date!
    var isActivated = false
    
    init(today: Date?) {
        self.today = today
    }
    
} 
