import Specification

struct LessThan<T: Comparable>: Specification {
    let value: T

    func satisfied(by candidate: T) -> Bool {
        candidate < value
    }
}

extension LessThan: Equatable where T: Equatable {}
extension LessThan: Hashable where T: Hashable {}

extension LessThan: CustomDebugStringConvertible {
    var debugDescription: String {
        "less(\(value))"
    }
}
