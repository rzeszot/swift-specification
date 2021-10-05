import XCTest

final class NotSpecificationTests: XCTestCase {
  let sut = GreaterThan(value: 5).not()

  func test_satisfied() {
    XCTAssertTrue(sut.satisfied(by: 1))
    XCTAssertTrue(sut.satisfied(by: 5))
  }

  func test_not_satisfied() {
    XCTAssertFalse(sut.satisfied(by: 10))
  }
}
