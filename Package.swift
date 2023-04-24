// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "grid_status_core",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "grid_status_core",
            targets: ["grid_status_core"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "grid_status_core"),
        .testTarget(
            name: "grid_status_coreTests",
            dependencies: ["grid_status_core"]),
    ]
)
