// swiftlint:disable type_name

public protocol Specification {
  associatedtype T
  func satisfied(by candidate: T) -> Bool
}
