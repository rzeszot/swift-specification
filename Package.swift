// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "Specification",
  products: [
    .library(name: "Specification", targets: ["Specification"])
  ],
  targets: [
    .target(name: "Specification"),
    .testTarget(name: "SpecificationTests", dependencies: ["Specification"])
  ]
)
