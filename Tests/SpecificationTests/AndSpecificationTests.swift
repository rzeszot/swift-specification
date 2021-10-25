import XCTest
import Specification

final class AndSpecificationTests: XCTestCase {

  func test_init() {
    let sut = AndSpecification(GreaterThan(value: 10), LessThan(value: 20))

    XCTAssertTrue(sut.satisfied(by: 15))
  }

  func test_satisfied() {
    let sut = GreaterThan(value: 10).and(LessThan(value: 20))

    XCTAssertTrue(sut.satisfied(by: 11))
    XCTAssertTrue(sut.satisfied(by: 19))
  }

  func test_not_satisfied() {
    let sut = GreaterThan(value: 10).and(LessThan(value: 20))

    XCTAssertFalse(sut.satisfied(by: 1))
    XCTAssertFalse(sut.satisfied(by: 10))
    XCTAssertFalse(sut.satisfied(by: 30))
  }

}
