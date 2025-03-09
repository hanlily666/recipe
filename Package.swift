// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RecipeGenerator",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .executable(name: "RecipeGenerator", targets: ["RecipeGenerator"])
    ],
    dependencies: [
        // Dependencies go here
    ],
    targets: [
        .executableTarget(
            name: "RecipeGenerator",
            dependencies: []),
        .testTarget(
            name: "RecipeGeneratorTests",
            dependencies: ["RecipeGenerator"]),
    ]
)
