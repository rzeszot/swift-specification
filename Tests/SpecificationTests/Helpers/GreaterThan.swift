import Specification

struct GreaterThan<T: Comparable>: Specification {
  let value: T

  func satisfied(by candidate: T) -> Bool {
    candidate > value
  }
}

extension GreaterThan: CustomDebugStringConvertible {
  var debugDescription: String {
    "greater(\(value))"
  }
}
