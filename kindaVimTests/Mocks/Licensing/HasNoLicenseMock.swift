@testable import kindaVim
import Foundation


final class HasNoLicenseMock: LicensingProtocol {
    
    var today: Date!
    var isActivated = false
    var status: LicensingStatus = .noLicense
    var expiryDate: Date? = nil
    
    init(today: Date?) {
        self.today = today
    }
    
} 
