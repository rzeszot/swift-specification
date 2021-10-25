import XCTest
import Specification

final class DisjunctionSpecificationTests: XCTestCase {

  func test_disjunction() {
    let sut = DisjunctionSpecification([
      GreaterThan(value: 10).erasured(),
      GreaterThan(value: 15).erasured(),
      LessThan(value: 20).erasured()
    ])

    XCTAssertTrue(sut.satisfied(by: 25))
  }

}
