// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "WaniKaniClient",
    platforms: [
        .iOS(.v10), .macOS(.v10_12), .tvOS(.v10), .watchOS(.v3)
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
