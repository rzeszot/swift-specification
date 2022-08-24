import Specification

struct GreaterThan<T: Comparable>: Specification {
    let value: T

    func satisfied(by candidate: T) -> Bool {
        candidate > value
    }
}

extension GreaterThan: Equatable where T: Equatable {}
extension GreaterThan: Hashable where T: Hashable {}

extension GreaterThan: CustomDebugStringConvertible {
    var debugDescription: String {
        "greater(\(value))"
    }
}
