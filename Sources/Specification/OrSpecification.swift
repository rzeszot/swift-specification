public struct OrSpecification<T, L: Specification, R: Specification>: Specification where T == L.T, T == R.T {
    let lhs: L
    let rhs: R

    public init(_ lhs: L, _ rhs: R) {
        self.lhs = lhs
        self.rhs = rhs
    }

    // MARK: - Specification

    public func satisfied(by candidate: T) -> Bool {
        lhs.satisfied(by: candidate) || rhs.satisfied(by: candidate)
    }
}

extension OrSpecification: CustomDebugStringConvertible {
    public var debugDescription: String {
        "or(\(lhs), \(rhs))"
    }
}

public extension Specification {
    func or<B: Specification>(_ other: B) -> OrSpecification<T, Self, B> {
        OrSpecification(self, other)
    }
}
