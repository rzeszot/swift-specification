// swiftlint:disable identifier_name

public struct AnySpecification<T>: Specification {
  let satisfier: (T) -> Bool
  let _debugDescription: String?

  init<U: Specification>(_ specification: U) where T == U.T {
    self.satisfier = specification.satisfied(by:)
    _debugDescription = (specification as? CustomDebugStringConvertible)?.debugDescription
  }

  // MARK: - Specification

  public func satisfied(by candidate: T) -> Bool {
    satisfier(candidate)
  }

}

extension AnySpecification: CustomDebugStringConvertible {

  public var debugDescription: String {
    _debugDescription ?? "<erased>"
  }

}

extension Specification {

  public func erasured() -> AnySpecification<T> {
    AnySpecification(self)
  }

}
