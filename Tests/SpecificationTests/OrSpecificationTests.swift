import XCTest

final class OrSpecificationTests: XCTestCase {
  let sut = GreaterThan(value: 20).or(LessThan(value: 10))

  func test_satisfied() {
    XCTAssertTrue(sut.satisfied(by: 1))
    XCTAssertTrue(sut.satisfied(by: 30))
  }

  func test_not_satisfied() {
    XCTAssertFalse(sut.satisfied(by: 15))
  }
}
