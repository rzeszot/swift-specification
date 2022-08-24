import Specification

struct Equal<T: Equatable>: Specification {
    let value: T

    func satisfied(by candidate: T) -> Bool {
        candidate == value
    }
}

extension Equal: Equatable where T: Equatable {}
extension Equal: Hashable where T: Hashable {}

extension Equal: CustomDebugStringConvertible {
    var debugDescription: String {
        "equal(\(value))"
    }
}
