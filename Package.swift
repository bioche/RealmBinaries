// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.34.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/bioche/RealmBinaries/releases/download/\(realmVersion)"
    
#if swift(>=5.7.2)
    let xcodeVersion = "14_2"
    let realmChecksum = "ce04b1536fea18d72d5a3bc1c6ea5838aae48bb74717f7b3c6b54fa0d332c182"
    let realmSwiftChecksum = "df5b0925a02a785b14685413b3cfb61336aefa92f396a8bc8622254a0b7579f8"
#else
    let xcodeVersion = "13_4_1"
    let realmChecksum = "d4c2c4f1ca23b6f8699bcc2f771acf75da8ec0c2c1f3851df68d7f37fbb6142f"
    let realmSwiftChecksum = "986bc9988dbef675955701d58487363edae92e59ede9a69fc76fa6c5d90401d1"
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
