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
            url: "https://github.com/jc0rtez/FaceLivenessDetection/releases/download/1.0.13/FaceLivenessDetection.xcframework.zip",
            checksum: "0db5ccbc9981a23391de7cfbd109a90227e471b473a76c95d21c07bcb952e4d3"
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
