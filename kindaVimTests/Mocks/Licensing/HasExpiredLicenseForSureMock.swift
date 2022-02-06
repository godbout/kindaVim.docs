@testable import kindaVim
import Foundation


final class HasExpiredLicenseForSureMock: LicensingProtocol {
    
    var today: Date!
    var isActivated = true
    var status: LicensingStatus = .expiredLicense
    var expiryDate: Date?
    
    init(today: Date?) {
        self.today = today
        self.expiryDate = today! - 2
    }
    
} 
