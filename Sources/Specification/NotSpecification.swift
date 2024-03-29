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

extension NotSpecification: CustomDebugStringConvertible {
    public var debugDescription: String {
        "not(\(specification))"
    }
}

public extension Specification {
    func not() -> NotSpecification<T, Self> {
        NotSpecification(self)
    }
}

extension NotSpecification: Equatable where S: Equatable {

}

extension NotSpecification: Hashable where S: Hashable {

}
