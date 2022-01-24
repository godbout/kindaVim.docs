@testable import kindaVim
import Foundation


final class HasNotActivatedSubscriptionMock: LicensingProtocol {
    
    var currentDate: Date!
    var isActivated = false
    
    init(currentDate: Date?) {
        self.currentDate = currentDate
    }
    
} 
