import XCTest

final class AndSpecificationTests: XCTestCase {
  let sut = GreaterThan(value: 10).and(LessThan(value: 20))

  func test_satisfied() {
    XCTAssertTrue(sut.satisfied(by: 11))
    XCTAssertTrue(sut.satisfied(by: 19))
  }

  func test_not_satisfied() {
    XCTAssertFalse(sut.satisfied(by: 1))
    XCTAssertFalse(sut.satisfied(by: 10))
    XCTAssertFalse(sut.satisfied(by: 30))
  }
}
