public struct NotSpecification<T, S: Specification>: Specification where S.T == T {
  let specification: S

  public init(_ specification: S) {
    self.specification = specification
  }

  // MARK: - Specification

  public func satisfied(by candidate: T) -> Bool {
    !specification.satisfied(by: candidate)
  }

}

extension Specification {

  public func not() -> NotSpecification<T, Self> {
    NotSpecification(self)
  }

}
