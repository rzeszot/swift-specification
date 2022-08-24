// swiftlint:disable identifier_name

public struct AnySpecification<T>: Specification {
    let satisfier: (T) -> Bool
    let _debugDescription: String?

    public init<U: Specification>(_ specification: U) where T == U.T {
        satisfier = specification.satisfied(by:)
        _debugDescription = (specification as? CustomDebugStringConvertible)?.debugDescription
    }

    public init(satisfier: @escaping (T) -> Bool) {
        self.satisfier = satisfier
        self._debugDescription = nil
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

public extension Specification {
    func erasured() -> AnySpecification<T> {
        AnySpecification(self)
    }
}
