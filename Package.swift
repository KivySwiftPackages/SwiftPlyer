// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPlyer",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        //.library(name: "SwiftPlyer", targets: ["SwiftPlyer"]),
        .library(name: "Battery", targets: ["Battery"]),
        .library(name: "Brightness", targets: ["Brightness"]),
        .library(name: "Call", targets: ["Call"]),
        .library(name: "Flash", targets: ["Flash"]),
        .library(name: "Notification", targets: ["Notification"]),
        .library(name: "StoragePath", targets: ["StoragePath"]),
        .library(name: "TTS", targets: ["TTS"]),
        
    ],
    dependencies: [
        .package(url: "https://github.com/PythonSwiftLink/PythonSwiftLink", branch: "master"),
        .package(url: "https://github.com/PythonSwiftLink/SwiftonizePlugin", from: .init(0, 0, 2)),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftPlyer"
        ),
        .target(
            name: "Battery",
            dependencies: [
                .product(name: "SwiftonizeModules", package: "PythonSwiftLink")
            ],
            plugins: [
                .plugin(name: "Swiftonize", package: "SwiftonizePlugin")
            ]
        ),
        .target(
            name: "Brightness",
            dependencies: [
                .product(name: "SwiftonizeModules", package: "PythonSwiftLink")
            ],
            plugins: [
                .plugin(name: "Swiftonize", package: "SwiftonizePlugin")
            ]
        ),
        .target(
            name: "Call",
            dependencies: [
                .product(name: "SwiftonizeModules", package: "PythonSwiftLink")
            ],
            plugins: [
                .plugin(name: "Swiftonize", package: "SwiftonizePlugin")
            ]
        ),
        .target(
            name: "Flash",
            dependencies: [
                .product(name: "SwiftonizeModules", package: "PythonSwiftLink")
            ],
            plugins: [
                .plugin(name: "Swiftonize", package: "SwiftonizePlugin")
            ]
        ),
        .target(
            name: "Notification",
            dependencies: [
                .product(name: "SwiftonizeModules", package: "PythonSwiftLink")
            ],
            plugins: [
                .plugin(name: "Swiftonize", package: "SwiftonizePlugin")
            ]
        ),
        .target(
            name: "StoragePath",
            dependencies: [
                .product(name: "SwiftonizeModules", package: "PythonSwiftLink")
            ],
            plugins: [
                .plugin(name: "Swiftonize", package: "SwiftonizePlugin")
            ]
        ),
        .target(
            name: "TTS",
            dependencies: [
                .product(name: "SwiftonizeModules", package: "PythonSwiftLink")
            ],
            plugins: [
                .plugin(name: "Swiftonize", package: "SwiftonizePlugin")
            ]
        ),
        
        
        
        
        
        .testTarget(
            name: "SwiftPlyerTests",
            dependencies: ["SwiftPlyer"]
        ),
    ]
)
