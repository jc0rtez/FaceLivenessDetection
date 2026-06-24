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
            url: "https://github.com/jc0rtez/FaceLivenessDetection/releases/download/1.0.12/FaceLivenessDetection.xcframework.zip",
            checksum: "0f9f9a040b933d101f34c675fc789a87ed2fa397fa4a9f602aa709d53898dabf"
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
