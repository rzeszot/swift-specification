public struct DisjunctionSpecification<T, S: Specification>: Specification where S.T == T {
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
            if specification.satisfied(by: candidate) {
                return true
            }
        }

        return false
    }
}

extension DisjunctionSpecification: CustomDebugStringConvertible where S: CustomDebugStringConvertible {
    public var debugDescription: String {
        "disjunction(\(specifications.map { $0.debugDescription }.joined(separator: ", ")))"
    }
}

extension DisjunctionSpecification: Equatable where S: Equatable {

}

extension DisjunctionSpecification: Hashable where S: Hashable {

}
