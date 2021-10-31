public struct ConjunctionSpecification<T, S: Specification>: Specification where S.T == T {
  let specifications: [S]

  public init(_ specifications: [S]) {
    self.specifications = specifications
  }

  public init(_ specifications: S...) {
    self.specifications = specifications
  }

  // MARK: - Specification

  public func satisfied(by candidate: T) -> Bool {
    for specification in specifications {
      if !specification.satisfied(by: candidate) {
        return false
      }
    }

    return true
  }

}

extension ConjunctionSpecification: CustomDebugStringConvertible where S: CustomDebugStringConvertible {

  public var debugDescription: String {
    "conjunction(\(specifications.map { $0.debugDescription }.joined(separator: ", ")))"
  }

}
