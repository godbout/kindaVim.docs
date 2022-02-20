import XCTest
@testable import kindaVim


class HasNoLicenseTests: LicensingBaseTests {
    
    func test_that_a_user_without_a_license_can_use_kV_before_the_sleeping_time() {
        guard let now = dateFormatter.date(from: String(Licensing.sleepingTime - 1)) else { return XCTFail() }
        let licensing = HasNoLicenseMock(now: now)
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_without_a_license_cannot_use_kV_at_the_sleeping_time() {
        guard let now = dateFormatter.date(from: String(Licensing.sleepingTime)) else { return XCTFail() }
        let licensing = HasNoLicenseMock(now: now)
        
        XCTAssertFalse(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_without_a_license_can_use_kV_after_the_waking_time() {
        guard let now = dateFormatter.date(from: String(Licensing.wakingTime + 5)) else { return XCTFail() }
        let licensing = HasNoLicenseMock(now: now)
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_without_a_license_can_use_kV_at_the_waking_time() {
        guard let now = dateFormatter.date(from: String(Licensing.wakingTime)) else { return XCTFail() }
        let licensing = HasNoLicenseMock(now: now)
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_without_a_license_cannot_use_kV_between_the_sleeping_time_and_the_waking_time() {
        guard let now = dateFormatter.date(from: String(Licensing.sleepingTime + 1)) else { return XCTFail() }
        var licensing = HasNoLicenseMock(now: now)
        XCTAssertFalse(licensing.userHasEarnedRightsToAbuse)
        
        guard let now = dateFormatter.date(from: String(Licensing.sleepingTime + 5)) else { return XCTFail() }
        licensing = HasNoLicenseMock(now: now)
        XCTAssertFalse(licensing.userHasEarnedRightsToAbuse)
        
        guard let now = dateFormatter.date(from: String(Licensing.wakingTime - 5)) else { return XCTFail() }
        licensing = HasNoLicenseMock(now: now)
        XCTAssertFalse(licensing.userHasEarnedRightsToAbuse)
        
        guard let now = dateFormatter.date(from: String(Licensing.wakingTime - 1)) else { return XCTFail() }
        licensing = HasNoLicenseMock(now: now)
        XCTAssertFalse(licensing.userHasEarnedRightsToAbuse)
    }
    
}
