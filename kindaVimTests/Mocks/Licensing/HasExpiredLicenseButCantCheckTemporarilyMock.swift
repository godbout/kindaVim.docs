@testable import kindaVim
import Foundation


final class HasExpiredLicenseButCantCheckTemporarilyMock: LicensingProtocol {
    
    var now: Date
    var isActivated = true
    var status: LicensingStatus = .cantCheck
    var expiryDate: Date?
    
    init(now: Date) {
        self.now = now
        self.expiryDate = Calendar.current.date(byAdding: .day, value: -2, to: now)
    }
    
} 
