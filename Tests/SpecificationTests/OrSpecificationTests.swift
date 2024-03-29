import Specification
import XCTest

final class OrSpecificationTests: XCTestCase {
    func test_init() {
        let sut = OrSpecification(GreaterThan(value: 20), LessThan(value: 10))

        XCTAssertTrue(sut.satisfied(by: 1))
    }

    func test_satisfied() {
        let sut = GreaterThan(value: 20).or(LessThan(value: 10))

        XCTAssertTrue(sut.satisfied(by: 1))
        XCTAssertTrue(sut.satisfied(by: 30))
    }

    func test_not_satisfied() {
        let sut = GreaterThan(value: 20).or(LessThan(value: 10))

        XCTAssertFalse(sut.satisfied(by: 15))
    }

    // MARK: -

    func test_debug_description() {
        let sut = GreaterThan(value: 20).or(LessThan(value: 10))

        XCTAssertEqual(sut.debugDescription, "or(greater(20), less(10))")
    }
}
