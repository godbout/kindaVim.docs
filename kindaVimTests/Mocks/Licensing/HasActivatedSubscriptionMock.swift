@testable import kindaVim
import Foundation


final class HasActivatedSubscriptionMock: LicensingProtocol {

    var currentDate: Date!
    var isActivated = true    
    
    init(currentDate: Date?) {
        self.currentDate = currentDate
    }

} 
