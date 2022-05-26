// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.26.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/bioche/RealmBinaries/releases/download/\(realmVersion)"
    
#if swift(>=5.6.0)
    let xcodeVersion = "13_4"
    let realmChecksum = "9f14ea8bb48465a475713d4ea8aafc3f65534915e45ae0f8562b54979fad6fe0"
    let realmSwiftChecksum = "47df781f94dabafddb18e5d525d0f9bb56cfb5f0aed5ca3796f64e9ebef19d86"
#else
    let xcodeVersion = "13_3_1"
    let realmChecksum = "8a2ea9e27a0cb362e79ea72dfba0e51043f4b94831198a0db6984b6af93918de"
    let realmSwiftChecksum = "8f3a4652560d562e3ec6c70db9d8c544e096ed3a034a49699b66ea2954b86f8b"
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
