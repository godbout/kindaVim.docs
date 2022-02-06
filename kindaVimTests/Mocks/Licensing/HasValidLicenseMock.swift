@testable import kindaVim
import Foundation


final class HasValidLicenseMock: LicensingProtocol {
    
    var today: Date!
    var isActivated = true
    var status: LicensingStatus = .validLicense
    var expiryDate: Date?
    
    init(today: Date?) {
        self.today = today
        self.expiryDate = today! + 2
    }
    
} 
