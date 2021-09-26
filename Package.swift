// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.15.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/bioche/RealmBinaries/releases/download/\(realmVersion)"
    
    #if swift(>=5.5)
    let xcodeVersion = "13"
    let realmChecksum = "389e2b498c1a7fba317be118f784114fac561b25a0ba1bb83673d87fc16360e2"
    let realmSwiftChecksum = "fe8d5c19dd007970a4b1ded7bab78751b631959ceebec576aa0e064fc232393c"
    #else
    let xcodeVersion = "12_5_1"
    let realmChecksum = "f32a21da217bfcd962528d33ba70971b1aede6f46db4d5ae16384292de20e0c5"
    let realmSwiftChecksum = "0b7e58617887ef77dff7e74802e7809cb4ffd4444a5e0ca85b8cb3cdba063ebf"
    #endif
    
    return [
        .binaryTarget(
            name: "Realm",
            url: "\(baseURL)/Realm_\(xcodeVersion).xcframework.zip",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift_\(xcodeVersion).xcframework.zip",
            checksum: realmSwiftChecksum
        )
    ]
}

let package = Package(
    name: "RealmBinaries",
    platforms: [.iOS("13.4")],
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
