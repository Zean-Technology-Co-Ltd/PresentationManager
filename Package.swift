// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PresentationManager",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "PresentationManager", targets: ["PresentationManager"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Zean-Technology-Co-Ltd/FoundationEx.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "PresentationManager",
            dependencies: [
              "FoundationEx"
            ]),
        .testTarget(
            name: "PresentationManagerTests",
            dependencies: ["PresentationManager"]),
    ]
)
