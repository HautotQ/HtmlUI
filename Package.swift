// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "HtmlUI",
    platforms: [
        .macOS(.v13), .iOS(.v16)
    ],
    products: [
        .library(
            name: "HtmlUI",
            targets: ["HtmlUI"]
        ),
    ],
    targets: [
        .target(
            name: "HtmlUI",
            dependencies: []
        ),
        .target(
            name: "HTMLStyle",
            dependencies: []
        ),
        .target(
            name: "Protocols",
            dependencies: []
        )
        .testTarget(
            name: "HtmlUITests",
            dependencies: ["HtmlUI"]
        )
    ]
)
