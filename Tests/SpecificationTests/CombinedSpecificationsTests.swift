import XCTest

final class CombinedSpecificationsTests: XCTestCase {
    func test_satisfied() {
        let sut = GreaterThan(value: 30).and(LessThan(value: 50)).and(Equal(value: 40).not()).or(Equal(value: 10))

        XCTAssertTrue(sut.satisfied(by: 31))
        XCTAssertTrue(sut.satisfied(by: 49))

        XCTAssertTrue(sut.satisfied(by: 39))
        XCTAssertTrue(sut.satisfied(by: 41))

        XCTAssertTrue(sut.satisfied(by: 10))
    }

    func test_not_satisfied() {
        let sut = GreaterThan(value: 30).and(LessThan(value: 50)).and(Equal(value: 40).not()).or(Equal(value: 10))

        XCTAssertFalse(sut.satisfied(by: 30))
        XCTAssertFalse(sut.satisfied(by: 50))

        XCTAssertFalse(sut.satisfied(by: 40))

        XCTAssertFalse(sut.satisfied(by: 9))
        XCTAssertFalse(sut.satisfied(by: 11))
    }

    // MARK: -

    func test_debug_description() {
        let sut = GreaterThan(value: 30).and(LessThan(value: 50)).and(Equal(value: 40).not()).or(Equal(value: 10))

        XCTAssertEqual(sut.debugDescription, "or(and(and(greater(30), less(50)), not(equal(40))), equal(10))")
    }
}
