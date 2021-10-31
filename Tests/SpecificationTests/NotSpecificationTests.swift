import XCTest
import Specification

final class NotSpecificationTests: XCTestCase {

  func test_init() {
    let sut = NotSpecification(GreaterThan(value: 5))

    XCTAssertTrue(sut.satisfied(by: 1))
    XCTAssertTrue(sut.satisfied(by: 5))
  }

  func test_satisfied() {
    let sut = GreaterThan(value: 5).not()

    XCTAssertTrue(sut.satisfied(by: 1))
    XCTAssertTrue(sut.satisfied(by: 5))
  }

  func test_not_satisfied() {
    let sut = GreaterThan(value: 5).not()

    XCTAssertFalse(sut.satisfied(by: 10))
  }

  // MARK: -

  func test_debug_description() {
    let sut = GreaterThan(value: 5).not()

    XCTAssertEqual(sut.debugDescription, "not(greater(5))")
  }

}
