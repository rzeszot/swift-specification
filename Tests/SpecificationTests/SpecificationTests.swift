import XCTest

final class SpecificationTests: XCTestCase {
    func test_satisfied() {
        let sut = GreaterThan(value: 5)

        XCTAssertTrue(sut.satisfied(by: 10))
        XCTAssertTrue(sut.satisfied(by: 20))
    }

    func test_not_satisfied() {
        let sut = GreaterThan(value: 5)

        XCTAssertFalse(sut.satisfied(by: 1))
    }
}
