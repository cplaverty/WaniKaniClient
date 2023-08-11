// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "WaniKaniClient",
    platforms: [
        .iOS(.v15), .macOS(.v12), .tvOS(.v15)
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
