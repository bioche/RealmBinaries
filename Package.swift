// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if swift(>=5.5)

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
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
//        .binaryTarget(
//            name: "Realm",
//            path: "Realm.xcframework"
//        ),
//        .binaryTarget(
//            name: "RealmSwift",
//            path: "RealmSwift.xcframework"
//        ),
        .binaryTarget(
            name: "Realm",
            url: "https://github.com/bioche/RealmBinaries/releases/download/10.15.1/realm_13.zip",
            checksum: "389e2b498c1a7fba317be118f784114fac561b25a0ba1bb83673d87fc16360e2"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/bioche/RealmBinaries/releases/download/10.15.1/realmSwift_13.zip",
            checksum: "fe8d5c19dd007970a4b1ded7bab78751b631959ceebec576aa0e064fc232393c"
        )
    ]
)

#else

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
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
//        .binaryTarget(
//            name: "Realm",
//            path: "12.5.1/Realm.xcframework"
//        ),
//        .binaryTarget(
//            name: "RealmSwift",
//            path: "12.5.1/RealmSwift.xcframework"
//        ),
        .binaryTarget(
            name: "Realm",
            url: "https://github.com/bioche/RealmBinaries/releases/download/10.15.1/realm_12_5_1.zip",
            checksum: "f32a21da217bfcd962528d33ba70971b1aede6f46db4d5ae16384292de20e0c5"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/bioche/RealmBinaries/releases/download/10.15.1/realmSwift_12_5_1.zip",
            checksum: "0b7e58617887ef77dff7e74802e7809cb4ffd4444a5e0ca85b8cb3cdba063ebf"
        )
    ]
)


#endif
