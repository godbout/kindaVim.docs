import XCTest
@testable import kindaVim


class HasActivatedSubscriptionTests: LicensingBaseTests {
    
    func test_that_a_user_with_a_subscription_can_use_kV_before_the_sleeping_time() {
        let licensing = HasActivatedSubscriptionMock(currentDate: dateFormatter.date(from: String(Licensing.sleepingTime - 1)))
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_subscription_can_use_kV_at_the_sleeping_time() {
        let licensing = HasActivatedSubscriptionMock(currentDate: dateFormatter.date(from: String(Licensing.sleepingTime)))
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_subscription_can_use_kV_after_the_waking_time() {
        let licensing = HasActivatedSubscriptionMock(currentDate: dateFormatter.date(from: String(Licensing.wakingTime + 1)))
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_subscription_can_use_kV_at_the_waking_time() {
        let licensing = HasActivatedSubscriptionMock(currentDate: dateFormatter.date(from: String(Licensing.wakingTime)))
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_subscription_can_use_kV_between_the_waking_time_and_the_sleeping_time() {
        var licensing = HasActivatedSubscriptionMock(currentDate: dateFormatter.date(from: String(Licensing.sleepingTime + 1)))              
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
        
        licensing = HasActivatedSubscriptionMock(currentDate: dateFormatter.date(from: String(Licensing.sleepingTime + 4)))        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
        
        licensing = HasActivatedSubscriptionMock(currentDate: dateFormatter.date(from: String(Licensing.wakingTime - 4)))     
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
        
        licensing = HasActivatedSubscriptionMock(currentDate: dateFormatter.date(from: String(Licensing.wakingTime - 1)))        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
}
