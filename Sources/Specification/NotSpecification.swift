public struct NotSpecification<T, S: Specification>: Specification where S.T == T {
  let spec: S

  public func satisfied(by candidate: T) -> Bool {
    !spec.satisfied(by: candidate)
  }
}

extension Specification {
  public func not() -> NotSpecification<T, Self> {
    NotSpecification(spec: self)
  }
}
