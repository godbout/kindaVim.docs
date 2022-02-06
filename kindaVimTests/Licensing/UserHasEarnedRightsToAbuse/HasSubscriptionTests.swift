import XCTest
@testable import kindaVim


class HasSubscriptionTests: LicensingBaseTests {}


// waking/sleeping time
extension HasSubscriptionTests {
    
    func test_that_a_user_with_a_subscription_can_use_kV_before_the_sleeping_time() {
        let licensing = HasSubscriptionMock(today: dateFormatter.date(from: String(Licensing.sleepingTime - 1)))
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_subscription_can_use_kV_at_the_sleeping_time() {
        let licensing = HasSubscriptionMock(today: dateFormatter.date(from: String(Licensing.sleepingTime)))
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_subscription_can_use_kV_after_the_waking_time() {
        let licensing = HasSubscriptionMock(today: dateFormatter.date(from: String(Licensing.wakingTime + 1)))
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_subscription_can_use_kV_at_the_waking_time() {
        let licensing = HasSubscriptionMock(today: dateFormatter.date(from: String(Licensing.wakingTime)))
        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
    func test_that_a_user_with_a_subscription_can_use_kV_between_the_waking_time_and_the_sleeping_time() {
        var licensing = HasSubscriptionMock(today: dateFormatter.date(from: String(Licensing.sleepingTime + 1)))              
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
        
        licensing = HasSubscriptionMock(today: dateFormatter.date(from: String(Licensing.sleepingTime + 4)))        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
        
        licensing = HasSubscriptionMock(today: dateFormatter.date(from: String(Licensing.wakingTime - 4)))     
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
        
        licensing = HasSubscriptionMock(today: dateFormatter.date(from: String(Licensing.wakingTime - 1)))        
        XCTAssertTrue(licensing.userHasEarnedRightsToAbuse)
    }
    
}


// 
extension HasSubscriptionTests {
    
}
