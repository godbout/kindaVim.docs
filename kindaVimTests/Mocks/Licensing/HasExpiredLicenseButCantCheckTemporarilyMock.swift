@testable import kindaVim
import Foundation


final class HasExpiredLicenseButCantCheckTemporarilyMock: LicensingProtocol {
    
    var today: Date!
    var isActivated = true
    var status: LicensingStatus = .cantCheck
    var expiryDate: Date?
    
    init(today: Date?) {
        self.today = today
        self.expiryDate = today! - 2
    }
    
} 
