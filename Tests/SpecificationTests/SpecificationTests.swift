import XCTest

final class SpecificationTests: XCTestCase {
  let sut = GreaterThan(value: 5)

  func test_satisfied() {
    XCTAssertTrue(sut.satisfied(by: 10))
    XCTAssertTrue(sut.satisfied(by: 20))
  }

  func test_not_satisfied() {
    XCTAssertFalse(sut.satisfied(by: 1))
  }
}
