public struct AnySpecification<T>: Specification {
  let satisfier: (T) -> Bool

  init<U: Specification>(_ specification: U) where T == U.T {
    self.satisfier = specification.satisfied(by:)
  }

  init(_ satisfier: @escaping (T) -> Bool) {
    self.satisfier = satisfier
  }

  public func satisfied(by candidate: T) -> Bool {
    satisfier(candidate)
  }
}

extension Specification {
  public func erasured() -> AnySpecification<T> {
    AnySpecification(self)
  }
}
