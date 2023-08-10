// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "WaniKaniClient",
    platforms: [
        .iOS(.v13), .macOS(.v10_15), .tvOS(.v13)
    ],
    products: [
        .library(
            name: "WaniKaniClient",
            targets: ["WaniKaniClient"]),
    ],
    targets: [
        .target(
            name: "WaniKaniClient",
            dependencies: []),
        .testTarget(
            name: "WaniKaniClientTests",
            dependencies: ["WaniKaniClient"]),
    ]
)
