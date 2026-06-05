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
            url: "https://github.com/jc0rtez/FaceLivenessDetection/releases/download/1.0.0/FaceLivenessDetection.xcframework.zip",
            checksum: "9f7c0b97e7c38b1de400d7fd0893159341adfb5c5352ba1a4594824b7b82afcd"
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
