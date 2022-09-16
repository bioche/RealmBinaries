// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.29.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/bioche/RealmBinaries/releases/download/\(realmVersion)"
    
#if swift(>=5.7.0)
    let xcodeVersion = "14_0"
    let realmChecksum = "2bdabb1458a0672103e62a396f34e92a02272ea6150e062d96f57d4603c607d0"
    let realmSwiftChecksum = "a21575c1dc49ea72cc4d677006599761370c3d22bb35a41c4c957017c6ccf481"
#else
    let xcodeVersion = "13_4_1"
    let realmChecksum = "6e9d67b3731ef619e38634df70e9ca2ab207a9235bcfed2add7c497bc90fc8c6"
    let realmSwiftChecksum = "2e787d57bc25e3954cfab145076c7ad7a60a02608db6802661772b06318d94f9"
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
