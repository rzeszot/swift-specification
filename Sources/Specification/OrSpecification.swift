public struct OrSpecification<T, L: Specification, R: Specification>: Specification where T == L.T, T == R.T {
  let lhs: L
  let rhs: R

  public func satisfied(by candidate: T) -> Bool {
    lhs.satisfied(by: candidate) || rhs.satisfied(by: candidate)
  }
}

extension Specification {
  public func or<B: Specification>(_ other: B) -> OrSpecification<T, Self, B> {
    OrSpecification(lhs: self, rhs: other)
  }
}
