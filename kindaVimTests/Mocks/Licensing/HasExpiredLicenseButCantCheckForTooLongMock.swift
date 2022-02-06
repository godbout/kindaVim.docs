@testable import kindaVim
import Foundation


final class HasExpiredLicenseButCantCheckForTooLongMock: LicensingProtocol {
    
    var today: Date!
    var isActivated = true
    var status: LicensingStatus = .tooLongCantCheck
    var expiryDate: Date?
    
    init(today: Date?) {
        self.today = today
        self.expiryDate = today! - 15
    }
    
} 
