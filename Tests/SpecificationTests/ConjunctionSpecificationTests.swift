import Specification
import XCTest

final class ConjunctionSpecificationTests: XCTestCase {
    func test_conjunction() {
        let sut = ConjunctionSpecification([
            GreaterThan(value: 10).erasured(),
            GreaterThan(value: 15).erasured(),
            LessThan(value: 20).erasured(),
        ])

        XCTAssertTrue(sut.satisfied(by: 18))
        XCTAssertFalse(sut.satisfied(by: 12))
    }

    // MARK: -

    func test_debug_description() {
        let sut = ConjunctionSpecification([
            GreaterThan(value: 10).erasured(),
            GreaterThan(value: 15).erasured(),
            LessThan(value: 20).erasured(),
        ])

        XCTAssertEqual(sut.debugDescription, "conjunction(greater(10), greater(15), less(20))")
    }
}
