import XCTest
@testable import kindaVim


class HasValidLicenseTests: LicensingBaseTests {

    func test_that_a_user_with_a_valid_license_can_use_kV_before_the_sleeping_time() {
        guard let now = dateFormatter.date(from: String(Licensing.sleepingTime - 1)) else { return XCTFail() }
        let licensing = HasValidLicenseMock(now: now)
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_valid_license_can_use_kV_at_the_sleeping_time() {
        guard let now = dateFormatter.date(from: String(Licensing.sleepingTime)) else { return XCTFail() }
        let licensing = HasValidLicenseMock(now: now)
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_valid_license_can_use_kV_after_the_waking_time() {
        guard let now = dateFormatter.date(from: String(Licensing.wakingTime + 1)) else { return XCTFail() }
        let licensing = HasValidLicenseMock(now: now)
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_valid_license_can_use_kV_at_the_waking_time() {
        guard let now = dateFormatter.date(from: String(Licensing.wakingTime)) else { return XCTFail() }
        let licensing = HasValidLicenseMock(now: now)
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_valid_license_can_use_kV_between_the_waking_time_and_the_sleeping_time() {
        guard let now = dateFormatter.date(from: String(Licensing.sleepingTime + 1)) else { return XCTFail() }
        var licensing = HasValidLicenseMock(now: now)
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
        
        guard let now = dateFormatter.date(from: String(Licensing.sleepingTime + 4)) else { return XCTFail() }
        licensing = HasValidLicenseMock(now: now)
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
        
        guard let now = dateFormatter.date(from: String(Licensing.wakingTime - 4)) else { return XCTFail() }
        licensing = HasValidLicenseMock(now: now)
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
        
        guard let now = dateFormatter.date(from: String(Licensing.wakingTime - 1)) else { return XCTFail() }
        licensing = HasValidLicenseMock(now: now)
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
}
