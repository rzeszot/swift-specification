import Specification

struct LessThan<T: Comparable>: Specification {
    let value: T

    func satisfied(by candidate: T) -> Bool {
        candidate < value
    }
}

extension LessThan: CustomDebugStringConvertible {
    var debugDescription: String {
        "less(\(value))"
    }
}
