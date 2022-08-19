// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.28.6"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/timstudt/RealmBinaries/releases/download/\(realmVersion)"
    
    let realmChecksum = "957c915ef31f71be56d2c8a4e59f5eeb05225a1b176d27af7f25ad2d0adb2996"
    let realmSwiftChecksum = "d5085065ff67eeb1ccddc332290b95c7180e57e8db9cd791bc2dfb2745fd2f61"
    
    return [
        .binaryTarget(
            name: "Realm",
            url: "\(baseURL)/Realm.xcframework.zip",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift.xcframework.zip",
            checksum: realmSwiftChecksum
        )
    ]
}

let package = Package(
    name: "RealmBinaries",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v11),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Realm",
            targets: ["Realm"]),
        .library(
            name: "RealmSwift",
            targets: ["RealmSwift"])
    ],
    targets: buildTargets()
)
