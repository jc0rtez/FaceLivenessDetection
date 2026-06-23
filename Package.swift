// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FaceLivenessDetection",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "FaceLivenessDetection",
            targets: ["FaceLivenessDetectionWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Azure/AzureAIVisionFaceUI.git", from: "1.5.0")
    ],
    targets: [
        .binaryTarget(
            name: "FaceLivenessDetectionBinary",
            url: "https://github.com/jc0rtez/FaceLivenessDetection/releases/download/1.0.4/FaceLivenessDetection.xcframework.zip",
            checksum: "b3d51d2f23fdc4d3edb0d5ca7bae4ae1d3861d63c6ae23e9317dfbc88bc4b096"
        ),
        .target(
            name: "FaceLivenessDetectionWrapper",
            dependencies: [
                "FaceLivenessDetectionBinary",
                .product(name: "AzureAIVisionFaceUI", package: "AzureAIVisionFaceUI")
            ],
            path: "Sources/FaceLivenessDetectionWrapper"
        )
    ]
)
