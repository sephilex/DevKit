// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "DevKit",
    platforms: [ .iOS(.v14)],
    products: [
        .library(
            name: "Core",
            targets: ["Core"]),
    ],
    dependencies: [
        .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.5.0")),
        .package(name: "RxSwiftExt", url: "https://github.com/RxSwiftCommunity/RxSwiftExt.git", .upToNextMajor(from: "6.1.0")),
        .package(name: "NSObject+Rx", url: "https://github.com/RxSwiftCommunity/NSObject-Rx.git", .upToNextMajor(from: "5.0.0")),
        .package(name: "RxDataSources", url: "https://github.com/RxSwiftCommunity/RxDataSources.git", .upToNextMajor(from: "5.0.0")),
        .package(name: "Kingfisher", url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0")),
        .package(name: "TinyConstraints", url: "https://github.com/roberthein/TinyConstraints.git", .upToNextMajor(from: "4.0.0")),
        .package(name: "Then", url: "https://github.com/devxoul/Then.git", .upToNextMajor(from: "3.0.0"))
    ],
    targets: [
        .target(
            name: "Core", 
            dependencies: ["RxSwift", "RxCocoa", "RxSwiftExt", "NSObject+Rx", "RxDataSources", "Kingfisher", "TinyConstraints", "Then"])
    ]
)