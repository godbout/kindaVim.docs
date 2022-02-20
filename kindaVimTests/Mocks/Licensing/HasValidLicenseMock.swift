@testable import kindaVim
import Foundation


final class HasValidLicenseMock: LicensingProtocol {
    
    var now: Date
    var isActivated = true
    var status: LicensingStatus = .validLicense
    var expiryDate: Date?
    
    init(now: Date) {
        self.now = now
        self.expiryDate = Calendar.current.date(byAdding: .day, value: 2, to: now)
    }
    
} 
