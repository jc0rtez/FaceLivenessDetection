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
            url: "https://github.com/jc0rtez/FaceLivenessDetection/releases/download/1.0.10/FaceLivenessDetection.xcframework.zip",
            checksum: "6a5cc52b6f82120e2265cf26360e9afd77e4a9db8b5388dc2b16adf0565ec109"
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
