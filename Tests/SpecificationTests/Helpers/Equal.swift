import Specification

struct Equal<T: Equatable>: Specification {
  let value: T

  func satisfied(by candidate: T) -> Bool {
    candidate == value
  }
}
