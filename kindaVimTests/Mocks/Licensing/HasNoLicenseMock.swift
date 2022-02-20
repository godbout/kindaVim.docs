@testable import kindaVim
import Foundation


final class HasNoLicenseMock: LicensingProtocol {
    
    var now: Date
    var isActivated = false
    var status: LicensingStatus = .noLicense
    var expiryDate: Date? = nil
    
    init(now: Date) {
        self.now = now
    }
    
} 
