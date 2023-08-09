// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "WaniKaniClient",
    platforms: [
        .iOS(.v11), .macOS(.v10_13), .tvOS(.v11)
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
