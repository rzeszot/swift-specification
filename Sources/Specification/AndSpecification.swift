public struct AndSpecification<T, L: Specification, R: Specification>: Specification where T == L.T, T == R.T {
    let lhs: L
    let rhs: R

    public init(_ lhs: L, _ rhs: R) {
        self.lhs = lhs
        self.rhs = rhs
    }

    // MARK: - Specification

    public func satisfied(by candidate: T) -> Bool {
        lhs.satisfied(by: candidate) && rhs.satisfied(by: candidate)
    }
}

extension AndSpecification: CustomDebugStringConvertible {
    public var debugDescription: String {
        "and(\(lhs), \(rhs))"
    }
}

public extension Specification {
    func and<B: Specification>(_ other: B) -> AndSpecification<T, Self, B> {
        AndSpecification(self, other)
    }
}

extension AndSpecification: Equatable where L: Equatable, R: Equatable {

}

extension AndSpecification: Hashable where L: Hashable, R: Hashable {

}
