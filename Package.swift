// swift-tools-version:5.3
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
    .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0"))
  ],
  targets: [
    .target(name: "Core", dependencies: ["RxSwift", "RxCocoa"])
  ]
    // dependencies: [
    //     .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
    //     // .package(url: "https://github.com/RxSwiftCommunity/RxSwiftExt.git", .upToNextMajor(from: "6.1.0")),
    //     .package(url: "https://github.com/RxSwiftCommunity/NSObject-Rx.git", .upToNextMajor(from: "5.0.0")),
    //     // .package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", .upToNextMajor(from: "5.0.0")),
    //     .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0")),
    //     .package(url: "https://github.com/roberthein/TinyConstraints.git", .upToNextMajor(from: "4.0.0")),
    //     .package(url: "https://github.com/devxoul/Then.git", .upToNextMajor(from: "3.0.0")),
    //     .package(url: "https://github.com/SwifterSwift/SwifterSwift.git", .upToNextMajor(from: "5.0.0"))
    // ],
    // targets: [
    //     .target(
    //         name: "Core", 
    //         dependencies: ["RxSwift", "RxCocoa", "NSObject-Rx", "Kingfisher", "TinyConstraints", "Then", "SwifterSwift"])
    // ]
)