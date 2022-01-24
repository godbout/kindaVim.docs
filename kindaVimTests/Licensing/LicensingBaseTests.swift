import XCTest
@testable import kindaVim


class LicensingBaseTests: XCTestCase {
    
    let dateFormatter = DateFormatter()
    
    override func setUp() {
        dateFormatter.dateFormat = "HH"
    }
    
}
