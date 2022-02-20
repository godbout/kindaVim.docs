@testable import kindaVim
import Foundation


final class HasExpiredLicenseButCantCheckForTooLongMock: LicensingProtocol {
    
    var now: Date
    var isActivated = true
    var status: LicensingStatus = .tooLongCantCheck
    var expiryDate: Date?
    
    init(now: Date) {
        self.now = now
        self.expiryDate = Calendar.current.date(byAdding: .day, value: -15, to: now)
    }
    
} 
